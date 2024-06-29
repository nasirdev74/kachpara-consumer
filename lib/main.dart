import 'package:firebase_app_check/firebase_app_check.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:kachpara/app/app.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/data/models/cart_model.dart';
import 'package:kachpara/firebase_options.dart';

import 'core/bloc_observer.dart';

void main() async {
  final cartModel =  CartModel(restaurantId: '23', items: []);
  cartModel.toJson();
  await initApp('prod');
}

initApp([String environment = 'prod']) async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  if (!kReleaseMode) {
    Stripe.publishableKey = "";
  } else {
    Stripe.publishableKey = "";
  }
  await Stripe.instance.applySettings();
  if (!kReleaseMode) {
    FirebaseCrashlytics.instance.setCrashlyticsCollectionEnabled(false);
  } else {
    FlutterError.onError = (errorDetails) {
      FirebaseCrashlytics.instance.recordFlutterFatalError(errorDetails);
    };
    // Pass all uncaught asynchronous errors that aren't handled by the Flutter framework to Crashlytics
    PlatformDispatcher.instance.onError = (error, stack) {
      FirebaseCrashlytics.instance.recordError(error, stack, fatal: true);
      return true;
    };
  }

  FirebaseMessaging messaging = FirebaseMessaging.instance;

  NotificationSettings settings = await messaging.requestPermission(
    alert: true,
    announcement: false,
    badge: true,
    carPlay: false,
    criticalAlert: false,
    provisional: false,
    sound: true,
  );

  print('User granted permission: ${settings.authorizationStatus}');

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  await FirebaseAppCheck.instance.activate(androidProvider: environment == 'prod' ? AndroidProvider.playIntegrity : AndroidProvider.debug);
  await configureDependencies();
  Bloc.observer = MyBlocObserver();
  runApp(MyApp());
}

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
  print("Handling a background message: ${message.messageId}");
}
