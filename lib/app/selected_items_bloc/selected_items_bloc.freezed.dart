// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_items_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SelectedItemsEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Address address) setAddress,
    required TResult Function() initializeAddress,
    required TResult Function(PaymentCard paymentMethod) setPaymentMethod,
    required TResult Function() initializePaymentMethod,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Address address)? setAddress,
    TResult? Function()? initializeAddress,
    TResult? Function(PaymentCard paymentMethod)? setPaymentMethod,
    TResult? Function()? initializePaymentMethod,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Address address)? setAddress,
    TResult Function()? initializeAddress,
    TResult Function(PaymentCard paymentMethod)? setPaymentMethod,
    TResult Function()? initializePaymentMethod,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetAddress value) setAddress,
    required TResult Function(_InitializeAddress value) initializeAddress,
    required TResult Function(_SetPaymentMethod value) setPaymentMethod,
    required TResult Function(_InitializePaymentMethod value)
        initializePaymentMethod,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetAddress value)? setAddress,
    TResult? Function(_InitializeAddress value)? initializeAddress,
    TResult? Function(_SetPaymentMethod value)? setPaymentMethod,
    TResult? Function(_InitializePaymentMethod value)? initializePaymentMethod,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetAddress value)? setAddress,
    TResult Function(_InitializeAddress value)? initializeAddress,
    TResult Function(_SetPaymentMethod value)? setPaymentMethod,
    TResult Function(_InitializePaymentMethod value)? initializePaymentMethod,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedItemsEventCopyWith<$Res> {
  factory $SelectedItemsEventCopyWith(
          SelectedItemsEvent value, $Res Function(SelectedItemsEvent) then) =
      _$SelectedItemsEventCopyWithImpl<$Res, SelectedItemsEvent>;
}

/// @nodoc
class _$SelectedItemsEventCopyWithImpl<$Res, $Val extends SelectedItemsEvent>
    implements $SelectedItemsEventCopyWith<$Res> {
  _$SelectedItemsEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$SetAddressImplCopyWith<$Res> {
  factory _$$SetAddressImplCopyWith(
          _$SetAddressImpl value, $Res Function(_$SetAddressImpl) then) =
      __$$SetAddressImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Address address});
}

/// @nodoc
class __$$SetAddressImplCopyWithImpl<$Res>
    extends _$SelectedItemsEventCopyWithImpl<$Res, _$SetAddressImpl>
    implements _$$SetAddressImplCopyWith<$Res> {
  __$$SetAddressImplCopyWithImpl(
      _$SetAddressImpl _value, $Res Function(_$SetAddressImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? address = null,
  }) {
    return _then(_$SetAddressImpl(
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as Address,
    ));
  }
}

/// @nodoc

class _$SetAddressImpl with DiagnosticableTreeMixin implements _SetAddress {
  const _$SetAddressImpl({required this.address});

  @override
  final Address address;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SelectedItemsEvent.setAddress(address: $address)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SelectedItemsEvent.setAddress'))
      ..add(DiagnosticsProperty('address', address));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetAddressImpl &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetAddressImplCopyWith<_$SetAddressImpl> get copyWith =>
      __$$SetAddressImplCopyWithImpl<_$SetAddressImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Address address) setAddress,
    required TResult Function() initializeAddress,
    required TResult Function(PaymentCard paymentMethod) setPaymentMethod,
    required TResult Function() initializePaymentMethod,
  }) {
    return setAddress(address);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Address address)? setAddress,
    TResult? Function()? initializeAddress,
    TResult? Function(PaymentCard paymentMethod)? setPaymentMethod,
    TResult? Function()? initializePaymentMethod,
  }) {
    return setAddress?.call(address);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Address address)? setAddress,
    TResult Function()? initializeAddress,
    TResult Function(PaymentCard paymentMethod)? setPaymentMethod,
    TResult Function()? initializePaymentMethod,
    required TResult orElse(),
  }) {
    if (setAddress != null) {
      return setAddress(address);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetAddress value) setAddress,
    required TResult Function(_InitializeAddress value) initializeAddress,
    required TResult Function(_SetPaymentMethod value) setPaymentMethod,
    required TResult Function(_InitializePaymentMethod value)
        initializePaymentMethod,
  }) {
    return setAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetAddress value)? setAddress,
    TResult? Function(_InitializeAddress value)? initializeAddress,
    TResult? Function(_SetPaymentMethod value)? setPaymentMethod,
    TResult? Function(_InitializePaymentMethod value)? initializePaymentMethod,
  }) {
    return setAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetAddress value)? setAddress,
    TResult Function(_InitializeAddress value)? initializeAddress,
    TResult Function(_SetPaymentMethod value)? setPaymentMethod,
    TResult Function(_InitializePaymentMethod value)? initializePaymentMethod,
    required TResult orElse(),
  }) {
    if (setAddress != null) {
      return setAddress(this);
    }
    return orElse();
  }
}

