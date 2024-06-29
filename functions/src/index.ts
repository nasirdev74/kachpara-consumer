import { initializeApp } from "firebase-admin/app";
import { initializeFirestore } from "firebase-admin/firestore";

const app = initializeApp();
initializeFirestore(app, { preferRest: true });

// email verification
export { sendVerificationToStudentEmail } from "./sendVerificationToStudentEmail";
export { onStudentVerification } from "./onStudentVerification";

// new User Creation
export { onNewUser } from "./onNewUser";

// orders
export { onNewOrder } from "./onNewOrder";
export { onNewOrderGift } from "./onNewOrderGift";
export { onNewOrderGenerateEvent } from "./onNewOrderGenerateEvent";

// store additions
export { onNewUserStore } from "./onNewUserStore";
export { onNewUserStoreReward } from "./onNewUserStoreReward";
export { onNewUserStoreFeed } from "./onNewUserStoreFeed";
export { addProductsFromImage } from "./addProductsFromImage";

// payments
export { onPayment } from "./onPayment";
export { onNewCardAdded } from "./onNewCardAdded";
export { onDeleteCard } from "./onDeleteCard";
export { onGetCustomerCards } from "./onGetCustomerCards";
export { onCreateNewCustomer } from "./onCreateNewCustomer";

// curations
export { onUpdateCuration } from "./onUpdateCuration";

// circle api calls
export { getTransactions } from "./getTransactions";
export { sendTransaction } from "./sendTransaction";
export { getTokensBalance } from "./getTokensBalance";
export { getTransactionDetail } from "./getTransactionDetail";

// tooling
export { cleanup } from "./cleanUp";
// export { sendFCMMessage } from "./scripts-backup/sendFCMMessage";
// export { claimFreeNotification } from "./scripts-backup/claimFreeNotification";
