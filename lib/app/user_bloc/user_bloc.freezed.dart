// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$UserEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeUser,
    required TResult Function() logoutRequested,
    required TResult Function() requestLogin,
    required TResult Function() requestNewUserReg,
    required TResult Function(User user) userUpdated,
    required TResult Function() getCurrentLocation,
    required TResult Function() deleteUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeUser,
    TResult? Function()? logoutRequested,
    TResult? Function()? requestLogin,
    TResult? Function()? requestNewUserReg,
    TResult? Function(User user)? userUpdated,
    TResult? Function()? getCurrentLocation,
    TResult? Function()? deleteUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeUser,
    TResult Function()? logoutRequested,
    TResult Function()? requestLogin,
    TResult Function()? requestNewUserReg,
    TResult Function(User user)? userUpdated,
    TResult Function()? getCurrentLocation,
    TResult Function()? deleteUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeUser value) initializeUser,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_RequestLogin value) requestLogin,
    required TResult Function(_RequestNewUserReg value) requestNewUserReg,
    required TResult Function(_UserUpdated value) userUpdated,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_DeleteUser value) deleteUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitializeUser value)? initializeUser,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_RequestLogin value)? requestLogin,
    TResult? Function(_RequestNewUserReg value)? requestNewUserReg,
    TResult? Function(_UserUpdated value)? userUpdated,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_DeleteUser value)? deleteUser,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeUser value)? initializeUser,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_RequestLogin value)? requestLogin,
    TResult Function(_RequestNewUserReg value)? requestNewUserReg,
    TResult Function(_UserUpdated value)? userUpdated,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_DeleteUser value)? deleteUser,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserEventCopyWith<$Res> {
  factory $UserEventCopyWith(UserEvent value, $Res Function(UserEvent) then) =
      _$UserEventCopyWithImpl<$Res, UserEvent>;
}

/// @nodoc
class _$UserEventCopyWithImpl<$Res, $Val extends UserEvent>
    implements $UserEventCopyWith<$Res> {
  _$UserEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitializeUserImplCopyWith<$Res> {
  factory _$$InitializeUserImplCopyWith(_$InitializeUserImpl value,
          $Res Function(_$InitializeUserImpl) then) =
      __$$InitializeUserImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeUserImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$InitializeUserImpl>
    implements _$$InitializeUserImplCopyWith<$Res> {
  __$$InitializeUserImplCopyWithImpl(
      _$InitializeUserImpl _value, $Res Function(_$InitializeUserImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializeUserImpl implements _InitializeUser {
  const _$InitializeUserImpl();

  @override
  String toString() {
    return 'UserEvent.initializeUser()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeUserImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeUser,
    required TResult Function() logoutRequested,
    required TResult Function() requestLogin,
    required TResult Function() requestNewUserReg,
    required TResult Function(User user) userUpdated,
    required TResult Function() getCurrentLocation,
    required TResult Function() deleteUser,
  }) {
    return initializeUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeUser,
    TResult? Function()? logoutRequested,
    TResult? Function()? requestLogin,
    TResult? Function()? requestNewUserReg,
    TResult? Function(User user)? userUpdated,
    TResult? Function()? getCurrentLocation,
    TResult? Function()? deleteUser,
  }) {
    return initializeUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeUser,
    TResult Function()? logoutRequested,
    TResult Function()? requestLogin,
    TResult Function()? requestNewUserReg,
    TResult Function(User user)? userUpdated,
    TResult Function()? getCurrentLocation,
    TResult Function()? deleteUser,
    required TResult orElse(),
  }) {
    if (initializeUser != null) {
      return initializeUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeUser value) initializeUser,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_RequestLogin value) requestLogin,
    required TResult Function(_RequestNewUserReg value) requestNewUserReg,
    required TResult Function(_UserUpdated value) userUpdated,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_DeleteUser value) deleteUser,
  }) {
    return initializeUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitializeUser value)? initializeUser,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_RequestLogin value)? requestLogin,
    TResult? Function(_RequestNewUserReg value)? requestNewUserReg,
    TResult? Function(_UserUpdated value)? userUpdated,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_DeleteUser value)? deleteUser,
  }) {
    return initializeUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeUser value)? initializeUser,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_RequestLogin value)? requestLogin,
    TResult Function(_RequestNewUserReg value)? requestNewUserReg,
    TResult Function(_UserUpdated value)? userUpdated,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_DeleteUser value)? deleteUser,
    required TResult orElse(),
  }) {
    if (initializeUser != null) {
      return initializeUser(this);
    }
    return orElse();
  }
}