abstract class _SetAddress implements SelectedItemsEvent {
  const factory _SetAddress({required final Address address}) =
      _$SetAddressImpl;

  Address get address;
  @JsonKey(ignore: true)
  _$$SetAddressImplCopyWith<_$SetAddressImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitializeAddressImplCopyWith<$Res> {
  factory _$$InitializeAddressImplCopyWith(_$InitializeAddressImpl value,
          $Res Function(_$InitializeAddressImpl) then) =
      __$$InitializeAddressImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializeAddressImplCopyWithImpl<$Res>
    extends _$SelectedItemsEventCopyWithImpl<$Res, _$InitializeAddressImpl>
    implements _$$InitializeAddressImplCopyWith<$Res> {
  __$$InitializeAddressImplCopyWithImpl(_$InitializeAddressImpl _value,
      $Res Function(_$InitializeAddressImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializeAddressImpl
    with DiagnosticableTreeMixin
    implements _InitializeAddress {
  const _$InitializeAddressImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SelectedItemsEvent.initializeAddress()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(
        DiagnosticsProperty('type', 'SelectedItemsEvent.initializeAddress'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitializeAddressImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Address address) setAddress,
    required TResult Function() initializeAddress,
    required TResult Function(PaymentCard paymentMethod) setPaymentMethod,
    required TResult Function() initializePaymentMethod,
  }) {
    return initializeAddress();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Address address)? setAddress,
    TResult? Function()? initializeAddress,
    TResult? Function(PaymentCard paymentMethod)? setPaymentMethod,
    TResult? Function()? initializePaymentMethod,
  }) {
    return initializeAddress?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Address address)? setAddress,
    TResult Function()? initializeAddress,
    TResult Function(PaymentCard paymentMethod)? setPaymentMethod,
    TResult Function()? initializePaymentMethod,
    required TResult orElse(),
  }) {
    if (initializeAddress != null) {
      return initializeAddress();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetAddress value) setAddress,
    required TResult Function(_InitializeAddress value) initializeAddress,
    required TResult Function(_SetPaymentMethod value) setPaymentMethod,
    required TResult Function(_InitializePaymentMethod value)
        initializePaymentMethod,
  }) {
    return initializeAddress(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetAddress value)? setAddress,
    TResult? Function(_InitializeAddress value)? initializeAddress,
    TResult? Function(_SetPaymentMethod value)? setPaymentMethod,
    TResult? Function(_InitializePaymentMethod value)? initializePaymentMethod,
  }) {
    return initializeAddress?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetAddress value)? setAddress,
    TResult Function(_InitializeAddress value)? initializeAddress,
    TResult Function(_SetPaymentMethod value)? setPaymentMethod,
    TResult Function(_InitializePaymentMethod value)? initializePaymentMethod,
    required TResult orElse(),
  }) {
    if (initializeAddress != null) {
      return initializeAddress(this);
    }
    return orElse();
  }
}

