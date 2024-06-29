part of 'register_page_cubit.dart';

@freezed
class RegisterPageState with _$RegisterPageState {
  const factory RegisterPageState({
    @Default(Status.init) Status registerStatus,
  }) = _RegisterPageState;
}
