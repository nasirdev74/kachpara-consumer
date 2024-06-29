import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/app/cart_bloc/cart_bloc.dart';
import 'package:kachpara/app/curation_bloc/curation_bloc.dart';
import 'package:kachpara/app/store_bloc/store_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/entities/user.dart';
import 'package:kachpara/domain/usecases/user_usecase.dart';

import '../../domain/usecases/auth_usecase.dart';
import '../selected_items_bloc/selected_items_bloc.dart';

part 'user_bloc.freezed.dart';
part 'user_event.dart';
part 'user_state.dart';

@lazySingleton
class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc(
    this._authUseCase,
    this._userUseCase,
    this._messaging,
  ) : super(const UserState()) {
    on<_InitializeUser>(_onInitializeUser);
    on<_GetCurrentLocation>(_onGetCurrentLocation);
    on<_LogoutRequested>(_onLogoutRequested);
    on<_RequestLogin>(_onRequestLogin);
    on<_RequestNewUserReg>(_onRequestNewUserReg);
    on<_UserUpdated>(_onUserUpdated);
    on<_DeleteUser>(_onDeleteUser);

    // add(const _InitializeUser());
    // add(const _GetCurrentLocation());
  }
  final AuthUseCase _authUseCase;
  final UserUseCase _userUseCase;
  final FirebaseMessaging _messaging;

  FutureOr<void> _onInitializeUser(_InitializeUser event, Emitter<UserState> emit) async {
    print('User Block initialization');

    User user;

    user = await _authUseCase.getCurrentUser();
    emit(state.copyWith(user: user, gotoPage: GotoPage.other));

    try {
      final fcmToken = await _messaging.getToken();
      if (fcmToken != null) _userUseCase.updateFCMToken(user.id, fcmToken);
    } catch (e) {
      // ignoring error for now... this is failing first call after initial install
      // https://github.com/firebase/flutterfire/issues/10656
    }
    // refresh user state

    _messaging.onTokenRefresh.listen((fcmToken) {
      final userId = _authUseCase.getCurrentUserId();
      _userUseCase.updateFCMToken(userId, fcmToken);
    }).onError((err) {
      print('error fcmToken$err');
    });

    getIt<StoreBloc>().add(const StoreBlocEvent.getStores());
    getIt<CurationBloc>().add(const CurationBlocEvent.getCurations());
    getIt<CartBloc>().add(const CartEvent.getCart());
    getIt<SelectedItemsBloc>().add(const SelectedItemsEvent.initializeAddress());
    getIt<SelectedItemsBloc>().add(const SelectedItemsEvent.initializePaymentMethod());
  }

  FutureOr<void> _onLogoutRequested(_LogoutRequested event, Emitter<UserState> emit) async {
    await _authUseCase.logout();
    getIt<CartBloc>().add(const CartEvent.clearCart());
    getIt<StoreBloc>().add(const StoreBlocEvent.getStores());
  }

  FutureOr<void> _onRequestLogin(event, Emitter<UserState> emit) {
    emit(state.copyWith(gotoPage: GotoPage.login));
  }

  FutureOr<void> _onRequestNewUserReg(event, Emitter<UserState> emit) async {
    emit(state.copyWith(gotoPage: GotoPage.newUserReg));
    await _authUseCase.publishCurrentUser();
  }

  FutureOr<void> _onUserUpdated(_UserUpdated event, Emitter<UserState> emit) {
    emit(state.copyWith(user: event.user, gotoPage: GotoPage.other));
  }

  FutureOr<void> _onDeleteUser(_DeleteUser event, Emitter<UserState> emit) {
    _userUseCase.deleteUser();
    _authUseCase.logout();
    emit(state.copyWith(gotoPage: GotoPage.login));
  }

  FutureOr<void> _onGetCurrentLocation(_GetCurrentLocation event, Emitter<UserState> emit) async {
    final result = await _userUseCase.getCurrentLocation(LocationAccuracy.bestForNavigation);
    result.when(
      success: (userPosition) => emit(state.copyWith(userPosition: userPosition)),
      error: (message) {},
    );
  }
}
