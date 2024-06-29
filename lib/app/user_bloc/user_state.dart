part of 'user_bloc.dart';

enum GotoPage { login, newUserReg, other }

@freezed
class UserState with _$UserState {
  const factory UserState({
    User? user,
    Position? userPosition,
    @Default(GotoPage.other) GotoPage gotoPage,
  }) = _UserState;
}
