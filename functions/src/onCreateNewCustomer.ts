import * as functions from "firebase-functions";

export const onCreateNewCustomer = functions.runWith({secrets: ["STRIPE_SECRET_KEY"]}).https
    .onCall(async (data, context) => {
      try {
        if (!context.auth) {
        // Throwing an HttpsError so that the client gets the error details.
          throw new functions.https
              .HttpsError("failed-precondition",
                  "The function must be called " +
            "while authenticated.");
        }
        const value = data;
        console.log(value);


        const {Stripe} = await import("stripe");

        const apiVersion = "2022-11-15";
        const stripeKey = `${process.env.STRIPE_SECRET_KEY}`;
        const stripe = new Stripe(stripeKey, {apiVersion});
        const customer = await stripe.customers.create(data);

        const {getFirestore} = await import("firebase-admin/firestore");
        await getFirestore().collection("users")
            .doc(context.auth?.uid ?? "")
            .update({"customerId": customer.id});
        console.log(customer);
        return {
          "code": 200,
          "customerId": customer.id,
        };
      } catch (error) {
        console.log(error);
        return {
          "code": 400,
        };
      }
    });
