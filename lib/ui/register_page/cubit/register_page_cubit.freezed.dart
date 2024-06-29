// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'register_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$RegisterPageState {
  Status get registerStatus => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterPageStateCopyWith<RegisterPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterPageStateCopyWith<$Res> {
  factory $RegisterPageStateCopyWith(
          RegisterPageState value, $Res Function(RegisterPageState) then) =
      _$RegisterPageStateCopyWithImpl<$Res, RegisterPageState>;
  @useResult
  $Res call({Status registerStatus});
}

/// @nodoc
class _$RegisterPageStateCopyWithImpl<$Res, $Val extends RegisterPageState>
    implements $RegisterPageStateCopyWith<$Res> {
  _$RegisterPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerStatus = null,
  }) {
    return _then(_value.copyWith(
      registerStatus: null == registerStatus
          ? _value.registerStatus
          : registerStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RegisterPageStateImplCopyWith<$Res>
    implements $RegisterPageStateCopyWith<$Res> {
  factory _$$RegisterPageStateImplCopyWith(_$RegisterPageStateImpl value,
          $Res Function(_$RegisterPageStateImpl) then) =
      __$$RegisterPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status registerStatus});
}

/// @nodoc
class __$$RegisterPageStateImplCopyWithImpl<$Res>
    extends _$RegisterPageStateCopyWithImpl<$Res, _$RegisterPageStateImpl>
    implements _$$RegisterPageStateImplCopyWith<$Res> {
  __$$RegisterPageStateImplCopyWithImpl(_$RegisterPageStateImpl _value,
      $Res Function(_$RegisterPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? registerStatus = null,
  }) {
    return _then(_$RegisterPageStateImpl(
      registerStatus: null == registerStatus
          ? _value.registerStatus
          : registerStatus // ignore: cast_nullable_to_non_nullable
              as Status,
    ));
  }
}

/// @nodoc

class _$RegisterPageStateImpl implements _RegisterPageState {
  const _$RegisterPageStateImpl({this.registerStatus = Status.init});

  @override
  @JsonKey()
  final Status registerStatus;

  @override
  String toString() {
    return 'RegisterPageState(registerStatus: $registerStatus)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RegisterPageStateImpl &&
            (identical(other.registerStatus, registerStatus) ||
                other.registerStatus == registerStatus));
  }

  @override
  int get hashCode => Object.hash(runtimeType, registerStatus);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RegisterPageStateImplCopyWith<_$RegisterPageStateImpl> get copyWith =>
      __$$RegisterPageStateImplCopyWithImpl<_$RegisterPageStateImpl>(
          this, _$identity);
}

abstract class _RegisterPageState implements RegisterPageState {
  const factory _RegisterPageState({final Status registerStatus}) =
      _$RegisterPageStateImpl;

  @override
  Status get registerStatus;
  @override
  @JsonKey(ignore: true)
  _$$RegisterPageStateImplCopyWith<_$RegisterPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