abstract class _InitializeAddress implements SelectedItemsEvent {
  const factory _InitializeAddress() = _$InitializeAddressImpl;
}

/// @nodoc
abstract class _$$SetPaymentMethodImplCopyWith<$Res> {
  factory _$$SetPaymentMethodImplCopyWith(_$SetPaymentMethodImpl value,
          $Res Function(_$SetPaymentMethodImpl) then) =
      __$$SetPaymentMethodImplCopyWithImpl<$Res>;
  @useResult
  $Res call({PaymentCard paymentMethod});
}

/// @nodoc
class __$$SetPaymentMethodImplCopyWithImpl<$Res>
    extends _$SelectedItemsEventCopyWithImpl<$Res, _$SetPaymentMethodImpl>
    implements _$$SetPaymentMethodImplCopyWith<$Res> {
  __$$SetPaymentMethodImplCopyWithImpl(_$SetPaymentMethodImpl _value,
      $Res Function(_$SetPaymentMethodImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? paymentMethod = null,
  }) {
    return _then(_$SetPaymentMethodImpl(
      paymentMethod: null == paymentMethod
          ? _value.paymentMethod
          : paymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentCard,
    ));
  }
}

/// @nodoc

class _$SetPaymentMethodImpl
    with DiagnosticableTreeMixin
    implements _SetPaymentMethod {
  const _$SetPaymentMethodImpl({required this.paymentMethod});

  @override
  final PaymentCard paymentMethod;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SelectedItemsEvent.setPaymentMethod(paymentMethod: $paymentMethod)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SelectedItemsEvent.setPaymentMethod'))
      ..add(DiagnosticsProperty('paymentMethod', paymentMethod));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetPaymentMethodImpl &&
            (identical(other.paymentMethod, paymentMethod) ||
                other.paymentMethod == paymentMethod));
  }

  @override
  int get hashCode => Object.hash(runtimeType, paymentMethod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetPaymentMethodImplCopyWith<_$SetPaymentMethodImpl> get copyWith =>
      __$$SetPaymentMethodImplCopyWithImpl<_$SetPaymentMethodImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Address address) setAddress,
    required TResult Function() initializeAddress,
    required TResult Function(PaymentCard paymentMethod) setPaymentMethod,
    required TResult Function() initializePaymentMethod,
  }) {
    return setPaymentMethod(paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Address address)? setAddress,
    TResult? Function()? initializeAddress,
    TResult? Function(PaymentCard paymentMethod)? setPaymentMethod,
    TResult? Function()? initializePaymentMethod,
  }) {
    return setPaymentMethod?.call(paymentMethod);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Address address)? setAddress,
    TResult Function()? initializeAddress,
    TResult Function(PaymentCard paymentMethod)? setPaymentMethod,
    TResult Function()? initializePaymentMethod,
    required TResult orElse(),
  }) {
    if (setPaymentMethod != null) {
      return setPaymentMethod(paymentMethod);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetAddress value) setAddress,
    required TResult Function(_InitializeAddress value) initializeAddress,
    required TResult Function(_SetPaymentMethod value) setPaymentMethod,
    required TResult Function(_InitializePaymentMethod value)
        initializePaymentMethod,
  }) {
    return setPaymentMethod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetAddress value)? setAddress,
    TResult? Function(_InitializeAddress value)? initializeAddress,
    TResult? Function(_SetPaymentMethod value)? setPaymentMethod,
    TResult? Function(_InitializePaymentMethod value)? initializePaymentMethod,
  }) {
    return setPaymentMethod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetAddress value)? setAddress,
    TResult Function(_InitializeAddress value)? initializeAddress,
    TResult Function(_SetPaymentMethod value)? setPaymentMethod,
    TResult Function(_InitializePaymentMethod value)? initializePaymentMethod,
    required TResult orElse(),
  }) {
    if (setPaymentMethod != null) {
      return setPaymentMethod(this);
    }
    return orElse();
  }
}

