// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$LoginPageState {
  Status get loginStatus => throw _privateConstructorUsedError;
  Status get codeSentStatus => throw _privateConstructorUsedError;
  String? get phonenumber => throw _privateConstructorUsedError;
  String? get errorMessage => throw _privateConstructorUsedError;
  bool? get newUser => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginPageStateCopyWith<LoginPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginPageStateCopyWith<$Res> {
  factory $LoginPageStateCopyWith(
          LoginPageState value, $Res Function(LoginPageState) then) =
      _$LoginPageStateCopyWithImpl<$Res, LoginPageState>;
  @useResult
  $Res call(
      {Status loginStatus,
      Status codeSentStatus,
      String? phonenumber,
      String? errorMessage,
      bool? newUser});
}

/// @nodoc
class _$LoginPageStateCopyWithImpl<$Res, $Val extends LoginPageState>
    implements $LoginPageStateCopyWith<$Res> {
  _$LoginPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginStatus = null,
    Object? codeSentStatus = null,
    Object? phonenumber = freezed,
    Object? errorMessage = freezed,
    Object? newUser = freezed,
  }) {
    return _then(_value.copyWith(
      loginStatus: null == loginStatus
          ? _value.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      codeSentStatus: null == codeSentStatus
          ? _value.codeSentStatus
          : codeSentStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      phonenumber: freezed == phonenumber
          ? _value.phonenumber
          : phonenumber // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      newUser: freezed == newUser
          ? _value.newUser
          : newUser // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LoginPageStateImplCopyWith<$Res>
    implements $LoginPageStateCopyWith<$Res> {
  factory _$$LoginPageStateImplCopyWith(_$LoginPageStateImpl value,
          $Res Function(_$LoginPageStateImpl) then) =
      __$$LoginPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status loginStatus,
      Status codeSentStatus,
      String? phonenumber,
      String? errorMessage,
      bool? newUser});
}

/// @nodoc
class __$$LoginPageStateImplCopyWithImpl<$Res>
    extends _$LoginPageStateCopyWithImpl<$Res, _$LoginPageStateImpl>
    implements _$$LoginPageStateImplCopyWith<$Res> {
  __$$LoginPageStateImplCopyWithImpl(
      _$LoginPageStateImpl _value, $Res Function(_$LoginPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? loginStatus = null,
    Object? codeSentStatus = null,
    Object? phonenumber = freezed,
    Object? errorMessage = freezed,
    Object? newUser = freezed,
  }) {
    return _then(_$LoginPageStateImpl(
      loginStatus: null == loginStatus
          ? _value.loginStatus
          : loginStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      codeSentStatus: null == codeSentStatus
          ? _value.codeSentStatus
          : codeSentStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      phonenumber: freezed == phonenumber
          ? _value.phonenumber
          : phonenumber // ignore: cast_nullable_to_non_nullable
              as String?,
      errorMessage: freezed == errorMessage
          ? _value.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      newUser: freezed == newUser
          ? _value.newUser
          : newUser // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _$LoginPageStateImpl
    with DiagnosticableTreeMixin
    implements _LoginPageState {
  const _$LoginPageStateImpl(
      {this.loginStatus = Status.init,
      this.codeSentStatus = Status.init,
      this.phonenumber,
      this.errorMessage,
      this.newUser});

  @override
  @JsonKey()
  final Status loginStatus;
  @override
  @JsonKey()
  final Status codeSentStatus;
  @override
  final String? phonenumber;
  @override
  final String? errorMessage;
  @override
  final bool? newUser;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginPageState(loginStatus: $loginStatus, codeSentStatus: $codeSentStatus, phonenumber: $phonenumber, errorMessage: $errorMessage, newUser: $newUser)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginPageState'))
      ..add(DiagnosticsProperty('loginStatus', loginStatus))
      ..add(DiagnosticsProperty('codeSentStatus', codeSentStatus))
      ..add(DiagnosticsProperty('phonenumber', phonenumber))
      ..add(DiagnosticsProperty('errorMessage', errorMessage))
      ..add(DiagnosticsProperty('newUser', newUser));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginPageStateImpl &&
            (identical(other.loginStatus, loginStatus) ||
                other.loginStatus == loginStatus) &&
            (identical(other.codeSentStatus, codeSentStatus) ||
                other.codeSentStatus == codeSentStatus) &&
            (identical(other.phonenumber, phonenumber) ||
                other.phonenumber == phonenumber) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.newUser, newUser) || other.newUser == newUser));
  }

  @override
  int get hashCode => Object.hash(runtimeType, loginStatus, codeSentStatus,
      phonenumber, errorMessage, newUser);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginPageStateImplCopyWith<_$LoginPageStateImpl> get copyWith =>
      __$$LoginPageStateImplCopyWithImpl<_$LoginPageStateImpl>(
          this, _$identity);
}

abstract class _LoginPageState implements LoginPageState {
  const factory _LoginPageState(
      {final Status loginStatus,
      final Status codeSentStatus,
      final String? phonenumber,
      final String? errorMessage,
      final bool? newUser}) = _$LoginPageStateImpl;

  @override
  Status get loginStatus;
  @override
  Status get codeSentStatus;
  @override
  String? get phonenumber;
  @override
  String? get errorMessage;
  @override
  bool? get newUser;
  @override
  @JsonKey(ignore: true)
  _$$LoginPageStateImplCopyWith<_$LoginPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
