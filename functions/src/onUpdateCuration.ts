import * as functions from "firebase-functions";

export const onUpdateCuration = functions.firestore
    .document("curations/{curationId}")
    .onUpdate(async (change, context) => {
      const updatedCuration = change.after.data();

      // Check if the curation document has been updated
      if (updatedCuration) {
        const oldStoreIds = change.before.data()?.stores || [];
        const newStoreIds = updatedCuration.stores || [];
        const storeIds: string[] = newStoreIds.filter((storeId: string) => !oldStoreIds.includes(storeId));

        if (storeIds.length == 0) {
          console.log("No New Stores... returning:" + storeIds);
          return null;
        }
        console.log("New Stores:" + storeIds);
        const ownerUserId = updatedCuration.ownerUserId || "";

        // Extract the domain part from the curation document
        const domain = updatedCuration.domain || "";
        const {getFirestore} = await import("firebase-admin/firestore");

        // Reference to the users collection
        const usersRef = getFirestore().collection("users");

        // Query users with isStudentVerified set to true and matching studentEmail domain
        const matchingUsersQuery = usersRef.where("isStudentVerified", "==", true);

        const matchingUsersSnapshot = await matchingUsersQuery.get();

        // Create a batch object
        const batch = getFirestore().batch();

        // Iterate through matching users
        for (const userDoc of matchingUsersSnapshot.docs) {
          const userId = userDoc.id;
          const userName = userDoc.data()?.name;
          const studentEmail = userDoc.data()?.studentEmail;

          if (!studentEmail.endsWith("@" + domain)) {
            continue;
          }

          const userStoresRef = getFirestore().collection(`users/${userId}/stores`);

          // Iterate through storeIds and check if they exist in the user's stores
          for (const storeId of storeIds) {
            const storeDoc = await userStoresRef.doc(storeId).get();

            // If the store doesn't exist, create a new store document
            if (!storeDoc.exists) {
              // Query the stores collection to get the store name
              const storeData = await getFirestore().collection("stores").doc(storeId).get();
              const name = storeData.exists ? storeData.data()?.name : null;

              // Query the user's stores to get the referralCode
              const ownerUserStoresData = await getFirestore()
                  .collection(`users/${ownerUserId}/stores`)
                  .doc(storeId)
                  .get();

              // Access the data and handle the case where it might be undefined
              const sourceReferralCode = ownerUserStoresData.data()?.shareableReferralCode || null;

              // Create a new store in the user's stores
              const newStoreRef = userStoresRef.doc(storeId);

              // Add the write operation to the batch
              console.log("Add the write operation to the batch");
              batch.set(newStoreRef, {
                id: storeId,
                name,
                sourceReferralCode,
              });

              console.log(
                  "UserId:" +
                            userId +
                            " username: " +
                            userName +
                            " Store added:" +
                            name +
                            " StoreId:" +
                            storeId +
                            " sourceReferralCode:" +
                            sourceReferralCode
              );
            } else {
              console.log("skipping userId:" + userId + " username: " + userName + " storeId" + storeId);
            }
          }
        }

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
