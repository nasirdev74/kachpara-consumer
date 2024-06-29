import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:kachpara/main.dart' as app;

import '../robots/add_student_email_robot.dart';
import '../robots/all_promotion_robot.dart';
import '../robots/claim_free_promotion_robot.dart';
import '../robots/home_robot.dart';
import '../robots/login_robot.dart';
import '../robots/order_details_robot.dart';
import '../robots/order_success_robot.dart';
import '../robots/profile_robot.dart';
import '../robots/store_robot.dart';

void main() {
  group(
    "end-to-end test",
    () {
      IntegrationTestWidgetsFlutterBinding.ensureInitialized();

      setUpAll(() async {
        // load env variables from .env file
        await dotenv.load();
      });

      HomeRobot homeRobot;

      LoginRobot loginRobot;
      AllPromotionRobot allPromotionRobot;
      ClaimFreePromotionRobot claimFreePromotionRobot;
      OrderDetailsRobot orderDetailsRobot;
      OrderSuccessRobot orderSuccessRobot;
      ProfileRobot profileRobot;
      AddStudentEmailRobot addStudentEmailRobot;
      StoreRobot storeRobot;

      testWidgets(
        "claim_free_promotion",
        (tester) async {
          app.initApp('test');
          homeRobot = HomeRobot(tester);
          loginRobot = LoginRobot(tester);
          orderDetailsRobot = OrderDetailsRobot(tester);
          orderSuccessRobot = OrderSuccessRobot(tester);
          allPromotionRobot = AllPromotionRobot(tester);
          claimFreePromotionRobot = ClaimFreePromotionRobot(tester);
          profileRobot = ProfileRobot(tester);
          addStudentEmailRobot = AddStudentEmailRobot(tester);
          storeRobot = StoreRobot(tester);

          var storeId = dotenv.env["STORE_ID"];
          storeId ??= throw Exception('STORE_ID is required');

          var referralCode = dotenv.env["REFERRAL_CODE"];
          referralCode ??= throw Exception('REFERRAL_CODE is required');

          var phoneNumber = dotenv.env["PHONE_NUMBER"];
          phoneNumber ??= throw Exception('PHONE_NUMBER is required');

          var pinCode = dotenv.env["PIN_CODE"];
          pinCode ??= throw Exception('PIN_CODE is required');

          var storeAddress = dotenv.env["STORE_ADDRESS"];
          storeAddress ??= throw Exception('STORE_ADDRESS is required');

          var studentEmail = dotenv.env["STUDENT_EMAIL"];
          studentEmail ??= throw Exception('STUDENT_EMAIL is required');

          var emailVerificationCode = dotenv.env["EMAIL_VERIFICATION_CODE"];
          emailVerificationCode ??= throw Exception('EMAIL_VERIFICATION_CODE is required');

          var counter = dotenv.env["FREE_PROMOTION_COUNTER"];
          counter ??= throw Exception('FREE_PROMOTION_COUNTER is required');

          await tester.pumpAndSettle(const Duration(seconds: 5));

          // login
          // await homeRobot.tapOnMenuButton();
          // await homeRobot.tapOnLoginButton();
          await loginRobot.enterPhoneNumber(phoneNumber);
          await loginRobot.verifyPhoneNumber(pinCode);

          // verify student email
          await homeRobot.tapOnProfileButton();
          await profileRobot.tapOnEditInputStudentEmail();
          await tester.pumpAndSettle(const Duration(seconds: 1));
          await addStudentEmailRobot.putEmail(studentEmail);
          await tester.pumpAndSettle(const Duration(seconds: 1));
          await addStudentEmailRobot.tapOnVerifyStudentEmail();
          await addStudentEmailRobot.verifyEmailCode(emailVerificationCode);
          await tester.pumpAndSettle(const Duration(seconds: 1));
          await profileRobot.verifyStudentEmail(studentEmail);
          await profileRobot.tapOnBackButton();

          // check free food campaign
          await homeRobot.tapOnStore(storeId);
          await storeRobot.tapOnPromotions();
          await tester.pumpAndSettle(const Duration(seconds: 1));
          await allPromotionRobot.waitAndtapOnFreePromotion();
          await tester.pumpAndSettle(const Duration(seconds: 5));

          // claim free food
          await claimFreePromotionRobot.tapOnSubmitMyOrder();
          // await orderSuccessRobot.tapOnTrackOrder();
          // await orderDetailsRobot.verifyOrderDetails("₺0.0", storeAddress);
          await tester.pumpAndSettle(const Duration(seconds: 5));
        },
      );
    },
  );
}