abstract class _InitializeUser implements UserEvent {
  const factory _InitializeUser() = _$InitializeUserImpl;
}

/// @nodoc
abstract class _$$LogoutRequestedImplCopyWith<$Res> {
  factory _$$LogoutRequestedImplCopyWith(_$LogoutRequestedImpl value,
          $Res Function(_$LogoutRequestedImpl) then) =
      __$$LogoutRequestedImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$LogoutRequestedImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$LogoutRequestedImpl>
    implements _$$LogoutRequestedImplCopyWith<$Res> {
  __$$LogoutRequestedImplCopyWithImpl(
      _$LogoutRequestedImpl _value, $Res Function(_$LogoutRequestedImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$LogoutRequestedImpl implements _LogoutRequested {
  const _$LogoutRequestedImpl();

  @override
  String toString() {
    return 'UserEvent.logoutRequested()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$LogoutRequestedImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeUser,
    required TResult Function() logoutRequested,
    required TResult Function() requestLogin,
    required TResult Function() requestNewUserReg,
    required TResult Function(User user) userUpdated,
    required TResult Function() getCurrentLocation,
    required TResult Function() deleteUser,
  }) {
    return logoutRequested();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeUser,
    TResult? Function()? logoutRequested,
    TResult? Function()? requestLogin,
    TResult? Function()? requestNewUserReg,
    TResult? Function(User user)? userUpdated,
    TResult? Function()? getCurrentLocation,
    TResult? Function()? deleteUser,
  }) {
    return logoutRequested?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeUser,
    TResult Function()? logoutRequested,
    TResult Function()? requestLogin,
    TResult Function()? requestNewUserReg,
    TResult Function(User user)? userUpdated,
    TResult Function()? getCurrentLocation,
    TResult Function()? deleteUser,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeUser value) initializeUser,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_RequestLogin value) requestLogin,
    required TResult Function(_RequestNewUserReg value) requestNewUserReg,
    required TResult Function(_UserUpdated value) userUpdated,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_DeleteUser value) deleteUser,
  }) {
    return logoutRequested(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitializeUser value)? initializeUser,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_RequestLogin value)? requestLogin,
    TResult? Function(_RequestNewUserReg value)? requestNewUserReg,
    TResult? Function(_UserUpdated value)? userUpdated,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_DeleteUser value)? deleteUser,
  }) {
    return logoutRequested?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeUser value)? initializeUser,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_RequestLogin value)? requestLogin,
    TResult Function(_RequestNewUserReg value)? requestNewUserReg,
    TResult Function(_UserUpdated value)? userUpdated,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_DeleteUser value)? deleteUser,
    required TResult orElse(),
  }) {
    if (logoutRequested != null) {
      return logoutRequested(this);
    }
    return orElse();
  }
}

abstract class _LogoutRequested implements UserEvent {
  const factory _LogoutRequested() = _$LogoutRequestedImpl;
}

