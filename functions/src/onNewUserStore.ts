import * as functions from "firebase-functions";
const axios = require("axios");

const generateRandomCode = () => {
  const letters = "ABCDEFGHJKLMNPRSTUVYZ"; // Exclude 'O'
  const digits = "123456789"; // Exclude '0'

  let code = "";

  for (let i = 0; i < 3; i++) {
    code += letters.charAt(Math.floor(Math.random() * letters.length));
  }

  for (let i = 0; i < 3; i++) {
    code += digits.charAt(Math.floor(Math.random() * digits.length));
  }

  return code;
};

/**
 * This is a JSDoc comment for the addOutreachEntry function.
 *
 * @param {any} userId - Description of the userId parameter.
 * @param {string} storeId - Description of the storeId parameter.
 * @param {any} sourceUserId - Description of the sourceUserId parameter.
 * @return {Promise<void>} Description of the return value.
 */
// async function addOutreachEntry(userId: any, storeId: string, sourceUserId: any) {
//   const {getFirestore} = await import("firebase-admin/firestore");
//   const sourceUserStoreRef = getFirestore().collection(`users/${sourceUserId}/stores`).doc(storeId);

//   getFirestore().runTransaction(async (transaction) => {
//     const sourceUserStoreDoc = await transaction.get(sourceUserStoreRef);

//     if (!sourceUserStoreDoc.exists) {
//       console.log("Store document does not exist");
//       return;
//     }

//     const outreach = sourceUserStoreDoc.data()?.outreach || [];
//     outreach.push(userId);

//     transaction.update(sourceUserStoreRef, {outreach});
//   })
//       .then(() => {
//         console.log("User added to outreach array successfully");
//       })
//       .catch((error) => {
//         console.error("Error adding user to outreach array:", error);
//       });

//   const sourceUserStoreDoc = await sourceUserStoreRef.get();

//   // const salesManagerUserId = sourceUserStoreDoc.data()?.salesManagerUserId;

//   // if (salesManagerUserId !== "Kachpara") { // to find if we are at top
//   //   if (sourceUserStoreDoc.data()?.isSM) {
//   //     return; // Stop recursion if isSM is true
//   //   } else {
//   const sourceReferralCode = sourceUserStoreDoc.data()?.sourceReferralCode;
//   if (!sourceReferralCode) {
//     console.log("sourceReferralCode is missing");
//     return;
//   }

//   const referralDoc = await getFirestore().collection("referralCodes").doc(sourceReferralCode).get();

//   if (!referralDoc.exists) {
//     console.log("Referral code does not exist");
//     return;
//   }

//   const referralData = referralDoc.data();

//   if (!referralData) {
//     console.log("Referral data is missing");
//     return;
//   }

//   const ownerUserId = referralData.ownerUserId;

//   await addOutreachEntry(userId, storeId, ownerUserId);
//   //   }
//   // }
// }


