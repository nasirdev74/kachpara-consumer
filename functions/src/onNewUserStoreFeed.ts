/* eslint-disable object-curly-spacing */


import * as functions from "firebase-functions";
import * as admin from "firebase-admin";
import { Timestamp, getFirestore } from "firebase-admin/firestore";
import { FeedType, UserType, ActionType, FeedItem } from "./feed";

const firestore = admin.firestore();

export const onNewUserStoreFeed = functions.firestore.document("users/{userId}/stores/{storeId}").onCreate(async (snapshot, context) => {
  try {
    const data = snapshot.data();
    const firestoreTimestamp = Timestamp.now();
    const timestamp = firestoreTimestamp.toDate().toISOString();
    // const userName = data.userName;
    const storeName = data.name;
    const storeId = data.id;
    // const userId = data.userId;
    const sourceReferralCode = data.sourceReferralCode;
    const userId = context.params.userId;

    const userRef = await getFirestore().collection("users").doc(userId).get();
    const userName = userRef.data()?.name;
    const referralDoc = await getFirestore().collection("referralCodes").doc(sourceReferralCode).get();

    const userContentText = `Yeni bir dükkan ekledin: ${storeName} via ${sourceReferralCode}`;
    const sharedContentText = `${userName} yeni bir dükkan ekledi. ${storeName} via ${sourceReferralCode}`;
    const batch = firestore.batch();

    const feedUser: FeedItem = {
      postedByStore: true,
      feedType: FeedType.StoreAddition,
      userType: UserType.User,
      actionType: [ActionType.ViewStoreDetails],
      ownerId: userId,
      audienceIds: [userId],
      storeId: storeId,
      posterId: "",
      reciever: "",
      sender: "",
      content: userContentText,
      contentUrl: [],
      storeName: storeName,
      timeStamp: timestamp,
      orderId: null,
    };

    const sharedFeed: FeedItem = {
      postedByStore: true,
      feedType: FeedType.StoreAddition,
      userType: UserType.SharedContact,
      actionType: [ActionType.ViewStoreDetails, ActionType.AddStore],
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
      orderId: null,
    };

    if (referralDoc.exists) {
      const referralData = referralDoc.data();
      if (referralData) {
        const sourceUserId = referralData.ownerUserId;
        const referralContentText = `${userName} kodunuzu kullanarak mağaza ${storeName} eklendi.`;
        const referralFeed: FeedItem = {
          postedByStore: true,
          feedType: FeedType.StoreAddition,
          userType: UserType.Referral,
          actionType: [ActionType.ViewStoreDetails],
          ownerId: sourceUserId,
          audienceIds: [sourceUserId],
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
        const refferalFeedDocId = sharedFeedDoc();
        const refferalFeedRef = firestore.collection("users").doc(sourceUserId).collection("feed").doc(refferalFeedDocId);
        const sharedFeedWithId = { ...referralFeed, id: refferalFeedRef };
        batch.set(refferalFeedRef, sharedFeedWithId);
      }
    }

    const generateDocId = () => firestore.collection("users").doc(userId).collection("feed").doc().id;


    // Find users with contactUserIds containing order.userId in the "users" collection
    const usersCollection = getFirestore().collection("users");
    // const userDoc = await usersCollection.doc(userId).get();

    const userFeedDocId = generateDocId();

    const userFeedRef = firestore.collection("users").doc(userId).collection("feed").doc(userFeedDocId);

    const feedUserWithId = { ...feedUser, id: userFeedDocId };

    batch.set(userFeedRef, feedUserWithId);
    const usersQuery = await usersCollection.where("contactUserIds", "array-contains", userId).get();

    // Check if usersQuery is not empty before iterating for batch write
    if (!usersQuery.empty) {
      usersQuery.forEach(async (u) => {
        const contactFeed = () => firestore.collection("users").doc(u.data().id).collection("feed").doc().id;
        const contactFeedId = contactFeed();
        const contactFeedRef = firestore.collection("users").doc(u.data().id).collection("feed").doc(contactFeedId);
        const feedSharedWithId = { ...sharedFeed, id: contactFeedId };
        batch.set(contactFeedRef, feedSharedWithId);
      });
    } else {
      console.log("No users foun");
    }

    try {
      // Commit the batch
      await batch.commit();
      console.log("Batch write successful");
    } catch (error) {
      console.error("Error in batch write:", error);
    }

    console.log(feedUser);
    return { success: true };
  } catch (error) {
    console.error("Error writing document:", error);
    throw new functions.https.HttpsError("internal", "Internal server error");
  }
});

