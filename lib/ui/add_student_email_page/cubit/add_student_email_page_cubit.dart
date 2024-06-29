import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/usecases/user_usecase.dart';
import 'package:kachpara/utils/status.dart';

part 'add_student_email_page_state.dart';
part 'add_student_email_page_cubit.freezed.dart';

@injectable
class AddStudentEmailPageCubit extends Cubit<AddStudentEmailPageState> {
  final UserUseCase _userUseCase;
  AddStudentEmailPageCubit(this._userUseCase) : super(const AddStudentEmailPageState());

  Future<void> sendVerificationToStudentEmail(String email, code) async {
    try {
      emit(state.copyWith(sendingEmailStatus: Status.loading));
      await _userUseCase.sendVerificationToStudentEmail(email, code);
      emit(state.copyWith(sendingEmailStatus: Status.success));
    } catch (e) {
      log(e.toString());
      emit(state.copyWith(sendingEmailStatus: Status.failed, getErrorMessage: e.toString()));
    }
  }
}
