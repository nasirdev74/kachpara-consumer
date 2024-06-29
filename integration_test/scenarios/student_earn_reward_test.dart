import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';
import 'package:kachpara/main.dart' as app;

import '../robots/home_robot.dart';
import '../robots/login_robot.dart';
import '../robots/reward_share_robot.dart';
import '../robots/store_robot.dart';

void main() async {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  // load env variables from .env file
  await dotenv.load();

  HomeRobot homeRobot;
  StoreRobot storeRobot;
  LoginRobot loginRobot;
  RewardShareRobot rewardShareRobot;

  group('end-to-end test', () {
    testWidgets('whole app', (WidgetTester tester) async {
      app.initApp('test');

      homeRobot = HomeRobot(tester);
      storeRobot = StoreRobot(tester);
      loginRobot = LoginRobot(tester);
      rewardShareRobot = RewardShareRobot(tester);

      var studentPhoneNumber = dotenv.env["STUDENT_PHONE_NUMBER"];
      studentPhoneNumber ??= throw Exception('STUDENT_PHONE_NUMBER is required');

      var studentPinCode = dotenv.env["STUDENT_PIN_CODE"];
      studentPinCode ??= throw Exception('STUDENT_PIN_CODE is required');

      var storeId = dotenv.env["STORE_ID"];
      storeId ??= throw Exception('STORE_ID is required');

      await tester.pumpAndSettle(const Duration(seconds: 5));

      // login
      // await homeRobot.tapOnMenuButton();
      // await homeRobot.tapOnLoginButton();
      await loginRobot.enterPhoneNumber(studentPhoneNumber);
      await loginRobot.verifyPhoneNumber(studentPinCode);

      // //add store
      // await homeRobot.tapOnPlusButton();
      // await referralCodeEntryRobot.enterReferralCode(referralCode);
      // await referralCodeEntryRobot.clickAddButton();

      const totalRewards = "₺3.0";
      const fppReward = "₺10";
      const addStoreReward = "₺1";
      const totalOrders = "0";
      const totalStoreAdditons = "3";
      const shareableReferralLink = "https://kachpara.com/links/Wx31";
      await homeRobot.tapOnRewardShare(storeId);

      // await rewardShareRobot.verifyShareableReferralLink(shareableReferralLink);
      // await rewardShareRobot.verifyTotalRewards(totalRewards);
      // await rewardShareRobot.verifTotalStoreAdditions(totalStoreAdditons);
      // await rewardShareRobot.verifyTotalOrders(totalOrders);
      // await rewardShareRobot.verifyFPPReward(fppReward);
      // await rewardShareRobot.verifyAddStoreReward(addStoreReward);

      await tester.pumpAndSettle(const Duration(seconds: 5));
    });
  });
}
