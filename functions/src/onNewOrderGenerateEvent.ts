/* eslint-disable object-curly-spacing */
/* eslint-disable indent */
import * as functions from "firebase-functions";
import { messaging } from "firebase-admin";
import * as admin from "firebase-admin";
import { FeedItem, FeedType, UserType, ActionType } from "./feed";

const firestore = admin.firestore();

export const onNewOrderGenerateEvent = functions.firestore.document("orders/{orderId}")
  .onCreate(async (snapshot) => {
    const { getFirestore } = await import("firebase-admin/firestore");
    const order = snapshot.data();
    const orderId = order.id;

    console.log(order);
    // Continue with the rest of the code for batch write and user feed creation
    const productArray = order?.product || [];
    const foodNames = productArray.map((product: any) => product.name);
    const userId = order.userId;
    const storeId = order.storeId;
    const storeName = order.storeName;
    const firestoreTimestamp = admin.firestore.Timestamp.now();
    const timestamp = firestoreTimestamp.toDate().toISOString();
    const itemNames = order.product.map((product: any) => product.name);

    // Find users with contactUserIds containing order.userId in the "users" collection
    const usersCollection = getFirestore().collection("users");
    const userDoc = await usersCollection.doc(order.userId).get();

    if (!userDoc.exists) {
      console.log("User document does not exist for userId:", order.userId);
      return null;
    }

    const userName = userDoc.data()?.name;

    // Check if it is a free claim or a new order
    if (order.paymentIntentId == null) { // FREE CLAIM
      console.log("CLAIM FREE Product Event Generation");

      const promotionDoc = await getFirestore().collection(`stores/${order.storeId}/promotions/`).doc("eSQUn2FAN70E6AJOO44t").get();

      if (!promotionDoc.exists) {
        console.log("Store document does not exist for storeId:", order.storeId);
        return null;
      }

      const promotionDescription = promotionDoc.data()?.description;
      const promotionTitle = promotionDoc.data()?.title;


      const usersQuery = await usersCollection.where("contactUserIds", "array-contains", order.userId).get();

      if (!usersQuery.empty) {
        usersQuery.forEach(async (userDoc) => {
          const fcmToken = userDoc.data()?.fcmToken;
          const name = userDoc.data()?.name;
          console.log("sending to " + name);

          // Create the message payload
          const payload = {
            notification: {
              title: userName + " - " + promotionTitle,
              body: userName + " " + order.storeName + ":" + promotionDescription + " kampanyasından faydalandı!",
            },
            data: {
              storeId: order.storeId,
              promotionId: "eSQUn2FAN70E6AJOO44t",
              page: "claim_free_promotion_page",
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
        });
      } else {
        console.log("No users found for the query, no push notifications sent.");
      }


      const userFeedContent = `Askıdan Aldın: ${foodNames.join(", ")} Dükkan: ${storeName}`;
      const sharedFeedContent = `${userName} askıdan ${foodNames.join(", ")} aldı. Dükkan: ${storeName}`;

      const userFeed: FeedItem = {
        postedByStore: true,
        feedType: FeedType.ClaimFreeProduct,
        userType: UserType.User,
        actionType: [ActionType.ViewStoreDetails, ActionType.ViewRewardPage],
        ownerId: userId,
        audienceIds: [userId],
        storeId: storeId,
        posterId: "",
        reciever: "",
        sender: "",
        content: userFeedContent,
        contentUrl: [],
        storeName: "",
        timeStamp: timestamp,
        orderId: null,
      };

      const sharedFeed: FeedItem = {
        postedByStore: true,
        feedType: FeedType.ClaimFreeProduct,
        userType: UserType.Referral,
        actionType: [ActionType.ViewStoreDetails, ActionType.AddStore, ActionType.ViewRewardPage],
        ownerId: userId,
        audienceIds: [userId],
        storeId: storeId,
        posterId: "",
        reciever: "",
        sender: "",
        content: sharedFeedContent,
        contentUrl: [],
        storeName: "",
        timeStamp: timestamp,
        orderId: null,
      };
      const batch = firestore.batch();
      // find source referral code
      const userStoreRef = getFirestore().collection(`users/${userId}/stores`).doc(storeId);

      const userStoreDoc = await userStoreRef.get();

      const sourceReferralCode = userStoreDoc.data()?.sourceReferralCode;

      const referralDoc = await getFirestore().collection("referralCodes").doc(sourceReferralCode).get();

      if (referralDoc.exists) {
        const referralData = referralDoc.data();
        if (referralData) {
          const sourceUserId = referralData.ownerUserId;
          const referralContentText = `${userName} sipariş verdi. Dükkan: ${storeName}.`;
          const referralFeed: FeedItem = {
            postedByStore: true,
            feedType: FeedType.PlaceOrder,
            userType: UserType.Referral,
            actionType: [ActionType.ViewRewardPage],
            ownerId: userId,
            audienceIds: [userId],
            storeId: storeId,
            posterId: "",
            reciever: "",
            sender: "",
            content: referralContentText,
            contentUrl: [],
            storeName: "",
            timeStamp: timestamp,
            orderId: null,
          };
          const sharedFeedDoc = () => firestore.collection("users").doc(sourceUserId).collection("feed").doc().id;
          const sharedFeedDocId = sharedFeedDoc();
          const sharedFeedRef = firestore.collection("users").doc(sourceUserId).collection("feed").doc(sharedFeedDocId);
          const sharedFeedWithId = { ...referralFeed, id: sharedFeedDocId };
          batch.set(sharedFeedRef, sharedFeedWithId);
        }
      }

      const generateDocId = () => firestore.collection("users").doc(userId).collection("feed").doc().id;
      const userFeedDocId = generateDocId();
      const userFeedRef = firestore.collection("users").doc(userId).collection("feed").doc(userFeedDocId);

      const userFeedWithId = { ...userFeed, id: userFeedDocId };
      // Check if usersQuery is not empty before iterating for batch write
      if (!usersQuery.empty) {
        usersQuery.forEach(async (u) => {
          const contactFeedDoc = () => firestore.collection("users").doc(userId).collection("feed").doc().id;
          const contactFeedId = contactFeedDoc();
          const contactFeedRef = firestore.collection("users").doc(u.data().id).collection("feed").doc(contactFeedId);
          const feedSharedWithId = { ...sharedFeed, id: contactFeedId };
          batch.set(contactFeedRef, feedSharedWithId);
        });
      } else {
        console.log("No users foun");
      }

      batch.set(userFeedRef, userFeedWithId);

      try {
        // Commit the batch
        await batch.commit();
        console.log("Batch write successful");
      } catch (error) {
        console.error("Error in batch write:", error);
      }
    } else { // MOBILE ORDER
      console.log("MOBILE ORDER Event Generation");
      const userContentText = `Dükkan: ${storeName} Siparişlerin: ${itemNames.join(", ")} `;
      const sharedContentText = `${userName} sipariş verdi. Dükkan:${storeName}`;

      const feedUser: FeedItem = {
        postedByStore: true,
        feedType: FeedType.PlaceOrder,
        userType: UserType.User,
        actionType: [ActionType.ViewStoreDetails, ActionType.ViewOrderDetails],
        ownerId: userId,
        audienceIds: [userId],
        storeId: storeId,
        posterId: "",
        reciever: "",
        sender: "",
        content: userContentText,
        contentUrl: [],
        storeName: "",
        timeStamp: timestamp,
        orderId: orderId,
      };

      const sharedFeed: FeedItem = {
        postedByStore: true,
        feedType: FeedType.PlaceOrder,
        userType: UserType.SharedContact,
        actionType: [ActionType.ViewStoreDetails],
        ownerId: userId,
        audienceIds: [userId],
        storeId: storeId,
        posterId: "",
        reciever: "",
        sender: "",
        content: sharedContentText,
        contentUrl: [],
        storeName: "",
        timeStamp: timestamp,
        orderId: orderId,
      };


      // Find users with contactUserIds containing order.userId in the "users" collection
      const usersCollection = getFirestore().collection("users");
      const usersQuery = await usersCollection.where("contactUserIds", "array-contains", userId).get();
      const batch = firestore.batch();
      // Check if usersQuery is not empty before iterating for batch write
      if (!usersQuery.empty) {
        usersQuery.forEach(async (u) => {
          const contactFeedDoc = () => firestore.collection("users").doc(u.data().id).collection("feed").doc().id;
          const contactFeedDocId = contactFeedDoc();
          const contactFeedRef = firestore.collection("users").doc(u.data().id).collection("feed").doc(contactFeedDocId);
          const feedSharedWithId = { ...sharedFeed, id: contactFeedDocId };
          batch.set(contactFeedRef, feedSharedWithId);
        });
      } else {
        console.log("No users found");
      }
      // Write to the user's own feed collection
      const userFeedDoc = () => firestore.collection("users").doc(userId).collection("feed").doc().id;
      const userFeedDocId = userFeedDoc();
      const userFeedRef = firestore.collection("users").doc(userId).collection("feed").doc(userFeedDocId);
      const feedUserWithId = { ...feedUser, id: userFeedDocId };
      batch.set(userFeedRef, feedUserWithId);
      console.log(feedUser);
      try {
        // Commit the batch
        await batch.commit();
        console.log("Batch write successful");
      } catch (error) {
        console.error("Error in batch write:", error);
      }
    }

    return null;
  });
