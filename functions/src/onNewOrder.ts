import * as functions from "firebase-functions";
import {messaging} from "firebase-admin";

export const onNewOrder = functions.firestore.document("orders/{orderId}")
    .onCreate(async (snapshot) => {
      const {getFirestore, FieldValue} = await import("firebase-admin/firestore");
      const order = snapshot.data();


      console.log(order);


      // create a new document for users on userOrders
      const orderSubmitter = await getFirestore().collection("users")
          .doc(order.userId).get();
      const userId = orderSubmitter.id;
      const storeId = order.storeId.toString();

      const orderId = order.id.toString();
      await getFirestore().collection("users").doc(userId)
          .collection("userOrders").doc(orderId).set(order);

      // find source referral code
      const userStoreRef = getFirestore().collection(`users/${userId}/stores`).doc(storeId);

      const userStoreDoc = await userStoreRef.get();

      if (!userStoreDoc.exists) {
        console.log("Store document does not exist");
        return null;
      }

      const sourceReferralCode = userStoreDoc.data()?.sourceReferralCode;

      // read orders from userOrders of the store.
      const orders = await getFirestore().collection("users").doc(userId)
          .collection("userOrders").where("storeId", "==", order.storeId).get();
      console.log("orders from store", orders.docs.length);

      const firstOrder = (orders.docs.length == 1);
      const querySnapshot = await getFirestore().collection("stores").where("referralCode", "==", sourceReferralCode).get();
      const freeOrder = (order.paymentIntentId == null);


      // ############################################### REWARD CALCULATION #################################
      // make sure source referral code is not store referral code and this is first purchase
      if (querySnapshot.empty && firstOrder && !freeOrder) {
      // If there is no document, check the referralCodes collection
        const referralDoc = await getFirestore().collection("referralCodes").doc(sourceReferralCode).get();

        if (!referralDoc.exists) {
          console.log("Referral code does not exist");
          return null;
        }

        // Get the user ID from the referralCodes document
        const referralData = referralDoc.data();

        if (!referralData) {
          console.log("Referral data is missing");
          return null;
        }

        const sourceUserId = referralData.ownerUserId;

        // Update the user's store with the storeId
        const userStoreRef = getFirestore().collection(`users/${sourceUserId}/stores`).doc(storeId);

        // Increment the totalStoreAdditions and totalRewards fields
        // Get the addStoreReward field of the store document with storeId
        const storeRef = getFirestore().collection("stores").doc(storeId);
        const storeDoc = await storeRef.get();

        if (!storeDoc.exists) {
          console.log("Store document does not exist");
          return null;
        }

        const firstPurchaseReward = storeDoc.data()?.firstPurchaseReward;
        const currencySymbol = storeDoc.data()?.currencySymbol;
        const storeName = storeDoc.data()?.name;
        if (!firstPurchaseReward) {
          console.log("firstPurchaseReward is missing from store document");
          return null;
        }
        const increment = FieldValue.increment(firstPurchaseReward);
        const incrementOne = FieldValue.increment(1);
        await userStoreRef.update({
          totalOrders: incrementOne,
          totalRewards: increment,
        });

        const userRef = getFirestore().collection("users").doc(sourceUserId);
        const userDoc = await userRef.get();

        if (!userDoc.exists) {
          console.log("User document does not exist:" + sourceUserId);
          return null;
        }

        const fcmToken = userDoc.data()?.fcmToken;

        // Create the message payload with the storeId and promotionId key value pairs
        const payload = {
          notification: {
            title: currencySymbol + firstPurchaseReward + " kazandınız.",
            body: storeName + " yeni bir sipariş aldı.",
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

        // Add an entry to the RewardActivities subcollection
        const activityRef = userStoreRef.collection("RewardActivities").doc(); // omitting the document ID generates a new unique ID
        await activityRef.set({
          userId: userId,
          activity: "NEW_ORDER",
          date: new Date().toISOString(),
        });
      } else {
        console.log("This referral is not eligible for reward:");
        console.log("store referral:" + sourceReferralCode);
        console.log("first purchase:" + firstOrder);
      }

      // ######################################## GIFT OPERATION ####################################

      // check giftTo field available
      // const giftReceiverUserId = order.giftTo;
      // if (giftReceiverUserId != null) {
      // // add a gift document to users.gifts
      //   const giftsCollection = getFirestore().collection("users").doc(giftReceiverUserId).collection("gifts");
      //   const newGiftDoc = giftsCollection.doc();

      //   // Set the fields for the new gift document
      //   const newGiftData = {
      //     sender: userId,
      //     type: "GIFT",
      //     orderId: order.id,
      //     status: "ACTIVE",
      //   };
      //   newGiftDoc.set(newGiftData);

      //   // send push notification to gift receiver
      //   // send push notification to giftTousers").doc(sourceUserId);
      //   const userRef = getFirestore().collection("users").doc(giftReceiverUserId);
      //   const userDoc = await userRef.get();

      //   if (!userDoc.exists) {
      //     console.log("User document does not exist:" + giftReceiverUserId);
      //     return null;
      //   }

      //   const fcmToken = userDoc.data()?.fcmToken;

      //   // Create the message payload with the storeId and promotionId key value pairs
      //   const payload = {
      //     notification: {
      //       title: "Hediyen Var!",
      //       body: orderSubmitter.data()?.name + " sana yemek ısmarladı.",
      //     },
      //     android: {
      //       notification: {
      //         sound: 'default',
      //         click_action: 'FLUTTER_NOTIFICATION_CLICK',
      //       },
      //     },
      //     apns: {
      //       payload: {
      //         aps: {
      //           badge: 1,
      //           sound: 'default'
      //         },
      //       },
      //     },
      //     token: fcmToken,
      //   };


      //   // Send the message using the Firebase Admin SDK
      //   try {
      //     const response = await messaging().send(payload);
      //     console.log("Successfully sent message:", response);
      //   } catch (error) {
      //     console.error("Error sending message:", error);
      //   }
      // }


      return null;
    });
