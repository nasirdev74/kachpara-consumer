part of 'login_page_cubit.dart';

@freezed
class LoginPageState with _$LoginPageState {
  const factory LoginPageState({
    @Default(Status.init) Status loginStatus,
    @Default(Status.init) Status codeSentStatus,
    String? phonenumber,
    String? errorMessage,
    bool? newUser,
  }) = _LoginPageState;
}
