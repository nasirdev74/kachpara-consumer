import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:kachpara/main.dart' as app;

import '../robots/add_payment_methods_page_robot.dart';
import '../robots/address_list_robot.dart';
import '../robots/address_robot.dart';
import '../robots/checkout_robot.dart';
import '../robots/home_robot.dart';
import '../robots/login_robot.dart';
import '../robots/order_details_robot.dart';
import '../robots/payment_methods_page_robot.dart';
import '../robots/profile_robot.dart';
import '../robots/referral_code_entry_robot.dart';
import '../robots/register_robot.dart';
import '../robots/store_robot.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // load env variables from .env file
  await dotenv.load();

  HomeRobot homeRobot;
  ReferralCodeEntryRobot referralCodeEntryRobot;
  StoreRobot storeRobot;
  CheckoutRobot checkoutRobot;
  LoginRobot loginRobot;
  RegisterRobot registerRobot;
  OrderDetailsRobot orderDetailsRobot;
  AddressRobot addAddressRobot;
  AddressListRobot addressListRobot;
  PaymentMethodsPageRobot paymentMethodsPageRobot;
  AddPaymentMethodsPageRobot addPaymentMethodsPageRobot;
  ProfileRobot profileRobot;

  group('end-to-end test', () {
    testWidgets('whole app', (WidgetTester tester) async {
      app.initApp('test');

      homeRobot = HomeRobot(tester);
      referralCodeEntryRobot = ReferralCodeEntryRobot(tester);
      storeRobot = StoreRobot(tester);
      checkoutRobot = CheckoutRobot(tester);
      loginRobot = LoginRobot(tester);
      registerRobot = RegisterRobot(tester);
      orderDetailsRobot = OrderDetailsRobot(tester);
      addAddressRobot = AddressRobot(tester);
      addressListRobot = AddressListRobot(tester);
      paymentMethodsPageRobot = PaymentMethodsPageRobot(tester);
      addPaymentMethodsPageRobot = AddPaymentMethodsPageRobot(tester);
      profileRobot = ProfileRobot(tester);

      var studentReferralCode = dotenv.env["STUDENT_REFERRAL_CODE"];
      studentReferralCode ??= throw Exception('STUDENT_REFERRAL_CODE is required');
      var referralCode = dotenv.env["REFERRAL_CODE"];
      referralCode ??= throw Exception('REFERRAL_CODE is required');

      var phoneNumber = dotenv.env["PHONE_NUMBER"];
      phoneNumber ??= throw Exception('PHONE_NUMBER is required');

      var pinCode = dotenv.env["PIN_CODE"];
      pinCode ??= throw Exception('PIN_CODE is required');

      var newAccountFullName = dotenv.env["NEW_ACCOUNT_FULL_NAME"];
      newAccountFullName ??= throw Exception('NEW_ACCOUNT_FULL_NAME is required');

      var addressName = dotenv.env["ADDRESS_NAME"];
      addressName ??= throw Exception('ADDRESS_NAME is required');

      var address = dotenv.env["ADDRESS"];
      address ??= throw Exception('ADDRESS is required');

      var addressDirection = dotenv.env["ADDRESS_DIRECTION"];
      addressDirection ??= throw Exception('ADDRESS_DIRECTION is required');

      var creditCardNumber = dotenv.env["CREDIT_CARD_NUMBER"];
      creditCardNumber ??= throw Exception('CREDIT_CARD_NUMBER is required');

      var cvv = dotenv.env["CVV"];
      cvv ??= throw Exception('CVV is required');

      var expiryDate = dotenv.env["EXPIRY_DATE"];
      expiryDate ??= throw Exception('EXPIRY_DATE is required');

      var accountFullNameChanged = dotenv.env["ACCOUNT_FULL_NAME_CHANGED"];
      accountFullNameChanged ??= throw Exception('ACCOUNT_FULL_NAME_CHANGED is required');

      var paidProductCategory = dotenv.env["PAID_PRODUCT_CATEGORY"];
      paidProductCategory ??= throw Exception('PAID_PRODUCT_CATEGORY is required');

      var paidProductPrice = dotenv.env["PAID_PRODUCT_PRICE"];
      paidProductPrice ??= throw Exception('PAID_PRODUCT_PRICE is required');

      var donationProductCategory = dotenv.env["DONATION_PRODUCT_CATEGORY"];
      donationProductCategory ??= throw Exception('DONATION_PRODUCT_CATEGORY is required');

      var donationProductPrice = dotenv.env["DONATION_PRODUCT_PRICE"];
      donationProductPrice ??= throw Exception('DONATION_PRODUCT_PRICE is required');

      var firstPurchaseDiscountedPrice = dotenv.env["FIRST_PURCHASE_DISCOUNTED_PRICE"];
      firstPurchaseDiscountedPrice ??= throw Exception('FIRST_PURCHASE_DISCOUNTED_PRICE is required');

      var storeId = dotenv.env["STORE_ID"];
      storeId ??= throw Exception('STORE_ID is required');

      await tester.pumpAndSettle(const Duration(seconds: 5));

      // //give some time for async shareable link generation onNewUserStore
      // // await tester.pumpAndSettle(const Duration(seconds: 2));
      // await homeRobot.tapOnStore(storeId);

      // unauthenticated add to basket
      // await storeRobot.expandFirstCategory(paidProductCategory);
      // await storeRobot.addFirstProduct();
      // await storeRobot.clickOnContinue();
      await loginRobot.enterPhoneNumber(phoneNumber);
      await loginRobot.verifyPhoneNumber(pinCode);
      await registerRobot.enterFullName(newAccountFullName);
      await registerRobot.tapOnRegister();

      //add store
      await homeRobot.tapOnPlusButton();
      await homeRobot.tapOnAddStore();
      await referralCodeEntryRobot.enterReferralCode(referralCode);
      await referralCodeEntryRobot.clickAddButton();

      // // add paid product
      await homeRobot.tapOnStore(storeId);
      await storeRobot.expandFirstCategory(paidProductCategory);
      await storeRobot.addFirstProduct();

      // go to checkout
      await homeRobot.tapOnViewCart();

      //add address
      await checkoutRobot.goToAddressList();
      await addressListRobot.tapOnAddDefaultAddress();
      await addAddressRobot.enterAddressDetails(addressName, address, addressDirection);
      await addAddressRobot.tapAddButton();
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await addressListRobot.tapOnBackArrow();

      //add payment method
      await checkoutRobot.goToPaymentMethodsList();
      await paymentMethodsPageRobot.tapOnAddPaymentMethod();
      await addPaymentMethodsPageRobot.enterPaymentMethodDetails(creditCardNumber, cvv, expiryDate);
      await addPaymentMethodsPageRobot.tapAddButton();
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await paymentMethodsPageRobot.goBack();
      await tester.pumpAndSettle(const Duration(seconds: 1));

      // //submit order with first purchase promotion
      await checkoutRobot.clickPlaceOrder();
      await checkoutRobot.goToOrderDetail();
      await orderDetailsRobot.verifyOrderDetails(firstPurchaseDiscountedPrice, address);
      await tester.pumpAndSettle(const Duration(seconds: 2));
      await orderDetailsRobot.tapOnBackArrow();

      // second order without first purchase promotion
      await homeRobot.tapOnStore(storeId);
      await tester.pumpAndSettle(const Duration(seconds: 5));
      await storeRobot.expandFirstCategory(paidProductCategory);
      await storeRobot.addFirstProduct();
      await tester.pumpAndSettle(const Duration(seconds: 5));
      await homeRobot.tapOnViewCart();
      await tester.pumpAndSettle(const Duration(seconds: 2));

      await checkoutRobot.clickPlaceOrder();
      await checkoutRobot.goToOrderDetail();
      await orderDetailsRobot.verifyOrderDetails(paidProductPrice, address);
      await tester.pumpAndSettle(const Duration(seconds: 5));
      await orderDetailsRobot.tapOnBackArrow();

      // donation only
      await homeRobot.tapOnStore(storeId);
      await tester.pumpAndSettle(const Duration(seconds: 5));
      await storeRobot.expandFirstCategory(donationProductCategory);
      await storeRobot.addFirstProduct();
      await tester.pumpAndSettle(const Duration(seconds: 5));
      await homeRobot.tapOnViewCart();
      await tester.pumpAndSettle(const Duration(seconds: 5));

      await checkoutRobot.clickPlaceOrder();
      await checkoutRobot.goToOrderDetail();
      await orderDetailsRobot.verifyOrderTotal(donationProductPrice);
      await tester.pumpAndSettle(const Duration(seconds: 5));
      await orderDetailsRobot.tapOnBackArrow();

      // //show new counter
      // await homeRobot.tapOnStore(storeId);
      // await tester.pumpAndSettle(const Duration(seconds: 10));

      // profile tests
      await homeRobot.tapOnProfileButton();
      await profileRobot.tapOnEditInputName();
      await profileRobot.editInputName(accountFullNameChanged);
      await profileRobot.tapOnEditInputName();
      await profileRobot.tapOnBackButton();
      await homeRobot.tapOnProfileButton();
      await profileRobot.verifyInputData(accountFullNameChanged);

      await tester.pumpAndSettle(const Duration(seconds: 5));
    });
  });
}