abstract class _SetPaymentMethod implements SelectedItemsEvent {
  const factory _SetPaymentMethod({required final PaymentCard paymentMethod}) =
      _$SetPaymentMethodImpl;

  PaymentCard get paymentMethod;
  @JsonKey(ignore: true)
  _$$SetPaymentMethodImplCopyWith<_$SetPaymentMethodImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$InitializePaymentMethodImplCopyWith<$Res> {
  factory _$$InitializePaymentMethodImplCopyWith(
          _$InitializePaymentMethodImpl value,
          $Res Function(_$InitializePaymentMethodImpl) then) =
      __$$InitializePaymentMethodImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitializePaymentMethodImplCopyWithImpl<$Res>
    extends _$SelectedItemsEventCopyWithImpl<$Res,
        _$InitializePaymentMethodImpl>
    implements _$$InitializePaymentMethodImplCopyWith<$Res> {
  __$$InitializePaymentMethodImplCopyWithImpl(
      _$InitializePaymentMethodImpl _value,
      $Res Function(_$InitializePaymentMethodImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitializePaymentMethodImpl
    with DiagnosticableTreeMixin
    implements _InitializePaymentMethod {
  const _$InitializePaymentMethodImpl();

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SelectedItemsEvent.initializePaymentMethod()';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties.add(DiagnosticsProperty(
        'type', 'SelectedItemsEvent.initializePaymentMethod'));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$InitializePaymentMethodImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Address address) setAddress,
    required TResult Function() initializeAddress,
    required TResult Function(PaymentCard paymentMethod) setPaymentMethod,
    required TResult Function() initializePaymentMethod,
  }) {
    return initializePaymentMethod();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Address address)? setAddress,
    TResult? Function()? initializeAddress,
    TResult? Function(PaymentCard paymentMethod)? setPaymentMethod,
    TResult? Function()? initializePaymentMethod,
  }) {
    return initializePaymentMethod?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Address address)? setAddress,
    TResult Function()? initializeAddress,
    TResult Function(PaymentCard paymentMethod)? setPaymentMethod,
    TResult Function()? initializePaymentMethod,
    required TResult orElse(),
  }) {
    if (initializePaymentMethod != null) {
      return initializePaymentMethod();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_SetAddress value) setAddress,
    required TResult Function(_InitializeAddress value) initializeAddress,
    required TResult Function(_SetPaymentMethod value) setPaymentMethod,
    required TResult Function(_InitializePaymentMethod value)
        initializePaymentMethod,
  }) {
    return initializePaymentMethod(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_SetAddress value)? setAddress,
    TResult? Function(_InitializeAddress value)? initializeAddress,
    TResult? Function(_SetPaymentMethod value)? setPaymentMethod,
    TResult? Function(_InitializePaymentMethod value)? initializePaymentMethod,
  }) {
    return initializePaymentMethod?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_SetAddress value)? setAddress,
    TResult Function(_InitializeAddress value)? initializeAddress,
    TResult Function(_SetPaymentMethod value)? setPaymentMethod,
    TResult Function(_InitializePaymentMethod value)? initializePaymentMethod,
    required TResult orElse(),
  }) {
    if (initializePaymentMethod != null) {
      return initializePaymentMethod(this);
    }
    return orElse();
  }
}

abstract class _InitializePaymentMethod implements SelectedItemsEvent {
  const factory _InitializePaymentMethod() = _$InitializePaymentMethodImpl;
}

