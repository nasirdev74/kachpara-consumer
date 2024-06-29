import * as functions from "firebase-functions";


export const onPayment = functions.runWith({secrets: ["STRIPE_SECRET_KEY"]}).https.onCall(async (data, context) => {
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

    const amount = data["amount"] as number;
    const currency = data["currency"] as string;
    const customer = data["customer"] as string;
    const paymentMethodId = data["payment_method"] as string;
    const confirm: boolean = data["confirm"] ? true : false; // backward compatibility for 3ds implementation


    const paymentIntent = await stripe.paymentIntents.create({
      amount: amount,
      currency: currency,
      customer: customer,
      confirm: confirm,
      // use_stripe_sdk: false,
      // return_url: "",
      description: "Payment via Cloud Functions",
      payment_method: paymentMethodId, // 4242 7/27
    }
    );
    console.log(paymentIntent.id);
    return {
      code: 200,
      paymentIntentId: paymentIntent,
      // status: paymentIntent.status,
      // next_action: paymentIntent.next_action
    };
  } catch (e) {
    console.log("onpayment error" + e);
    return {
      "code": 400,
    };
  }
});
