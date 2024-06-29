import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/usecases/auth_usecase.dart';

import '../../../utils/status.dart';

part 'login_page_state.dart';
part 'login_page_cubit.freezed.dart';

@injectable
class LoginPageCubit extends Cubit<LoginPageState> {
  LoginPageCubit(this._authUseCase) : super(const LoginPageState());
  final AuthUseCase _authUseCase;
  Future<void> sentCode(String phoneNo) async {
    if (kDebugMode) {
      print("sentCode : phoneNo : $phoneNo");
    }
    emit(state.copyWith(codeSentStatus: Status.loading, phonenumber: phoneNo));
    final stream = _authUseCase.signInWithPhoneNumber(phoneNo: phoneNo);
    stream.listen((event) {
      event.when(success: ((data) {
        if (kDebugMode) {
          print('LoginPageCubit: sentCode: success: $data');
        }
        emit(state.copyWith(codeSentStatus: Status.success));
      }), error: (e) {
        emit(state.copyWith(codeSentStatus: Status.failed, errorMessage: e.toString()));
      });
    });
  }

  Future<void> verifyCode(String code) async {
    emit(state.copyWith(loginStatus: Status.loading));
    final result = await _authUseCase.verifyOtp(otp: code, phoneNumber: state.phonenumber!);
    result.when(success: ((data) {
      log("logged in successfully");
      if (data != null) {
        emit(state.copyWith(loginStatus: Status.success, newUser: false));
      } else {
        emit(state.copyWith(loginStatus: Status.success, newUser: true));
        //hacky solution but even if the user is new, we have to publish his phonenumber
        //because if we use phoneNo in some places to check if user is logged in
        _authUseCase.publishCurrentUser();
      }
    }), error: (e) {
      emit(state.copyWith(loginStatus: Status.failed, errorMessage: e.toString()));
    });
  }

  Future<void> resendVerificationCode(String phoneNumber) async {
    final result = await _authUseCase.resendVerificationCode(phoneNumber);
    emit(state.copyWith(loginStatus: Status.loading));
    result.when(
      success: (data) {
        emit(state.copyWith(loginStatus: Status.success));
      },
      error: (e) {
        log(e.toString());
        emit(state.copyWith(loginStatus: Status.failed, errorMessage: e.toString()));
      },
    );
  }
}
