part of 'profile_page_cubit.dart';

@freezed
class ProfilePageState with _$ProfilePageState {
  const factory ProfilePageState({User? user, @Default(Status.init) Status fetchUserStatus, String? fetchUserError}) = _ProfilePageState;
}
