import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/domain/entities/user.dart';
import 'package:kachpara/domain/usecases/user_usecase.dart';

import '../../../core/injector.dart';
import '../../../domain/usecases/auth_usecase.dart';
import '../../../utils/status.dart';

part 'profile_page_cubit.freezed.dart';
part 'profile_page_state.dart';

@injectable
class ProfilePageCubit extends Cubit<ProfilePageState> {
  ProfilePageCubit(this._authUseCase, this._userUseCase) : super(const ProfilePageState()) {
    fetchUser();
  }
  final AuthUseCase _authUseCase;
  final UserUseCase _userUseCase;
  Future<void> logout() async {
    await _authUseCase.logout();
  }

  Future<void> fetchUser() async {
    final user = await _authUseCase.getCurrentUser();
    emit(state.copyWith(fetchUserStatus: Status.success, user: user));
  }

  Future<void> updateUser(User user) async {
    await _userUseCase.updateUser(user);
    getIt<UserBloc>().add(UserEvent.userUpdated(user: user));
  }
}
