// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_address_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddAddressPageState {
  Status get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddAddressPageStateCopyWith<AddAddressPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddAddressPageStateCopyWith<$Res> {
  factory $AddAddressPageStateCopyWith(
          AddAddressPageState value, $Res Function(AddAddressPageState) then) =
      _$AddAddressPageStateCopyWithImpl<$Res, AddAddressPageState>;
  @useResult
  $Res call({Status status, String? error});
}

/// @nodoc
class _$AddAddressPageStateCopyWithImpl<$Res, $Val extends AddAddressPageState>
    implements $AddAddressPageStateCopyWith<$Res> {
  _$AddAddressPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_value.copyWith(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$AddAddressPageStateImplCopyWith<$Res>
    implements $AddAddressPageStateCopyWith<$Res> {
  factory _$$AddAddressPageStateImplCopyWith(_$AddAddressPageStateImpl value,
          $Res Function(_$AddAddressPageStateImpl) then) =
      __$$AddAddressPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, String? error});
}

/// @nodoc
class __$$AddAddressPageStateImplCopyWithImpl<$Res>
    extends _$AddAddressPageStateCopyWithImpl<$Res, _$AddAddressPageStateImpl>
    implements _$$AddAddressPageStateImplCopyWith<$Res> {
  __$$AddAddressPageStateImplCopyWithImpl(_$AddAddressPageStateImpl _value,
      $Res Function(_$AddAddressPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$AddAddressPageStateImpl(
      status: null == status
          ? _value.status
          : status // ignore: cast_nullable_to_non_nullable
              as Status,
      error: freezed == error
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$AddAddressPageStateImpl
    with DiagnosticableTreeMixin
    implements _AddAddressPageState {
  const _$AddAddressPageStateImpl({this.status = Status.init, this.error});

  @override
  @JsonKey()
  final Status status;
  @override
  final String? error;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'AddAddressPageState(status: $status, error: $error)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'AddAddressPageState'))
      ..add(DiagnosticsProperty('status', status))
      ..add(DiagnosticsProperty('error', error));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddAddressPageStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddAddressPageStateImplCopyWith<_$AddAddressPageStateImpl> get copyWith =>
      __$$AddAddressPageStateImplCopyWithImpl<_$AddAddressPageStateImpl>(
          this, _$identity);
}

abstract class _AddAddressPageState implements AddAddressPageState {
  const factory _AddAddressPageState(
      {final Status status, final String? error}) = _$AddAddressPageStateImpl;

  @override
  Status get status;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$AddAddressPageStateImplCopyWith<_$AddAddressPageStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
