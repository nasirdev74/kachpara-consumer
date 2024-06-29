import 'dart:developer';

import 'package:cloud_functions/cloud_functions.dart';
import 'package:injectable/injectable.dart';

@injectable
class SendGrid {
  final FirebaseFunctions _functions;

  SendGrid(this._functions);

  Future<void> sendVerificationToStudentEmail(String email, int code) async {
    if (email == "test@kachpara.edu.tr") return; //hardcode for testing
    try {
      await _functions
          .httpsCallable(
        "sendVerificationToStudentEmail",
      )
          .call({"email": email, "code": code});
    } catch (e) {
      log(e.toString());
    }
  }
}
