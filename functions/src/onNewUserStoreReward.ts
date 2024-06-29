import {FieldValue} from "firebase-admin/firestore";
import {messaging} from "firebase-admin";
import * as functions from "firebase-functions";

export const onNewUserStoreReward = functions.firestore
    .document("users/{userId}/stores/{storeId}")
    .onCreate(async (snapshot) => {
      const store = snapshot.data();
      const userId = snapshot.ref.parent.parent?.id;
      // const userId = "Sj6lwhRwLEcVsFFftztBcPu3K2L2";
      const storeId = store["id"].toString();
      const sourceReferralCode = store["sourceReferralCode"].toString();

      const {getFirestore} = await import("firebase-admin/firestore");
      const querySnapshot = await getFirestore().collection("stores").where("referralCode", "==", sourceReferralCode).get();

      if (querySnapshot.empty) {
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

        const addStoreReward = storeDoc.data()?.addStoreReward;
        if (addStoreReward) {
          const increment = FieldValue.increment(addStoreReward);
          await userStoreRef.update({
            totalRewards: increment,
          });
        } else {
          console.log("addStoreReward is missing from store document");
          console.log("skipping addStore Reward");
        }

        const incrementOne = FieldValue.increment(1);
        await userStoreRef.update({
          totalStoreAdditions: incrementOne,
        });

        const userRef = getFirestore().collection("users").doc(sourceUserId);
        const userDoc = await userRef.get();

        if (!userDoc.exists) {
          console.log("User document does not exist:" + sourceUserId);
          return null;
        }

        const fcmToken = userDoc.data()?.fcmToken;

        // Create the message payload with the storeId and promotionId key value pairs
        let payload = null;
        const storeName = storeDoc.data()?.name;
        if (addStoreReward) {
          const currencySymbol = storeDoc.data()?.currencySymbol;

          payload = {
            notification: {
              title: currencySymbol + addStoreReward + " kazandınız.",
              body: storeName + " yeni bir kişi tarafından eklendi.",
            },
            android: {
              notification: {
                sound: "default",
                clickAction: "FLUTTER_NOTIFICATION_CLICK",
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
        } else { // no addStoreReward
          payload = {
            notification: {
              title: "Yeni Ekleme:" + storeName,
              body: storeName + " yeni bir kişi tarafından eklendi.",
            },
            android: {
              notification: {
                sound: "default",
                clickAction: "FLUTTER_NOTIFICATION_CLICK",
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
        }
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
          activity: "STORE_ADDITION",
          date: new Date().toISOString(),
        });
      } else {
        console.log("This referral is by store referral:" + sourceReferralCode);
      }

      return null;
    });
