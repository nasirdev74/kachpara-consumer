import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

import '../../../utils/result.dart';
import '../../models/user_model.dart';

enum PhoneAuthState { initial, codeSent, codeAutoRetrieval, codeVerified, failed }

@injectable
class AuthData {
  AuthData(this._firestore, this._auth);
  final FirebaseAuth _auth;
  final FirebaseFirestore _firestore;

  String? verificationId;
  PhoneAuthCredential? _credential;
  int? forceResendingCode;
  PhoneAuthState phoneAuthState = PhoneAuthState.initial;

  Stream<Result<bool>> signInWithPhoneNumber(String phoneNo) async* {
    StreamController<Result<bool>> controller = StreamController();
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNo,
          verificationCompleted: (credential) {
            _credential = credential;
          },
          verificationFailed: (error) {
            debugPrint('verification failed');
            controller.add(Result.error(error.message ?? ''));
            controller.close();
          },
          codeSent: (verificationId, forceResendingToken) {
            this.verificationId = verificationId;
            forceResendingCode = forceResendingToken;
            debugPrint('code sent');
            controller.add(const Result.success(true));

            controller.close();
          },
          codeAutoRetrievalTimeout: (verificationId) {
            this.verificationId = verificationId;
          });
    } catch (e) {
      if (kDebugMode) {
        print('AuthData: login: error: $e');
      }
      controller.add(Result.error(e.toString()));
      controller.close();
    }
    yield* controller.stream;
  }

  Future<Result<bool>> logout() async {
    try {
      await _auth.signOut();
      return const Result.success(true);
    } catch (e) {
      return Result.error(e.toString());
    }
  }

  Future<Result<bool>> resendVerificationCode(String phoneNumber) async {
    try {
      await _auth.verifyPhoneNumber(
          phoneNumber: phoneNumber,
          verificationCompleted: (phoneAuthCredential) {},
          verificationFailed: (error) {},
          codeSent: (verificationId, forceResendingToken) {},
          codeAutoRetrievalTimeout: (verificationId) {},
          forceResendingToken: forceResendingCode);
      return const Result.success(true);
    } catch (e) {
      if (kDebugMode) {
        print('AuthData: resending SMS failed: error: $e');
      }

      return Result.error(e.toString());
    }
  }

  Future<Result<UserModel?>> verifyCode(String code, String phoneNumber) async {
    try {
      _credential ??= PhoneAuthProvider.credential(
        verificationId: verificationId ?? '',
        smsCode: code,
      );
      await _auth.signInWithCredential(_credential!);

      final coll = await _firestore.collection("users").where("phoneNo", isEqualTo: phoneNumber).get();

      if (coll.docs.isNotEmpty) {
        final user = await _firestore.collection('users').doc(_auth.currentUser!.uid).get();
        final uidEntries = <String, String>{"id": _auth.currentUser!.uid};
        final userData = Map<String, dynamic>.from(user.data()!)..addEntries(uidEntries.entries);
        return Result.success(UserModel.fromJson(userData));
      }
      await _firestore
          .collection('users')
          .doc(_auth.currentUser?.uid)
          .set({"id": _auth.currentUser?.uid, "phoneNo": _auth.currentUser?.phoneNumber}, SetOptions(merge: true));
      return const Result.success(null);
    } on FirebaseAuthException catch (e) {
      switch (e.code) {
        case "provider-already-linked":
          print("The provider has already been linked to the user.");
          break;
        case "invalid-credential":
          print("The provider's credential is not valid.");
          break;
        case "credential-already-in-use":
          print("The account corresponding to the credential already exists, "
              "or is already linked to a Firebase User.");
          // return signInWithCredentials(code);
          break;
        // See the API reference for the full list of error codes.
        default:
          print("Unknown error.");
      }
      return Result.error(e.toString());
    }
  }

  Future<UserModel> getUser(String uid) async {
    try {
      final user = await _firestore.collection('users').doc(uid).get();
      final uidEntries = <String, String>{"id": _auth.currentUser!.uid};
      final userData = Map<String, dynamic>.from(user.data()!)..addEntries(uidEntries.entries);
      return UserModel.fromJson(userData);
    } catch (e) {
      if (kDebugMode) {
        print('AuthData: getUser: error: $e');
      }
      rethrow;
    }
  }

  Future<UserModel> createUser(String uid) async {
    try {
      _firestore.collection('users').doc(uid).set({"id": uid}, SetOptions(merge: true));

      return UserModel(id: uid);
    } catch (e) {
      if (kDebugMode) {
        print('AuthData: createUser: error: $e');
      }
      rethrow;
    }
  }

  bool isLoggedIn() {
    print('AuthData: isLoggedIn: ${_auth.currentUser != null}');
    return (_auth.currentUser != null) ? true : false;
  }

  String? getUid() {
    return _auth.currentUser?.uid;
  }

  signInAnonymously() {
    _auth.signInAnonymously();
  }

  getCurrentUserId() {
    return _auth.currentUser!.uid;
  }
}