/// @nodoc
abstract class _$$RequestLoginImplCopyWith<$Res> {
  factory _$$RequestLoginImplCopyWith(
          _$RequestLoginImpl value, $Res Function(_$RequestLoginImpl) then) =
      __$$RequestLoginImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequestLoginImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$RequestLoginImpl>
    implements _$$RequestLoginImplCopyWith<$Res> {
  __$$RequestLoginImplCopyWithImpl(
      _$RequestLoginImpl _value, $Res Function(_$RequestLoginImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequestLoginImpl implements _RequestLogin {
  const _$RequestLoginImpl();

  @override
  String toString() {
    return 'UserEvent.requestLogin()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RequestLoginImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeUser,
    required TResult Function() logoutRequested,
    required TResult Function() requestLogin,
    required TResult Function() requestNewUserReg,
    required TResult Function(User user) userUpdated,
    required TResult Function() getCurrentLocation,
    required TResult Function() deleteUser,
  }) {
    return requestLogin();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeUser,
    TResult? Function()? logoutRequested,
    TResult? Function()? requestLogin,
    TResult? Function()? requestNewUserReg,
    TResult? Function(User user)? userUpdated,
    TResult? Function()? getCurrentLocation,
    TResult? Function()? deleteUser,
  }) {
    return requestLogin?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeUser,
    TResult Function()? logoutRequested,
    TResult Function()? requestLogin,
    TResult Function()? requestNewUserReg,
    TResult Function(User user)? userUpdated,
    TResult Function()? getCurrentLocation,
    TResult Function()? deleteUser,
    required TResult orElse(),
  }) {
    if (requestLogin != null) {
      return requestLogin();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeUser value) initializeUser,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_RequestLogin value) requestLogin,
    required TResult Function(_RequestNewUserReg value) requestNewUserReg,
    required TResult Function(_UserUpdated value) userUpdated,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_DeleteUser value) deleteUser,
  }) {
    return requestLogin(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitializeUser value)? initializeUser,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_RequestLogin value)? requestLogin,
    TResult? Function(_RequestNewUserReg value)? requestNewUserReg,
    TResult? Function(_UserUpdated value)? userUpdated,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_DeleteUser value)? deleteUser,
  }) {
    return requestLogin?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeUser value)? initializeUser,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_RequestLogin value)? requestLogin,
    TResult Function(_RequestNewUserReg value)? requestNewUserReg,
    TResult Function(_UserUpdated value)? userUpdated,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_DeleteUser value)? deleteUser,
    required TResult orElse(),
  }) {
    if (requestLogin != null) {
      return requestLogin(this);
    }
    return orElse();
  }
}

abstract class _RequestLogin implements UserEvent {
  const factory _RequestLogin() = _$RequestLoginImpl;
}

/// @nodoc
abstract class _$$RequestNewUserRegImplCopyWith<$Res> {
  factory _$$RequestNewUserRegImplCopyWith(_$RequestNewUserRegImpl value,
          $Res Function(_$RequestNewUserRegImpl) then) =
      __$$RequestNewUserRegImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$RequestNewUserRegImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$RequestNewUserRegImpl>
    implements _$$RequestNewUserRegImplCopyWith<$Res> {
  __$$RequestNewUserRegImplCopyWithImpl(_$RequestNewUserRegImpl _value,
      $Res Function(_$RequestNewUserRegImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$RequestNewUserRegImpl implements _RequestNewUserReg {
  const _$RequestNewUserRegImpl();

  @override
  String toString() {
    return 'UserEvent.requestNewUserReg()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$RequestNewUserRegImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeUser,
    required TResult Function() logoutRequested,
    required TResult Function() requestLogin,
    required TResult Function() requestNewUserReg,
    required TResult Function(User user) userUpdated,
    required TResult Function() getCurrentLocation,
    required TResult Function() deleteUser,
  }) {
    return requestNewUserReg();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeUser,
    TResult? Function()? logoutRequested,
    TResult? Function()? requestLogin,
    TResult? Function()? requestNewUserReg,
    TResult? Function(User user)? userUpdated,
    TResult? Function()? getCurrentLocation,
    TResult? Function()? deleteUser,
  }) {
    return requestNewUserReg?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeUser,
    TResult Function()? logoutRequested,
    TResult Function()? requestLogin,
    TResult Function()? requestNewUserReg,
    TResult Function(User user)? userUpdated,
    TResult Function()? getCurrentLocation,
    TResult Function()? deleteUser,
    required TResult orElse(),
  }) {
    if (requestNewUserReg != null) {
      return requestNewUserReg();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeUser value) initializeUser,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_RequestLogin value) requestLogin,
    required TResult Function(_RequestNewUserReg value) requestNewUserReg,
    required TResult Function(_UserUpdated value) userUpdated,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_DeleteUser value) deleteUser,
  }) {
    return requestNewUserReg(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitializeUser value)? initializeUser,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_RequestLogin value)? requestLogin,
    TResult? Function(_RequestNewUserReg value)? requestNewUserReg,
    TResult? Function(_UserUpdated value)? userUpdated,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_DeleteUser value)? deleteUser,
  }) {
    return requestNewUserReg?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeUser value)? initializeUser,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_RequestLogin value)? requestLogin,
    TResult Function(_RequestNewUserReg value)? requestNewUserReg,
    TResult Function(_UserUpdated value)? userUpdated,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_DeleteUser value)? deleteUser,
    required TResult orElse(),
  }) {
    if (requestNewUserReg != null) {
      return requestNewUserReg(this);
    }
    return orElse();
  }
}

abstract class _RequestNewUserReg implements UserEvent {
  const factory _RequestNewUserReg() = _$RequestNewUserRegImpl;
}

