import * as functions from "firebase-functions";


export const getTransactions = functions.runWith({ secrets: ["CIRCLE_API_KEY", "CIRCLE_ENTITY_SECRET"] }).https.onCall(async (data, context) => {
  try {
    if (!context.auth) {
      // Throwing an HttpsError so that the client gets the error details.
      throw new functions.https
        .HttpsError("failed-precondition", "The function must be called " +
          "while authenticated.");
    }

    console.log(data)
    const entitySecret = `${process.env.CIRCLE_ENTITY_SECRET}`;
    const apiKey = `${process.env.CIRCLE_API_KEY}`;

    const { initiateDeveloperControlledWalletsClient } = require("@circle-fin/developer-controlled-wallets");
    const circleDeveloperSdk = initiateDeveloperControlledWalletsClient({
      apiKey: apiKey,
      entitySecret: entitySecret,
    });
    const walletId: string = data["walletId"] as string;
    const response = await circleDeveloperSdk.listTransactions({
      walletIds: [walletId]
    });
    return {
      "code": 200,
      "cards": response.data,
    };
  } catch (error) {
    console.log(error);
    return {
      "code": 400,
    };

  }





}
);
