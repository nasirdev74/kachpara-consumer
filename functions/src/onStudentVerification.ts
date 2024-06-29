
import * as functions from "firebase-functions";

export const onStudentVerification = functions.firestore
    .document("users/{userId}")
    .onUpdate(async (change, context) => {
      const userId = context.params.userId;
      const updatedUser = change.after.data();

      // Check if isStudentVerified is set to true
      if (updatedUser.isStudentVerified === true) {
      // Extract the domain part from the studentEmail
        const studentEmail = updatedUser.studentEmail || "";
        const emailParts = studentEmail.split("@");
        const domain = emailParts.length > 1 ? emailParts[1] : "";

        const {getFirestore} = await import("firebase-admin/firestore");
        // Query the curations collection by the 'domain' field
        const curationsRef = getFirestore().collection("curations").where("domain", "==", domain);

        // Get the single curation document
        const curationsSnapshot = await curationsRef.limit(1).get();

        // Check if the query returned any documents
        if (!curationsSnapshot.empty) {
          const doc = curationsSnapshot.docs[0];
          const storeIds = doc.data().stores || [];

          // Reference to the user's stores collection
          const userStoresRef = getFirestore().collection(`users/${userId}/stores`);

          // Iterate through storeIds and check if they exist in the user's stores
          for (const storeId of storeIds) {
            const storeDoc = await userStoresRef.doc(storeId).get();

            // If the store doesn't exist, create a new store document
            if (!storeDoc.exists) {
            // Get the ownerUserId from the curation document
              const ownerUserId = doc.data().ownerUserId;
              // Query the stores collection to get the store name
              const storeData = await getFirestore().collection("stores").doc(storeId).get();
              const name = storeData.exists ? storeData.data()?.name : null;

              // Query the user's stores to get the referralCode
              const ownerUserStoresData = await getFirestore().collection(`users/${ownerUserId}/stores`).doc(storeId).get();

              // Access the data and handle the case where it might be undefined
              const sourceReferralCode = ownerUserStoresData.data()?.shareableReferralCode || null;

              // Create a new store in the user's stores
              const newStoreRef = userStoresRef.doc(storeId);
              await newStoreRef.set({
                id: storeId,
                name,
                sourceReferralCode,
              });
            }
          }
        }
      }

      return null;
    });
