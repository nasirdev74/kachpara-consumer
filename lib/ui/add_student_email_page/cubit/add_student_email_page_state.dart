part of 'add_student_email_page_cubit.dart';

@freezed
class AddStudentEmailPageState with _$AddStudentEmailPageState {
  const factory AddStudentEmailPageState({
    @Default(Status.init) Status sendingEmailStatus,
    String? getErrorMessage,
  }) = _AddStudentEmailPageState;
}
