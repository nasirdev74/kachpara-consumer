import * as functions from "firebase-functions";
export const cleanup = functions.https.onRequest(async (request, response) => {
  try {
    const testUserPhoneNo = `${process.env.TEST_PHONE_NUMBER}`;
    console.log("deleting test user %s", testUserPhoneNo);
    const {getFirestore} = await import("firebase-admin/firestore");
    const snapshot = await getFirestore()
        .collection("users")
        .where("phoneNo", "==", testUserPhoneNo)
        .get();
    if (snapshot.docs[0] == null) {
      response.sendStatus(200);
      return;
    }
    const userId = snapshot.docs[0].id;

    console.log("found test user %s with id: %s", testUserPhoneNo, userId);

    // delete orders
    const orders = await getFirestore()
        .collection("orders")
        .where("userId", "==", userId)
        .get();
    orders.forEach((doc) => {
      console.log(testUserPhoneNo, " order =>", doc.id);
      getFirestore().collection("orders").doc(doc.id).delete();
    });
    // delete referralCodes
    const referralCodes = await getFirestore()
        .collection("referralCodes")
        .where("userId", "==", userId)
        .get();
    referralCodes.forEach((doc) => {
      console.log(testUserPhoneNo, " referral =>", doc.id);
      getFirestore().collection("referralCodes").doc(doc.id).delete();
    });
    // delete user
    const userToDelete = await getFirestore().collection("users").doc(userId);
    await getFirestore().recursiveDelete(userToDelete);

    // delete user phone sign in from auth
    const {getAuth} = await import("firebase-admin/auth");
    await getAuth().deleteUser(userId);
    console.log("DELETE OPERATION COMPLETED FOR " + testUserPhoneNo);
    functions.logger.info("DELETE OPERATION COMPLETED FOR " + testUserPhoneNo);

    response.sendStatus(200);
  } catch (error) {
    functions.logger.error(error);
    response.sendStatus(500);
  }
});
