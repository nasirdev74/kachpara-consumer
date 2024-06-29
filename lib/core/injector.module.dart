import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@module
abstract class RegisterModule {
  @singleton
  FirebaseFirestore get firestore {
    final firestore = FirebaseFirestore.instance;
    return firestore;
  }

  @singleton
  FirebaseFunctions get functions {
    final functions = FirebaseFunctions.instance;
    if (!kReleaseMode) {
      functions.useFunctionsEmulator("127.0.0.1", 5001);
    }
    return functions;
  }

  @singleton
  FirebaseAuth get auth {
    final auth = FirebaseAuth.instance;
    if (!kReleaseMode) {
      auth.setSettings(appVerificationDisabledForTesting: true);
    }
    return auth;
  }

  @singleton
  FirebaseAnalytics get analytics {
    final analytics = FirebaseAnalytics.instance;
    return analytics;
  }

  @singleton
  FirebaseMessaging get messaging {
    final messaging = FirebaseMessaging.instance;
    return messaging;
  }
}
