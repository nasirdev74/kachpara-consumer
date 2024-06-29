import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:kachpara/main.dart' as app;

import '../robots/google_map_robot.dart';
import '../robots/home_robot.dart';
import '../robots/login_robot.dart';
import '../robots/onboard_robot.dart';
import '../robots/store_robot.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // load env variables from .env file
  await dotenv.load();

  HomeRobot homeRobot;
  StoreRobot storeRobot;
  LoginRobot loginRobot;
  GoogleMapRobot googleMapRobot;
  OnboardRobot onboardRobot;

  group('end-to-end test', () {
    testWidgets('whole app', (WidgetTester tester) async {
      app.initApp('test');

      homeRobot = HomeRobot(tester);
      storeRobot = StoreRobot(tester);
      loginRobot = LoginRobot(tester);
      googleMapRobot = GoogleMapRobot(tester);
      onboardRobot = OnboardRobot(tester);

      var studentPhoneNumber = dotenv.env["STUDENT_PHONE_NUMBER"];
      studentPhoneNumber ??= throw Exception('STUDENT_PHONE_NUMBER is required');

      var studentPinCode = dotenv.env["STUDENT_PIN_CODE"];
      studentPinCode ??= throw Exception('STUDENT_PIN_CODE is required');

      var storeId = dotenv.env["STORE_ID"];
      storeId ??= throw Exception('STORE_ID is required');

      await tester.pumpAndSettle(const Duration(seconds: 5));

      // login

      await loginRobot.enterPhoneNumber(studentPhoneNumber);
      await loginRobot.verifyPhoneNumber(studentPinCode);

      //add store
      await homeRobot.tapOnPlusButton();
      await homeRobot.tapOnAddFromGoogle();

      await googleMapRobot.enterKeyword("Istanbul Restaurant");
      await googleMapRobot.selectFromSearchResults();
      await googleMapRobot.clickSaveButton();

      homeRobot.tapOnStore(storeId); // what about new?
      onboardRobot.verifyReferralCode();
      onboardRobot.verifyOutReach(0);

      await tester.pumpAndSettle(const Duration(seconds: 5));
    });
  });
}