/// @nodoc
abstract class _$$UserUpdatedImplCopyWith<$Res> {
  factory _$$UserUpdatedImplCopyWith(
          _$UserUpdatedImpl value, $Res Function(_$UserUpdatedImpl) then) =
      __$$UserUpdatedImplCopyWithImpl<$Res>;
  @useResult
  $Res call({User user});
}

/// @nodoc
class __$$UserUpdatedImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$UserUpdatedImpl>
    implements _$$UserUpdatedImplCopyWith<$Res> {
  __$$UserUpdatedImplCopyWithImpl(
      _$UserUpdatedImpl _value, $Res Function(_$UserUpdatedImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
  }) {
    return _then(_$UserUpdatedImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$UserUpdatedImpl implements _UserUpdated {
  const _$UserUpdatedImpl({required this.user});

  @override
  final User user;

  @override
  String toString() {
    return 'UserEvent.userUpdated(user: $user)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserUpdatedImpl &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserUpdatedImplCopyWith<_$UserUpdatedImpl> get copyWith =>
      __$$UserUpdatedImplCopyWithImpl<_$UserUpdatedImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeUser,
    required TResult Function() logoutRequested,
    required TResult Function() requestLogin,
    required TResult Function() requestNewUserReg,
    required TResult Function(User user) userUpdated,
    required TResult Function() getCurrentLocation,
    required TResult Function() deleteUser,
  }) {
    return userUpdated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeUser,
    TResult? Function()? logoutRequested,
    TResult? Function()? requestLogin,
    TResult? Function()? requestNewUserReg,
    TResult? Function(User user)? userUpdated,
    TResult? Function()? getCurrentLocation,
    TResult? Function()? deleteUser,
  }) {
    return userUpdated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeUser,
    TResult Function()? logoutRequested,
    TResult Function()? requestLogin,
    TResult Function()? requestNewUserReg,
    TResult Function(User user)? userUpdated,
    TResult Function()? getCurrentLocation,
    TResult Function()? deleteUser,
    required TResult orElse(),
  }) {
    if (userUpdated != null) {
      return userUpdated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeUser value) initializeUser,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_RequestLogin value) requestLogin,
    required TResult Function(_RequestNewUserReg value) requestNewUserReg,
    required TResult Function(_UserUpdated value) userUpdated,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_DeleteUser value) deleteUser,
  }) {
    return userUpdated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitializeUser value)? initializeUser,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_RequestLogin value)? requestLogin,
    TResult? Function(_RequestNewUserReg value)? requestNewUserReg,
    TResult? Function(_UserUpdated value)? userUpdated,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_DeleteUser value)? deleteUser,
  }) {
    return userUpdated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeUser value)? initializeUser,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_RequestLogin value)? requestLogin,
    TResult Function(_RequestNewUserReg value)? requestNewUserReg,
    TResult Function(_UserUpdated value)? userUpdated,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_DeleteUser value)? deleteUser,
    required TResult orElse(),
  }) {
    if (userUpdated != null) {
      return userUpdated(this);
    }
    return orElse();
  }
}

abstract class _UserUpdated implements UserEvent {
  const factory _UserUpdated({required final User user}) = _$UserUpdatedImpl;

