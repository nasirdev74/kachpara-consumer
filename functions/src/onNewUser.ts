import * as functions from "firebase-functions";

export const onNewUser = functions.runWith({secrets: ["CIRCLE_API_KEY", "BLOCKCHAIN", "CIRCLE_ENTITY_SECRET", "CIRCLE_WALLETSET_ID"]}).firestore.document("users/{userId}")
    .onCreate(async (snapshot, context) => {
      const userId = context.params.userId;
      // const userId = Math.floor(Math.random() * 9999999).toString();
      // console.log(userId)

      const entitySecret = `${process.env.CIRCLE_ENTITY_SECRET}`;
      const apiKey = `${process.env.CIRCLE_API_KEY}`;
      const blockchain = `${process.env.BLOCKCHAIN}`;
      const walletSetId = `${process.env.CIRCLE_WALLETSET_ID}`;

      const {initiateDeveloperControlledWalletsClient} = require("@circle-fin/developer-controlled-wallets");
      const circleDeveloperSdk = initiateDeveloperControlledWalletsClient({
        apiKey: apiKey,
        entitySecret: entitySecret,
      });

      const response = await circleDeveloperSdk.createWallets({
        accountType: "SCA",
        blockchains: [blockchain],
        count: 1,
        walletSetId: walletSetId,
        metadata: [{refId: userId}],
      });
      const {getFirestore} = await import("firebase-admin/firestore");

      // Iterate through each wallet in the response array and add it to Firestore
      response.data.wallets.forEach(async (wallet: any) => {
        try {
        // Add the wallet document to the "wallets" subcollection under the user document
          await getFirestore().collection("users").doc(userId).collection("wallets").doc(wallet.id).set(wallet);
          console.log("Wallet added to Firestore:", wallet.id);
        } catch (error) {
          console.error("Error adding wallet to Firestore:", error);
        }
      });
      console.log(response.data.wallets);
    });