export const onNewUserStore = functions.runWith({secrets: ["WEB_API_KEY"]}).firestore
    .document("users/{userId}/stores/{storeId}")
    .onCreate(async (snapshot) => {
      const store = snapshot.data();
      const {getFirestore} = await import("firebase-admin/firestore");

      console.log("store: " + store["id"]);
      const userId = snapshot.ref.parent.parent?.id;
      // const userId = "7Pe17rIteMYZiV7dg8WqAdlgDjy2";
      console.log("user: " + userId);
      if (userId != null) {
        const sharableReferralCode = generateRandomCode();
        const storeId = store["id"].toString();
        const sourceReferralCode = store["sourceReferralCode"].toString();
        console.log("sharableReferralCode: " + sharableReferralCode);
        console.log("sourceReferralCode: " + sourceReferralCode);

        const apiKey = `${process.env.WEB_API_KEY}`;
        const url = `https://firebasedynamiclinks.googleapis.com/v1/shortLinks?key=${apiKey}`;
        const shareableReferralDeepLink = `https://www.kachpara.com/product_list_page?storeId=${storeId}&referralCode=${sharableReferralCode}`;
        console.log(shareableReferralDeepLink);


        const response = await axios.post(url, {
          dynamicLinkInfo: {
            domainUriPrefix: "https://kachpara.com/links",
            link: shareableReferralDeepLink,
            androidInfo: {
              androidPackageName: "com.kachpara.customer_app",
            },
            iosInfo: {
              iosBundleId: "com.kachpara.ios.customer",
              iosAppStoreId: "1534517750",
            },
          },
          suffix: {
            option: "SHORT",
          },
        }, {
          headers: {
            "Content-Type": "application/json",
          },
        });

        const shareableReferralLink = response.data.shortLink;

        const shareablefreeProductDeepLink = `https://www.kachpara.com/send_gift_page?promotionId=eSQUn2FAN70E6AJOO44t&storeId=${storeId}&userId=${userId}`;
        console.log(shareablefreeProductDeepLink);


        const response2 = await axios.post(url, {
          dynamicLinkInfo: {
            domainUriPrefix: "https://kachpara.com/links",
            link: shareablefreeProductDeepLink,
            androidInfo: {
              androidPackageName: "com.kachpara.customer_app",
            },
            iosInfo: {
              iosBundleId: "com.kachpara.ios.customer",
              iosAppStoreId: "1534517750",
            },
          },
          suffix: {
            option: "SHORT",
          },
        }, {
          headers: {
            "Content-Type": "application/json",
          },
        });

        const shareablefreeProductLink = response2.data.shortLink;


        await getFirestore().collection("referralCodes").doc(sharableReferralCode).set({
          "ownerUserId": userId,
          "storeId": storeId,
          "shareableReferralLink": shareableReferralLink,
          "shareablefreeProductLink": shareablefreeProductLink,
        }, {merge: true});

        console.log("sharableReferralCode: " + sharableReferralCode + " created, storeId: " +
        storeId);


        await getFirestore().collection("users").doc(userId)
            .collection("stores").doc(storeId).set({
              "shareableReferralCode": sharableReferralCode,
              "shareableReferralLink": shareableReferralLink,
              "shareablefreeProductLink": shareablefreeProductLink,
              "totalRewards": 0,
              "totalStoreAdditions": 0,
              "totalOrders": 0,
              "isSalesManager": false,
            }, {merge: true});
        console.log("shareableReferralLink" + shareableReferralLink + " shareableReferralCode: " + sharableReferralCode + " added for userId:" + userId + " storeId: " + storeId);
        console.log("shareablefreeProductLink" + shareablefreeProductLink + "for userId:" + userId + " storeId: " + storeId);

        const referralDoc = await getFirestore().collection("referralCodes").doc(sourceReferralCode).get();

        if (!referralDoc.exists) {
          console.log("Referral code does not exist");
          await getFirestore().collection(`users/${userId}/stores`).doc(storeId).set({
            "salesManagerUserId": "Kachpara",
          }, {merge: true});
          return null;
        }

        // Get the user ID from the referralCodes document
        const referralData = referralDoc.data();

        if (!referralData) {
          console.log("Referral data is missing");
          return null;
        }

        const sourceUserId = referralData.ownerUserId;

        const userStoreRef = getFirestore().collection(`users/${sourceUserId}/stores`).doc(storeId);


        const storeDoc = await userStoreRef.get();

        if (!storeDoc.exists) {
          console.log("Store document does not exist");
          return null;
        }

        let salesManagerUserId = "";

        // Check if the store is marked as Sales Manager (isSM)
        if (storeDoc.data()?.isSM) {
        // If isSM is true, set the salesManagerUserId to the sourceUserId
          salesManagerUserId = sourceUserId;
        } else {
        // If isSM is false, set the salesManagerUserId to the value in storeDoc.salesManagerUserId
          salesManagerUserId = storeDoc.data()?.salesManagerUserId;
        }

        await getFirestore().collection(`users/${userId}/stores`).doc(storeId).set({
          "salesManagerUserId": salesManagerUserId,
        }, {merge: true});
        // Add the initial entry to the "outreach" subcollection
        // await addOutreachEntry(userId, storeId, sourceUserId);
      }
      return null;
    });

