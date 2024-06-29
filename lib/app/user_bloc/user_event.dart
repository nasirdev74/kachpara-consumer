part of 'user_bloc.dart';

@freezed
class UserEvent with _$UserEvent {
  const factory UserEvent.initializeUser() = _InitializeUser;
  const factory UserEvent.logoutRequested() = _LogoutRequested;
  const factory UserEvent.requestLogin() = _RequestLogin;
  const factory UserEvent.requestNewUserReg() = _RequestNewUserReg;
  const factory UserEvent.userUpdated({required User user}) = _UserUpdated;
  const factory UserEvent.getCurrentLocation() = _GetCurrentLocation;
  const factory UserEvent.deleteUser() = _DeleteUser;
}