  User get user;
  @JsonKey(ignore: true)
  _$$UserUpdatedImplCopyWith<_$UserUpdatedImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GetCurrentLocationImplCopyWith<$Res> {
  factory _$$GetCurrentLocationImplCopyWith(_$GetCurrentLocationImpl value,
          $Res Function(_$GetCurrentLocationImpl) then) =
      __$$GetCurrentLocationImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetCurrentLocationImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$GetCurrentLocationImpl>
    implements _$$GetCurrentLocationImplCopyWith<$Res> {
  __$$GetCurrentLocationImplCopyWithImpl(_$GetCurrentLocationImpl _value,
      $Res Function(_$GetCurrentLocationImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetCurrentLocationImpl implements _GetCurrentLocation {
  const _$GetCurrentLocationImpl();

  @override
  String toString() {
    return 'UserEvent.getCurrentLocation()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetCurrentLocationImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeUser,
    required TResult Function() logoutRequested,
    required TResult Function() requestLogin,
    required TResult Function() requestNewUserReg,
    required TResult Function(User user) userUpdated,
    required TResult Function() getCurrentLocation,
    required TResult Function() deleteUser,
  }) {
    return getCurrentLocation();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeUser,
    TResult? Function()? logoutRequested,
    TResult? Function()? requestLogin,
    TResult? Function()? requestNewUserReg,
    TResult? Function(User user)? userUpdated,
    TResult? Function()? getCurrentLocation,
    TResult? Function()? deleteUser,
  }) {
    return getCurrentLocation?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeUser,
    TResult Function()? logoutRequested,
    TResult Function()? requestLogin,
    TResult Function()? requestNewUserReg,
    TResult Function(User user)? userUpdated,
    TResult Function()? getCurrentLocation,
    TResult Function()? deleteUser,
    required TResult orElse(),
  }) {
    if (getCurrentLocation != null) {
      return getCurrentLocation();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeUser value) initializeUser,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_RequestLogin value) requestLogin,
    required TResult Function(_RequestNewUserReg value) requestNewUserReg,
    required TResult Function(_UserUpdated value) userUpdated,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_DeleteUser value) deleteUser,
  }) {
    return getCurrentLocation(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitializeUser value)? initializeUser,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_RequestLogin value)? requestLogin,
    TResult? Function(_RequestNewUserReg value)? requestNewUserReg,
    TResult? Function(_UserUpdated value)? userUpdated,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_DeleteUser value)? deleteUser,
  }) {
    return getCurrentLocation?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeUser value)? initializeUser,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_RequestLogin value)? requestLogin,
    TResult Function(_RequestNewUserReg value)? requestNewUserReg,
    TResult Function(_UserUpdated value)? userUpdated,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_DeleteUser value)? deleteUser,
    required TResult orElse(),
  }) {
    if (getCurrentLocation != null) {
      return getCurrentLocation(this);
    }
    return orElse();
  }
}

abstract class _GetCurrentLocation implements UserEvent {
  const factory _GetCurrentLocation() = _$GetCurrentLocationImpl;
}

/// @nodoc
abstract class _$$DeleteUserImplCopyWith<$Res> {
  factory _$$DeleteUserImplCopyWith(
          _$DeleteUserImpl value, $Res Function(_$DeleteUserImpl) then) =
      __$$DeleteUserImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$DeleteUserImplCopyWithImpl<$Res>
    extends _$UserEventCopyWithImpl<$Res, _$DeleteUserImpl>
    implements _$$DeleteUserImplCopyWith<$Res> {
  __$$DeleteUserImplCopyWithImpl(
      _$DeleteUserImpl _value, $Res Function(_$DeleteUserImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$DeleteUserImpl implements _DeleteUser {
  const _$DeleteUserImpl();

  @override
  String toString() {
    return 'UserEvent.deleteUser()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$DeleteUserImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initializeUser,
    required TResult Function() logoutRequested,
    required TResult Function() requestLogin,
    required TResult Function() requestNewUserReg,
    required TResult Function(User user) userUpdated,
    required TResult Function() getCurrentLocation,
    required TResult Function() deleteUser,
  }) {
    return deleteUser();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initializeUser,
    TResult? Function()? logoutRequested,
    TResult? Function()? requestLogin,
    TResult? Function()? requestNewUserReg,
    TResult? Function(User user)? userUpdated,
    TResult? Function()? getCurrentLocation,
    TResult? Function()? deleteUser,
  }) {
    return deleteUser?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initializeUser,
    TResult Function()? logoutRequested,
    TResult Function()? requestLogin,
    TResult Function()? requestNewUserReg,
    TResult Function(User user)? userUpdated,
    TResult Function()? getCurrentLocation,
    TResult Function()? deleteUser,
    required TResult orElse(),
  }) {
    if (deleteUser != null) {
      return deleteUser();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_InitializeUser value) initializeUser,
    required TResult Function(_LogoutRequested value) logoutRequested,
    required TResult Function(_RequestLogin value) requestLogin,
    required TResult Function(_RequestNewUserReg value) requestNewUserReg,
    required TResult Function(_UserUpdated value) userUpdated,
    required TResult Function(_GetCurrentLocation value) getCurrentLocation,
    required TResult Function(_DeleteUser value) deleteUser,
  }) {
    return deleteUser(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_InitializeUser value)? initializeUser,
    TResult? Function(_LogoutRequested value)? logoutRequested,
    TResult? Function(_RequestLogin value)? requestLogin,
    TResult? Function(_RequestNewUserReg value)? requestNewUserReg,
    TResult? Function(_UserUpdated value)? userUpdated,
    TResult? Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult? Function(_DeleteUser value)? deleteUser,
  }) {
    return deleteUser?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_InitializeUser value)? initializeUser,
    TResult Function(_LogoutRequested value)? logoutRequested,
    TResult Function(_RequestLogin value)? requestLogin,
    TResult Function(_RequestNewUserReg value)? requestNewUserReg,
    TResult Function(_UserUpdated value)? userUpdated,
    TResult Function(_GetCurrentLocation value)? getCurrentLocation,
    TResult Function(_DeleteUser value)? deleteUser,
    required TResult orElse(),
  }) {
    if (deleteUser != null) {
      return deleteUser(this);
    }
    return orElse();
  }
}

