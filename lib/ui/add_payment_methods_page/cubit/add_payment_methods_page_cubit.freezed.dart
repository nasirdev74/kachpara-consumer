// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'add_payment_methods_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$AddPaymentMethodsPageState {
  Status get status => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AddPaymentMethodsPageStateCopyWith<AddPaymentMethodsPageState>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AddPaymentMethodsPageStateCopyWith<$Res> {
  factory $AddPaymentMethodsPageStateCopyWith(AddPaymentMethodsPageState value,
          $Res Function(AddPaymentMethodsPageState) then) =
      _$AddPaymentMethodsPageStateCopyWithImpl<$Res,
          AddPaymentMethodsPageState>;
  @useResult
  $Res call({Status status, String? error});
}

/// @nodoc
class _$AddPaymentMethodsPageStateCopyWithImpl<$Res,
        $Val extends AddPaymentMethodsPageState>
    implements $AddPaymentMethodsPageStateCopyWith<$Res> {
  _$AddPaymentMethodsPageStateCopyWithImpl(this._value, this._then);

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
abstract class _$$AddPaymentMethodsPageStateImplCopyWith<$Res>
    implements $AddPaymentMethodsPageStateCopyWith<$Res> {
  factory _$$AddPaymentMethodsPageStateImplCopyWith(
          _$AddPaymentMethodsPageStateImpl value,
          $Res Function(_$AddPaymentMethodsPageStateImpl) then) =
      __$$AddPaymentMethodsPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Status status, String? error});
}

/// @nodoc
class __$$AddPaymentMethodsPageStateImplCopyWithImpl<$Res>
    extends _$AddPaymentMethodsPageStateCopyWithImpl<$Res,
        _$AddPaymentMethodsPageStateImpl>
    implements _$$AddPaymentMethodsPageStateImplCopyWith<$Res> {
  __$$AddPaymentMethodsPageStateImplCopyWithImpl(
      _$AddPaymentMethodsPageStateImpl _value,
      $Res Function(_$AddPaymentMethodsPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? error = freezed,
  }) {
    return _then(_$AddPaymentMethodsPageStateImpl(
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

class _$AddPaymentMethodsPageStateImpl implements _AddPaymentMethodsPageState {
  const _$AddPaymentMethodsPageStateImpl(
      {this.status = Status.init, this.error});

  @override
  @JsonKey()
  final Status status;
  @override
  final String? error;

  @override
  String toString() {
    return 'AddPaymentMethodsPageState(status: $status, error: $error)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddPaymentMethodsPageStateImpl &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.error, error) || other.error == error));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, error);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddPaymentMethodsPageStateImplCopyWith<_$AddPaymentMethodsPageStateImpl>
      get copyWith => __$$AddPaymentMethodsPageStateImplCopyWithImpl<
          _$AddPaymentMethodsPageStateImpl>(this, _$identity);
}

abstract class _AddPaymentMethodsPageState
    implements AddPaymentMethodsPageState {
  const factory _AddPaymentMethodsPageState(
      {final Status status,
      final String? error}) = _$AddPaymentMethodsPageStateImpl;

  @override
  Status get status;
  @override
  String? get error;
  @override
  @JsonKey(ignore: true)
  _$$AddPaymentMethodsPageStateImplCopyWith<_$AddPaymentMethodsPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
