import * as functions from "firebase-functions";

export const onGetCustomerCards = functions.runWith({secrets: ["STRIPE_SECRET_KEY"]}).https
    .onCall(async (data, context) => {
      try {
        if (!context.auth) {
        // Throwing an HttpsError so that the client gets the error details.
          throw new functions.https
              .HttpsError("failed-precondition",
                  "The function must be called " +
            "while authenticated.");
        }
        const customerId: string = data["customerId"] as string;

        const {Stripe} = await import("stripe");

        const apiVersion = "2022-11-15";
        const stripeKey = `${process.env.STRIPE_SECRET_KEY}`;
        const stripe = new Stripe(stripeKey, {apiVersion});

        const paymentMethods = await stripe.paymentMethods.list(
            {type: "card", customer: customerId}
        );
        return {
          "code": 200,
          "cards": paymentMethods.data,
        };
      } catch (error) {
        console.log(error);
        return {
          "code": 400,
        };
      }
    });
