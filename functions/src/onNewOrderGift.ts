import * as functions from "firebase-functions";
import {messaging} from "firebase-admin";

export const onNewOrderGift = functions.firestore.document("orders/{orderId}")
    .onCreate(async (snapshot) => {
      const {getFirestore} = await import("firebase-admin/firestore");
      const order = snapshot.data();
      console.log(order);


      // create a new document for users on userOrders
      const orderSubmitter = await getFirestore().collection("users")
          .doc(order.userId).get();
      const senderName = orderSubmitter.data()?.name;
      const giftDescription = "Sana Durum+Ayran Hediye etti.";


      // ######################################## GIFT OPERATION ####################################

      // check giftTo field available
      const giftReceiverUserId = order.giftTo;
      if (giftReceiverUserId != null) {
      // add a gift document to users.gifts
        const giftsCollection = getFirestore().collection("users").doc(giftReceiverUserId).collection("gifts");
        const newGiftDoc = giftsCollection.doc();

        // Set the fields for the new gift document
        const newGiftData = {
          senderUserId: orderSubmitter.id,
          senderName: senderName,
          giftDescription: giftDescription,
          type: "GIFT",
          orderId: order.id,
          status: "ACTIVE",
        };
        newGiftDoc.set(newGiftData);

        // send push notification to gift receiver
        // send push notification to giftTousers").doc(sourceUserId);
        const userRef = getFirestore().collection("users").doc(giftReceiverUserId);
        const userDoc = await userRef.get();

        if (!userDoc.exists) {
          console.log("User document does not exist:" + giftReceiverUserId);
          return null;
        }

        const fcmToken = userDoc.data()?.fcmToken;

        // Create the message payload with the storeId and promotionId key value pairs
        const payload = {
          notification: {
            title: "Hediyen Var!",
            body: orderSubmitter.data()?.name + " sana yemek ısmarladı.",
          },
          android: {
            notification: {
              sound: "default",
              click_action: "FLUTTER_NOTIFICATION_CLICK",
            },
          },
          apns: {
            payload: {
              aps: {
                badge: 0,
                sound: "default",
              },
            },
          },
          token: fcmToken,
        };


        // Send the message using the Firebase Admin SDK
        try {
          const response = await messaging().send(payload);
          console.log("Successfully sent message:", response);
        } catch (error) {
          console.error("Error sending message:", error);
        }
      }


      return null;
    });
