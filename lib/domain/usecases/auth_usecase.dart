import 'package:injectable/injectable.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/data/sources/firebase_auth/auth_data.dart';
import 'package:kachpara/domain/entities/user.dart';
import 'package:kachpara/domain/usecases/user_usecase.dart';

import '../../utils/result.dart';

@injectable
class AuthUseCase {
  AuthUseCase(this._authData, this._userUseCase);
  final AuthData _authData;
  final UserUseCase _userUseCase;

  Future<User> getCurrentUser() async {
    final userModel = await _authData.getUser(getCurrentUserId());
    return userModel.toDomain();
  }

  Future<void> publishCurrentUser() async {
    final user = await getCurrentUser();
    getIt<UserBloc>().add(UserEvent.userUpdated(user: user));
  }

  Stream<Result<bool>> signInWithPhoneNumber({required String phoneNo}) => _authData.signInWithPhoneNumber(phoneNo);

  Future<Result<bool>> resendVerificationCode(String phoneNumber) async {
    final result = await _authData.resendVerificationCode(phoneNumber);
    return result.when(
      success: (data) {
        return Result.success(data);
      },
      error: (message) {
        return Result.error(message);
      },
    );
  }

  Future<Result<User?>> verifyOtp({required String otp, required String phoneNumber}) async {
    final result = await _authData.verifyCode(otp, phoneNumber);
    return result.when(success: (user) {
      if (user == null) {
        getIt<UserBloc>().add(const UserEvent.requestNewUserReg());
      } else {
        getIt<UserBloc>().add(const UserEvent.initializeUser());
      }
      return Result.success(user?.toDomain());
    }, error: (error) {
      return Result.error(error);
    });
  }

  Future<Result<void>> logout() async {
    final result = await _authData.logout();
    return result.when(
        success: (data) {
          return const Result.success(null);
        },
        error: (error) => Result.error(error));
  }

  isLoggedIn() {
    return _authData.isLoggedIn();
  }

  getCurrentUserId() {
    return _authData.getCurrentUserId();
  }
}
