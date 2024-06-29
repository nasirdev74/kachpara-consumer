import * as functions from "firebase-functions";


export const onDeleteCard = functions.runWith({secrets: ["STRIPE_SECRET_KEY"]}).https.onCall(async (data, context) => {
  try {
    if (!context.auth) {
      // Throwing an HttpsError so that the client gets the error details.
      throw new functions.https
          .HttpsError("failed-precondition", "The function must be called " +
            "while authenticated.");
    }
    const value = data;
    console.log(value);
    const {Stripe} = await import("stripe");

    const apiVersion = "2022-11-15";
    const stripeKey = `${process.env.STRIPE_SECRET_KEY}`;
    const stripe = new Stripe(stripeKey, {apiVersion});

    await stripe.paymentMethods.detach(data["paymentMethodId"]);
    return {
      "code": 200,
    };
  } catch (error) {
    console.log(error);
    return {
      "code": 400,
    };
  }
});
