import * as functions from "firebase-functions";


export const onNewCardAdded = functions.runWith({secrets: ["STRIPE_SECRET_KEY"]}).https.onCall(async (data, context) => {
  try {
    if (!context.auth) {
      // Throwing an HttpsError so that the client gets the error details.
      throw new functions.https
          .HttpsError("failed-precondition", "The function must be called " +
          "while authenticated.");
    }
    const {Stripe} = await import("stripe");

    const apiVersion = "2022-11-15";
    const stripeKey = `${process.env.STRIPE_SECRET_KEY}`;
    const stripe = new Stripe(stripeKey, {apiVersion});

    const value = data;
    console.log(value);
    const paymentMethod = await stripe.paymentMethods.create(data);

    const uid = context.auth.uid;
    console.log("user is " + uid);

    const {getFirestore} = await import("firebase-admin/firestore");
    const user = await getFirestore().collection("users")
        .doc(uid).get();
    const userData: { [key: string]: undefined } =
      user.data() as { [key: string]: undefined };

    console.log("user data is " + userData);
    const customerId = userData.customerId;
    console.log(paymentMethod);
    if (customerId == null) {
      console.log("customerId is null");
      return {
        "code": 400,
      };
    }
    await stripe.paymentMethods.attach(
        paymentMethod["id"],
        {customer: customerId}
    );

    return {
      "code": 200,
      "id": paymentMethod.id,
      "brand": paymentMethod.card?.brand,
      "month": paymentMethod.card?.exp_month,
      "year": paymentMethod.card?.exp_year,
      "last4": paymentMethod.card?.last4,
    };
  } catch (error) {
    console.log(error);
    return {
      "code": 400,
    };
  }
});
