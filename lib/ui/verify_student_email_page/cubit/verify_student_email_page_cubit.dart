import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/entities/user.dart';
import 'package:kachpara/domain/usecases/user_usecase.dart';
import 'package:kachpara/utils/status.dart';
import 'package:kachpara/utils/email_utils.dart';

part 'verify_student_email_page_cubit.freezed.dart';
part 'verify_student_email_page_state.dart';

@injectable
class VerifyStudentEmailPageCubit extends Cubit<VerifyStudentEmailPageState> {
  VerifyStudentEmailPageCubit(this._userUseCase) : super(const VerifyStudentEmailPageState());
  final UserUseCase _userUseCase;

  Future updateVerifyStudentUser(User user, String studentEmail) async {
    try {
      emit(state.copyWith(verificationStatus: Status.loading));
      await _userUseCase.updateVerifiedStudentUser(user, EmailUtils.normalizeEmail(studentEmail));
      getIt<UserBloc>().add(UserEvent.userUpdated(user: user.copyWith(isStudentVerified: true, studentEmail: EmailUtils.normalizeEmail(studentEmail))));
      emit(state.copyWith(verificationStatus: Status.success));
    } catch (e) {
      emit(state.copyWith(verificationStatus: Status.failed));
      log(e.toString());
    }
  }
}