abstract class _DeleteUser implements UserEvent {
  const factory _DeleteUser() = _$DeleteUserImpl;
}

/// @nodoc
mixin _$UserState {
  User? get user => throw _privateConstructorUsedError;
  Position? get userPosition => throw _privateConstructorUsedError;
  GotoPage get gotoPage => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $UserStateCopyWith<UserState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserStateCopyWith<$Res> {
  factory $UserStateCopyWith(UserState value, $Res Function(UserState) then) =
      _$UserStateCopyWithImpl<$Res, UserState>;
  @useResult
  $Res call({User? user, Position? userPosition, GotoPage gotoPage});
}

/// @nodoc
class _$UserStateCopyWithImpl<$Res, $Val extends UserState>
    implements $UserStateCopyWith<$Res> {
  _$UserStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? userPosition = freezed,
    Object? gotoPage = null,
  }) {
    return _then(_value.copyWith(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      userPosition: freezed == userPosition
          ? _value.userPosition
          : userPosition // ignore: cast_nullable_to_non_nullable
              as Position?,
      gotoPage: null == gotoPage
          ? _value.gotoPage
          : gotoPage // ignore: cast_nullable_to_non_nullable
              as GotoPage,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$UserStateImplCopyWith<$Res>
    implements $UserStateCopyWith<$Res> {
  factory _$$UserStateImplCopyWith(
          _$UserStateImpl value, $Res Function(_$UserStateImpl) then) =
      __$$UserStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({User? user, Position? userPosition, GotoPage gotoPage});
}

/// @nodoc
class __$$UserStateImplCopyWithImpl<$Res>
    extends _$UserStateCopyWithImpl<$Res, _$UserStateImpl>
    implements _$$UserStateImplCopyWith<$Res> {
  __$$UserStateImplCopyWithImpl(
      _$UserStateImpl _value, $Res Function(_$UserStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = freezed,
    Object? userPosition = freezed,
    Object? gotoPage = null,
  }) {
    return _then(_$UserStateImpl(
      user: freezed == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User?,
      userPosition: freezed == userPosition
          ? _value.userPosition
          : userPosition // ignore: cast_nullable_to_non_nullable
              as Position?,
      gotoPage: null == gotoPage
          ? _value.gotoPage
          : gotoPage // ignore: cast_nullable_to_non_nullable
              as GotoPage,
    ));
  }
}

/// @nodoc

class _$UserStateImpl implements _UserState {
  const _$UserStateImpl(
      {this.user, this.userPosition, this.gotoPage = GotoPage.other});

  @override
  final User? user;
  @override
  final Position? userPosition;
  @override
  @JsonKey()
  final GotoPage gotoPage;

  @override
  String toString() {
    return 'UserState(user: $user, userPosition: $userPosition, gotoPage: $gotoPage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserStateImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.userPosition, userPosition) ||
                other.userPosition == userPosition) &&
            (identical(other.gotoPage, gotoPage) ||
                other.gotoPage == gotoPage));
  }

  @override
  int get hashCode => Object.hash(runtimeType, user, userPosition, gotoPage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      __$$UserStateImplCopyWithImpl<_$UserStateImpl>(this, _$identity);
}

abstract class _UserState implements UserState {
  const factory _UserState(
      {final User? user,
      final Position? userPosition,
      final GotoPage gotoPage}) = _$UserStateImpl;

  @override
  User? get user;
  @override
  Position? get userPosition;
  @override
  GotoPage get gotoPage;
  @override
  @JsonKey(ignore: true)
  _$$UserStateImplCopyWith<_$UserStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
