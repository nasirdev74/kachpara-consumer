// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'payment_methods_page_cubit.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$PaymentMethodsPageState {
  Status get getPaymentMethodsStatus => throw _privateConstructorUsedError;
  List<PaymentCard> get paymentMethods => throw _privateConstructorUsedError;
  String? get getPaymentMethodsErrorMessage =>
      throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PaymentMethodsPageStateCopyWith<PaymentMethodsPageState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PaymentMethodsPageStateCopyWith<$Res> {
  factory $PaymentMethodsPageStateCopyWith(PaymentMethodsPageState value,
          $Res Function(PaymentMethodsPageState) then) =
      _$PaymentMethodsPageStateCopyWithImpl<$Res, PaymentMethodsPageState>;
  @useResult
  $Res call(
      {Status getPaymentMethodsStatus,
      List<PaymentCard> paymentMethods,
      String? getPaymentMethodsErrorMessage});
}

/// @nodoc
class _$PaymentMethodsPageStateCopyWithImpl<$Res,
        $Val extends PaymentMethodsPageState>
    implements $PaymentMethodsPageStateCopyWith<$Res> {
  _$PaymentMethodsPageStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getPaymentMethodsStatus = null,
    Object? paymentMethods = null,
    Object? getPaymentMethodsErrorMessage = freezed,
  }) {
    return _then(_value.copyWith(
      getPaymentMethodsStatus: null == getPaymentMethodsStatus
          ? _value.getPaymentMethodsStatus
          : getPaymentMethodsStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      paymentMethods: null == paymentMethods
          ? _value.paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<PaymentCard>,
      getPaymentMethodsErrorMessage: freezed == getPaymentMethodsErrorMessage
          ? _value.getPaymentMethodsErrorMessage
          : getPaymentMethodsErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PaymentMethodsPageStateImplCopyWith<$Res>
    implements $PaymentMethodsPageStateCopyWith<$Res> {
  factory _$$PaymentMethodsPageStateImplCopyWith(
          _$PaymentMethodsPageStateImpl value,
          $Res Function(_$PaymentMethodsPageStateImpl) then) =
      __$$PaymentMethodsPageStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Status getPaymentMethodsStatus,
      List<PaymentCard> paymentMethods,
      String? getPaymentMethodsErrorMessage});
}

/// @nodoc
class __$$PaymentMethodsPageStateImplCopyWithImpl<$Res>
    extends _$PaymentMethodsPageStateCopyWithImpl<$Res,
        _$PaymentMethodsPageStateImpl>
    implements _$$PaymentMethodsPageStateImplCopyWith<$Res> {
  __$$PaymentMethodsPageStateImplCopyWithImpl(
      _$PaymentMethodsPageStateImpl _value,
      $Res Function(_$PaymentMethodsPageStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? getPaymentMethodsStatus = null,
    Object? paymentMethods = null,
    Object? getPaymentMethodsErrorMessage = freezed,
  }) {
    return _then(_$PaymentMethodsPageStateImpl(
      getPaymentMethodsStatus: null == getPaymentMethodsStatus
          ? _value.getPaymentMethodsStatus
          : getPaymentMethodsStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      paymentMethods: null == paymentMethods
          ? _value._paymentMethods
          : paymentMethods // ignore: cast_nullable_to_non_nullable
              as List<PaymentCard>,
      getPaymentMethodsErrorMessage: freezed == getPaymentMethodsErrorMessage
          ? _value.getPaymentMethodsErrorMessage
          : getPaymentMethodsErrorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _$PaymentMethodsPageStateImpl implements _PaymentMethodsPageState {
  const _$PaymentMethodsPageStateImpl(
      {this.getPaymentMethodsStatus = Status.init,
      final List<PaymentCard> paymentMethods = const [],
      this.getPaymentMethodsErrorMessage})
      : _paymentMethods = paymentMethods;

  @override
  @JsonKey()
  final Status getPaymentMethodsStatus;
  final List<PaymentCard> _paymentMethods;
  @override
  @JsonKey()
  List<PaymentCard> get paymentMethods {
    if (_paymentMethods is EqualUnmodifiableListView) return _paymentMethods;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_paymentMethods);
  }

  @override
  final String? getPaymentMethodsErrorMessage;

  @override
  String toString() {
    return 'PaymentMethodsPageState(getPaymentMethodsStatus: $getPaymentMethodsStatus, paymentMethods: $paymentMethods, getPaymentMethodsErrorMessage: $getPaymentMethodsErrorMessage)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PaymentMethodsPageStateImpl &&
            (identical(
                    other.getPaymentMethodsStatus, getPaymentMethodsStatus) ||
                other.getPaymentMethodsStatus == getPaymentMethodsStatus) &&
            const DeepCollectionEquality()
                .equals(other._paymentMethods, _paymentMethods) &&
            (identical(other.getPaymentMethodsErrorMessage,
                    getPaymentMethodsErrorMessage) ||
                other.getPaymentMethodsErrorMessage ==
                    getPaymentMethodsErrorMessage));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      getPaymentMethodsStatus,
      const DeepCollectionEquality().hash(_paymentMethods),
      getPaymentMethodsErrorMessage);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PaymentMethodsPageStateImplCopyWith<_$PaymentMethodsPageStateImpl>
      get copyWith => __$$PaymentMethodsPageStateImplCopyWithImpl<
          _$PaymentMethodsPageStateImpl>(this, _$identity);
}

abstract class _PaymentMethodsPageState implements PaymentMethodsPageState {
  const factory _PaymentMethodsPageState(
          {final Status getPaymentMethodsStatus,
          final List<PaymentCard> paymentMethods,
          final String? getPaymentMethodsErrorMessage}) =
      _$PaymentMethodsPageStateImpl;

  @override
  Status get getPaymentMethodsStatus;
  @override
  List<PaymentCard> get paymentMethods;
  @override
  String? get getPaymentMethodsErrorMessage;
  @override
  @JsonKey(ignore: true)
  _$$PaymentMethodsPageStateImplCopyWith<_$PaymentMethodsPageStateImpl>
      get copyWith => throw _privateConstructorUsedError;
}
