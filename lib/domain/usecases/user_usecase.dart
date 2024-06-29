import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/data/sources/cloud_functions/sendgrid.dart';
import 'package:kachpara/data/sources/firestore/user_data.dart';
import 'package:kachpara/data/sources/geo_location/user_location.dart';
import 'package:kachpara/domain/entities/reward_balance.dart';
import 'package:kachpara/domain/entities/user.dart';
import 'package:kachpara/domain/entities/user_store.dart';

import '../../utils/result.dart';

@injectable
class UserUseCase {
  final SendGrid _sendGrid;
  final UserData _userData;
  final UserLocationData _userLocationData;

  UserUseCase(this._sendGrid, this._userData, this._userLocationData);

  Future<UserStore?> getUserStore(String storeId) {
    final user = getIt<UserBloc>().state.user;
    return _userData.getUserStore(user!.id, storeId);
  }

  Future<Result<bool>> updateUser(User passedUser) async {
    final result = await _userData.updateUser(passedUser);
    return result.when(
      success: (data) {
        getIt<UserBloc>().add(UserEvent.userUpdated(user: passedUser));
        return const Result.success(true);
      },
      error: (message) {
        return Result.error(message.toString());
      },
    );
  }

  Future<void> sendVerificationToStudentEmail(String email, int code) async {
    await _userData.checkIfalreadyRegistered(email);
    await _sendGrid.sendVerificationToStudentEmail(email, code);
  }

  Future<void> updateVerifiedStudentUser(User user, String studentEmail) async {
    try {
      await _userData.updateVerifiedStudentUser(user, studentEmail);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<void> updateFCMToken(String userId, String fcmToken) async {
    try {
      await _userData.updateFCMToken(userId, fcmToken);
    } catch (e) {
      log(e.toString());
    }
  }

  Future<Result<Position>> getCurrentLocation(LocationAccuracy locationAccuracy) async {
    final result = await _userLocationData.getCurrentLocation(locationAccuracy);
    return result.when(
      success: (data) => Result.success(data),
      error: (message) => Result.error(message),
    );
  }

  Future<bool> checkIfDistanceIsNear(Position userPosition, double latitude, double longitude) async =>
      await _userLocationData.checkIfDistanceIsNear(userPosition, latitude, longitude);

  Future<Result<RewardBalance>> getRewardBalance(String storeId) async {
    final user = getIt<UserBloc>().state.user;
    final result = await _userData.getRewardBalance(user!.id, storeId.toString());
    return result.when(
      success: (data) => Result.success(data.toDomain()),
      error: (message) => Result.error(message),
    );
  }

  Future<bool> checkIfInDeliveryZone(double latitude, double longitude) async {
    final userPosition = getIt<UserBloc>().state.userPosition;
    // if userPosition could not be obtained act as user is local to the store
    if (userPosition == null) {
      return true;
    }
    return await _userLocationData.checkIfInDeliveryZone(userPosition, latitude, longitude);
  }

  Future<bool> isStoreAdded(String storeId) async {
    //HACKY SOLUTION WHEN USER IS NOT PROPAGATED YET
    // WAIT 3 MORE SECONDS
    if (getIt<UserBloc>().state.user == null) {
      print("bekle");
      await Future.delayed(const Duration(seconds: 3));
    }
    final user = getIt<UserBloc>().state.user;
    return _userData.isStoreAdded(user!.id, storeId);
  }

  Future<User?> getUser(String userId) async {
    return await _userData.getUser(userId);
  }

  Future<Map<User, UserStore>?> getUsersByStoreId(String storeId) async {
    return await _userData.getUsersByStoreId(storeId);
  }

  Future<bool> updateUserStoreVisitsCount(String storeId) async {
    final user = getIt<UserBloc>().state.user;

    return await _userData.updateUserStoreVisits(user!.id, storeId);
  }

  Future<void> deleteUser() async {
    final user = getIt<UserBloc>().state.user;

    return await _userData.deleteUser(user!.id);
  }
}