/// @nodoc
mixin _$SelectedItemsState {
  Address? get selectedAddress => throw _privateConstructorUsedError;
  PaymentCard? get selectedPaymentMethod => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SelectedItemsStateCopyWith<SelectedItemsState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SelectedItemsStateCopyWith<$Res> {
  factory $SelectedItemsStateCopyWith(
          SelectedItemsState value, $Res Function(SelectedItemsState) then) =
      _$SelectedItemsStateCopyWithImpl<$Res, SelectedItemsState>;
  @useResult
  $Res call({Address? selectedAddress, PaymentCard? selectedPaymentMethod});
}

/// @nodoc
class _$SelectedItemsStateCopyWithImpl<$Res, $Val extends SelectedItemsState>
    implements $SelectedItemsStateCopyWith<$Res> {
  _$SelectedItemsStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedAddress = freezed,
    Object? selectedPaymentMethod = freezed,
  }) {
    return _then(_value.copyWith(
      selectedAddress: freezed == selectedAddress
          ? _value.selectedAddress
          : selectedAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      selectedPaymentMethod: freezed == selectedPaymentMethod
          ? _value.selectedPaymentMethod
          : selectedPaymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentCard?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SelecteditemsStateImplCopyWith<$Res>
    implements $SelectedItemsStateCopyWith<$Res> {
  factory _$$SelecteditemsStateImplCopyWith(_$SelecteditemsStateImpl value,
          $Res Function(_$SelecteditemsStateImpl) then) =
      __$$SelecteditemsStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({Address? selectedAddress, PaymentCard? selectedPaymentMethod});
}

/// @nodoc
class __$$SelecteditemsStateImplCopyWithImpl<$Res>
    extends _$SelectedItemsStateCopyWithImpl<$Res, _$SelecteditemsStateImpl>
    implements _$$SelecteditemsStateImplCopyWith<$Res> {
  __$$SelecteditemsStateImplCopyWithImpl(_$SelecteditemsStateImpl _value,
      $Res Function(_$SelecteditemsStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? selectedAddress = freezed,
    Object? selectedPaymentMethod = freezed,
  }) {
    return _then(_$SelecteditemsStateImpl(
      selectedAddress: freezed == selectedAddress
          ? _value.selectedAddress
          : selectedAddress // ignore: cast_nullable_to_non_nullable
              as Address?,
      selectedPaymentMethod: freezed == selectedPaymentMethod
          ? _value.selectedPaymentMethod
          : selectedPaymentMethod // ignore: cast_nullable_to_non_nullable
              as PaymentCard?,
    ));
  }
}

/// @nodoc

class _$SelecteditemsStateImpl
    with DiagnosticableTreeMixin
    implements _SelecteditemsState {
  const _$SelecteditemsStateImpl(
      {this.selectedAddress, this.selectedPaymentMethod});

  @override
  final Address? selectedAddress;
  @override
  final PaymentCard? selectedPaymentMethod;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SelectedItemsState(selectedAddress: $selectedAddress, selectedPaymentMethod: $selectedPaymentMethod)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SelectedItemsState'))
      ..add(DiagnosticsProperty('selectedAddress', selectedAddress))
      ..add(
          DiagnosticsProperty('selectedPaymentMethod', selectedPaymentMethod));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SelecteditemsStateImpl &&
            (identical(other.selectedAddress, selectedAddress) ||
                other.selectedAddress == selectedAddress) &&
            (identical(other.selectedPaymentMethod, selectedPaymentMethod) ||
                other.selectedPaymentMethod == selectedPaymentMethod));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, selectedAddress, selectedPaymentMethod);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SelecteditemsStateImplCopyWith<_$SelecteditemsStateImpl> get copyWith =>
      __$$SelecteditemsStateImplCopyWithImpl<_$SelecteditemsStateImpl>(
          this, _$identity);
}

abstract class _SelecteditemsState implements SelectedItemsState {
  const factory _SelecteditemsState(
      {final Address? selectedAddress,
      final PaymentCard? selectedPaymentMethod}) = _$SelecteditemsStateImpl;

  @override
  Address? get selectedAddress;
  @override
  PaymentCard? get selectedPaymentMethod;
  @override
  @JsonKey(ignore: true)
  _$$SelecteditemsStateImplCopyWith<_$SelecteditemsStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
