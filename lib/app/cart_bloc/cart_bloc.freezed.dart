// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'cart_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$CartEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Cart cart) addToCart,
    required TResult Function(int productId) removeFromCart,
    required TResult Function(int cartItemId) decreaseQuantity,
    required TResult Function(int cartItemId) incrementQuantity,
    required TResult Function() clearCart,
    required TResult Function() getCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Cart cart)? addToCart,
    TResult? Function(int productId)? removeFromCart,
    TResult? Function(int cartItemId)? decreaseQuantity,
    TResult? Function(int cartItemId)? incrementQuantity,
    TResult? Function()? clearCart,
    TResult? Function()? getCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Cart cart)? addToCart,
    TResult Function(int productId)? removeFromCart,
    TResult Function(int cartItemId)? decreaseQuantity,
    TResult Function(int cartItemId)? incrementQuantity,
    TResult Function()? clearCart,
    TResult Function()? getCart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_DecreaseQuantity value) decreaseQuantity,
    required TResult Function(_IncrementQuantity value) incrementQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_GetCart value) getCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult? Function(_IncrementQuantity value)? incrementQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_GetCart value)? getCart,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult Function(_IncrementQuantity value)? incrementQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_GetCart value)? getCart,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartEventCopyWith<$Res> {
  factory $CartEventCopyWith(CartEvent value, $Res Function(CartEvent) then) =
      _$CartEventCopyWithImpl<$Res, CartEvent>;
}

/// @nodoc
class _$CartEventCopyWithImpl<$Res, $Val extends CartEvent>
    implements $CartEventCopyWith<$Res> {
  _$CartEventCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$AddToCartImplCopyWith<$Res> {
  factory _$$AddToCartImplCopyWith(
          _$AddToCartImpl value, $Res Function(_$AddToCartImpl) then) =
      __$$AddToCartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({Cart cart});
}

/// @nodoc
class __$$AddToCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$AddToCartImpl>
    implements _$$AddToCartImplCopyWith<$Res> {
  __$$AddToCartImplCopyWithImpl(
      _$AddToCartImpl _value, $Res Function(_$AddToCartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cart = null,
  }) {
    return _then(_$AddToCartImpl(
      null == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as Cart,
    ));
  }
}

/// @nodoc

class _$AddToCartImpl implements _AddToCart {
  const _$AddToCartImpl(this.cart);

  @override
  final Cart cart;

  @override
  String toString() {
    return 'CartEvent.addToCart(cart: $cart)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AddToCartImpl &&
            (identical(other.cart, cart) || other.cart == cart));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cart);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AddToCartImplCopyWith<_$AddToCartImpl> get copyWith =>
      __$$AddToCartImplCopyWithImpl<_$AddToCartImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Cart cart) addToCart,
    required TResult Function(int productId) removeFromCart,
    required TResult Function(int cartItemId) decreaseQuantity,
    required TResult Function(int cartItemId) incrementQuantity,
    required TResult Function() clearCart,
    required TResult Function() getCart,
  }) {
    return addToCart(cart);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Cart cart)? addToCart,
    TResult? Function(int productId)? removeFromCart,
    TResult? Function(int cartItemId)? decreaseQuantity,
    TResult? Function(int cartItemId)? incrementQuantity,
    TResult? Function()? clearCart,
    TResult? Function()? getCart,
  }) {
    return addToCart?.call(cart);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Cart cart)? addToCart,
    TResult Function(int productId)? removeFromCart,
    TResult Function(int cartItemId)? decreaseQuantity,
    TResult Function(int cartItemId)? incrementQuantity,
    TResult Function()? clearCart,
    TResult Function()? getCart,
    required TResult orElse(),
  }) {
    if (addToCart != null) {
      return addToCart(cart);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_DecreaseQuantity value) decreaseQuantity,
    required TResult Function(_IncrementQuantity value) incrementQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_GetCart value) getCart,
  }) {
    return addToCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult? Function(_IncrementQuantity value)? incrementQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_GetCart value)? getCart,
  }) {
    return addToCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult Function(_IncrementQuantity value)? incrementQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_GetCart value)? getCart,
    required TResult orElse(),
  }) {
    if (addToCart != null) {
      return addToCart(this);
    }
    return orElse();
  }
}

abstract class _AddToCart implements CartEvent {
  const factory _AddToCart(final Cart cart) = _$AddToCartImpl;

  Cart get cart;
  @JsonKey(ignore: true)
  _$$AddToCartImplCopyWith<_$AddToCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$RemoveFromCartImplCopyWith<$Res> {
  factory _$$RemoveFromCartImplCopyWith(_$RemoveFromCartImpl value,
          $Res Function(_$RemoveFromCartImpl) then) =
      __$$RemoveFromCartImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int productId});
}

/// @nodoc
class __$$RemoveFromCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$RemoveFromCartImpl>
    implements _$$RemoveFromCartImplCopyWith<$Res> {
  __$$RemoveFromCartImplCopyWithImpl(
      _$RemoveFromCartImpl _value, $Res Function(_$RemoveFromCartImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? productId = null,
  }) {
    return _then(_$RemoveFromCartImpl(
      null == productId
          ? _value.productId
          : productId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$RemoveFromCartImpl implements _RemoveFromCart {
  const _$RemoveFromCartImpl(this.productId);

  @override
  final int productId;

  @override
  String toString() {
    return 'CartEvent.removeFromCart(productId: $productId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RemoveFromCartImpl &&
            (identical(other.productId, productId) ||
                other.productId == productId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, productId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RemoveFromCartImplCopyWith<_$RemoveFromCartImpl> get copyWith =>
      __$$RemoveFromCartImplCopyWithImpl<_$RemoveFromCartImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Cart cart) addToCart,
    required TResult Function(int productId) removeFromCart,
    required TResult Function(int cartItemId) decreaseQuantity,
    required TResult Function(int cartItemId) incrementQuantity,
    required TResult Function() clearCart,
    required TResult Function() getCart,
  }) {
    return removeFromCart(productId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Cart cart)? addToCart,
    TResult? Function(int productId)? removeFromCart,
    TResult? Function(int cartItemId)? decreaseQuantity,
    TResult? Function(int cartItemId)? incrementQuantity,
    TResult? Function()? clearCart,
    TResult? Function()? getCart,
  }) {
    return removeFromCart?.call(productId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Cart cart)? addToCart,
    TResult Function(int productId)? removeFromCart,
    TResult Function(int cartItemId)? decreaseQuantity,
    TResult Function(int cartItemId)? incrementQuantity,
    TResult Function()? clearCart,
    TResult Function()? getCart,
    required TResult orElse(),
  }) {
    if (removeFromCart != null) {
      return removeFromCart(productId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_DecreaseQuantity value) decreaseQuantity,
    required TResult Function(_IncrementQuantity value) incrementQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_GetCart value) getCart,
  }) {
    return removeFromCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult? Function(_IncrementQuantity value)? incrementQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_GetCart value)? getCart,
  }) {
    return removeFromCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult Function(_IncrementQuantity value)? incrementQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_GetCart value)? getCart,
    required TResult orElse(),
  }) {
    if (removeFromCart != null) {
      return removeFromCart(this);
    }
    return orElse();
  }
}

abstract class _RemoveFromCart implements CartEvent {
  const factory _RemoveFromCart(final int productId) = _$RemoveFromCartImpl;

  int get productId;
  @JsonKey(ignore: true)
  _$$RemoveFromCartImplCopyWith<_$RemoveFromCartImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$DecreaseQuantityImplCopyWith<$Res> {
  factory _$$DecreaseQuantityImplCopyWith(_$DecreaseQuantityImpl value,
          $Res Function(_$DecreaseQuantityImpl) then) =
      __$$DecreaseQuantityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int cartItemId});
}

/// @nodoc
class __$$DecreaseQuantityImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$DecreaseQuantityImpl>
    implements _$$DecreaseQuantityImplCopyWith<$Res> {
  __$$DecreaseQuantityImplCopyWithImpl(_$DecreaseQuantityImpl _value,
      $Res Function(_$DecreaseQuantityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItemId = null,
  }) {
    return _then(_$DecreaseQuantityImpl(
      null == cartItemId
          ? _value.cartItemId
          : cartItemId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$DecreaseQuantityImpl implements _DecreaseQuantity {
  const _$DecreaseQuantityImpl(this.cartItemId);

  @override
  final int cartItemId;

  @override
  String toString() {
    return 'CartEvent.decreaseQuantity(cartItemId: $cartItemId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DecreaseQuantityImpl &&
            (identical(other.cartItemId, cartItemId) ||
                other.cartItemId == cartItemId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartItemId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DecreaseQuantityImplCopyWith<_$DecreaseQuantityImpl> get copyWith =>
      __$$DecreaseQuantityImplCopyWithImpl<_$DecreaseQuantityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Cart cart) addToCart,
    required TResult Function(int productId) removeFromCart,
    required TResult Function(int cartItemId) decreaseQuantity,
    required TResult Function(int cartItemId) incrementQuantity,
    required TResult Function() clearCart,
    required TResult Function() getCart,
  }) {
    return decreaseQuantity(cartItemId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Cart cart)? addToCart,
    TResult? Function(int productId)? removeFromCart,
    TResult? Function(int cartItemId)? decreaseQuantity,
    TResult? Function(int cartItemId)? incrementQuantity,
    TResult? Function()? clearCart,
    TResult? Function()? getCart,
  }) {
    return decreaseQuantity?.call(cartItemId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Cart cart)? addToCart,
    TResult Function(int productId)? removeFromCart,
    TResult Function(int cartItemId)? decreaseQuantity,
    TResult Function(int cartItemId)? incrementQuantity,
    TResult Function()? clearCart,
    TResult Function()? getCart,
    required TResult orElse(),
  }) {
    if (decreaseQuantity != null) {
      return decreaseQuantity(cartItemId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_DecreaseQuantity value) decreaseQuantity,
    required TResult Function(_IncrementQuantity value) incrementQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_GetCart value) getCart,
  }) {
    return decreaseQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult? Function(_IncrementQuantity value)? incrementQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_GetCart value)? getCart,
  }) {
    return decreaseQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult Function(_IncrementQuantity value)? incrementQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_GetCart value)? getCart,
    required TResult orElse(),
  }) {
    if (decreaseQuantity != null) {
      return decreaseQuantity(this);
    }
    return orElse();
  }
}

abstract class _DecreaseQuantity implements CartEvent {
  const factory _DecreaseQuantity(final int cartItemId) =
      _$DecreaseQuantityImpl;

  int get cartItemId;
  @JsonKey(ignore: true)
  _$$DecreaseQuantityImplCopyWith<_$DecreaseQuantityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$IncrementQuantityImplCopyWith<$Res> {
  factory _$$IncrementQuantityImplCopyWith(_$IncrementQuantityImpl value,
          $Res Function(_$IncrementQuantityImpl) then) =
      __$$IncrementQuantityImplCopyWithImpl<$Res>;
  @useResult
  $Res call({int cartItemId});
}

/// @nodoc
class __$$IncrementQuantityImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$IncrementQuantityImpl>
    implements _$$IncrementQuantityImplCopyWith<$Res> {
  __$$IncrementQuantityImplCopyWithImpl(_$IncrementQuantityImpl _value,
      $Res Function(_$IncrementQuantityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cartItemId = null,
  }) {
    return _then(_$IncrementQuantityImpl(
      null == cartItemId
          ? _value.cartItemId
          : cartItemId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$IncrementQuantityImpl implements _IncrementQuantity {
  const _$IncrementQuantityImpl(this.cartItemId);

  @override
  final int cartItemId;

  @override
  String toString() {
    return 'CartEvent.incrementQuantity(cartItemId: $cartItemId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$IncrementQuantityImpl &&
            (identical(other.cartItemId, cartItemId) ||
                other.cartItemId == cartItemId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, cartItemId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$IncrementQuantityImplCopyWith<_$IncrementQuantityImpl> get copyWith =>
      __$$IncrementQuantityImplCopyWithImpl<_$IncrementQuantityImpl>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Cart cart) addToCart,
    required TResult Function(int productId) removeFromCart,
    required TResult Function(int cartItemId) decreaseQuantity,
    required TResult Function(int cartItemId) incrementQuantity,
    required TResult Function() clearCart,
    required TResult Function() getCart,
  }) {
    return incrementQuantity(cartItemId);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Cart cart)? addToCart,
    TResult? Function(int productId)? removeFromCart,
    TResult? Function(int cartItemId)? decreaseQuantity,
    TResult? Function(int cartItemId)? incrementQuantity,
    TResult? Function()? clearCart,
    TResult? Function()? getCart,
  }) {
    return incrementQuantity?.call(cartItemId);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Cart cart)? addToCart,
    TResult Function(int productId)? removeFromCart,
    TResult Function(int cartItemId)? decreaseQuantity,
    TResult Function(int cartItemId)? incrementQuantity,
    TResult Function()? clearCart,
    TResult Function()? getCart,
    required TResult orElse(),
  }) {
    if (incrementQuantity != null) {
      return incrementQuantity(cartItemId);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_DecreaseQuantity value) decreaseQuantity,
    required TResult Function(_IncrementQuantity value) incrementQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_GetCart value) getCart,
  }) {
    return incrementQuantity(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult? Function(_IncrementQuantity value)? incrementQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_GetCart value)? getCart,
  }) {
    return incrementQuantity?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult Function(_IncrementQuantity value)? incrementQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_GetCart value)? getCart,
    required TResult orElse(),
  }) {
    if (incrementQuantity != null) {
      return incrementQuantity(this);
    }
    return orElse();
  }
}

abstract class _IncrementQuantity implements CartEvent {
  const factory _IncrementQuantity(final int cartItemId) =
      _$IncrementQuantityImpl;

  int get cartItemId;
  @JsonKey(ignore: true)
  _$$IncrementQuantityImplCopyWith<_$IncrementQuantityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$ClearCartImplCopyWith<$Res> {
  factory _$$ClearCartImplCopyWith(
          _$ClearCartImpl value, $Res Function(_$ClearCartImpl) then) =
      __$$ClearCartImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$ClearCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$ClearCartImpl>
    implements _$$ClearCartImplCopyWith<$Res> {
  __$$ClearCartImplCopyWithImpl(
      _$ClearCartImpl _value, $Res Function(_$ClearCartImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$ClearCartImpl implements _ClearCart {
  const _$ClearCartImpl();

  @override
  String toString() {
    return 'CartEvent.clearCart()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$ClearCartImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Cart cart) addToCart,
    required TResult Function(int productId) removeFromCart,
    required TResult Function(int cartItemId) decreaseQuantity,
    required TResult Function(int cartItemId) incrementQuantity,
    required TResult Function() clearCart,
    required TResult Function() getCart,
  }) {
    return clearCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Cart cart)? addToCart,
    TResult? Function(int productId)? removeFromCart,
    TResult? Function(int cartItemId)? decreaseQuantity,
    TResult? Function(int cartItemId)? incrementQuantity,
    TResult? Function()? clearCart,
    TResult? Function()? getCart,
  }) {
    return clearCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Cart cart)? addToCart,
    TResult Function(int productId)? removeFromCart,
    TResult Function(int cartItemId)? decreaseQuantity,
    TResult Function(int cartItemId)? incrementQuantity,
    TResult Function()? clearCart,
    TResult Function()? getCart,
    required TResult orElse(),
  }) {
    if (clearCart != null) {
      return clearCart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_DecreaseQuantity value) decreaseQuantity,
    required TResult Function(_IncrementQuantity value) incrementQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_GetCart value) getCart,
  }) {
    return clearCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult? Function(_IncrementQuantity value)? incrementQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_GetCart value)? getCart,
  }) {
    return clearCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult Function(_IncrementQuantity value)? incrementQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_GetCart value)? getCart,
    required TResult orElse(),
  }) {
    if (clearCart != null) {
      return clearCart(this);
    }
    return orElse();
  }
}

abstract class _ClearCart implements CartEvent {
  const factory _ClearCart() = _$ClearCartImpl;
}

/// @nodoc
abstract class _$$GetCartImplCopyWith<$Res> {
  factory _$$GetCartImplCopyWith(
          _$GetCartImpl value, $Res Function(_$GetCartImpl) then) =
      __$$GetCartImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$GetCartImplCopyWithImpl<$Res>
    extends _$CartEventCopyWithImpl<$Res, _$GetCartImpl>
    implements _$$GetCartImplCopyWith<$Res> {
  __$$GetCartImplCopyWithImpl(
      _$GetCartImpl _value, $Res Function(_$GetCartImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$GetCartImpl implements _GetCart {
  const _$GetCartImpl();

  @override
  String toString() {
    return 'CartEvent.getCart()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$GetCartImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Cart cart) addToCart,
    required TResult Function(int productId) removeFromCart,
    required TResult Function(int cartItemId) decreaseQuantity,
    required TResult Function(int cartItemId) incrementQuantity,
    required TResult Function() clearCart,
    required TResult Function() getCart,
  }) {
    return getCart();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Cart cart)? addToCart,
    TResult? Function(int productId)? removeFromCart,
    TResult? Function(int cartItemId)? decreaseQuantity,
    TResult? Function(int cartItemId)? incrementQuantity,
    TResult? Function()? clearCart,
    TResult? Function()? getCart,
  }) {
    return getCart?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Cart cart)? addToCart,
    TResult Function(int productId)? removeFromCart,
    TResult Function(int cartItemId)? decreaseQuantity,
    TResult Function(int cartItemId)? incrementQuantity,
    TResult Function()? clearCart,
    TResult Function()? getCart,
    required TResult orElse(),
  }) {
    if (getCart != null) {
      return getCart();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_AddToCart value) addToCart,
    required TResult Function(_RemoveFromCart value) removeFromCart,
    required TResult Function(_DecreaseQuantity value) decreaseQuantity,
    required TResult Function(_IncrementQuantity value) incrementQuantity,
    required TResult Function(_ClearCart value) clearCart,
    required TResult Function(_GetCart value) getCart,
  }) {
    return getCart(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_AddToCart value)? addToCart,
    TResult? Function(_RemoveFromCart value)? removeFromCart,
    TResult? Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult? Function(_IncrementQuantity value)? incrementQuantity,
    TResult? Function(_ClearCart value)? clearCart,
    TResult? Function(_GetCart value)? getCart,
  }) {
    return getCart?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_AddToCart value)? addToCart,
    TResult Function(_RemoveFromCart value)? removeFromCart,
    TResult Function(_DecreaseQuantity value)? decreaseQuantity,
    TResult Function(_IncrementQuantity value)? incrementQuantity,
    TResult Function(_ClearCart value)? clearCart,
    TResult Function(_GetCart value)? getCart,
    required TResult orElse(),
  }) {
    if (getCart != null) {
      return getCart(this);
    }
    return orElse();
  }
}

abstract class _GetCart implements CartEvent {
  const factory _GetCart() = _$GetCartImpl;
}

/// @nodoc
mixin _$CartState {
  Cart? get cart => throw _privateConstructorUsedError;
  Status get addToCartStatus => throw _privateConstructorUsedError;
  Status get removeFromCartStatus => throw _privateConstructorUsedError;
  Status get clearCartStatus => throw _privateConstructorUsedError;
  Status get increaseQuantityStatus => throw _privateConstructorUsedError;
  Status get decreaseQuantityStatus => throw _privateConstructorUsedError;
  int? get updatingCartItemId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CartStateCopyWith<CartState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CartStateCopyWith<$Res> {
  factory $CartStateCopyWith(CartState value, $Res Function(CartState) then) =
      _$CartStateCopyWithImpl<$Res, CartState>;
  @useResult
  $Res call(
      {Cart? cart,
      Status addToCartStatus,
      Status removeFromCartStatus,
      Status clearCartStatus,
      Status increaseQuantityStatus,
      Status decreaseQuantityStatus,
      int? updatingCartItemId});
}

/// @nodoc
class _$CartStateCopyWithImpl<$Res, $Val extends CartState>
    implements $CartStateCopyWith<$Res> {
  _$CartStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cart = freezed,
    Object? addToCartStatus = null,
    Object? removeFromCartStatus = null,
    Object? clearCartStatus = null,
    Object? increaseQuantityStatus = null,
    Object? decreaseQuantityStatus = null,
    Object? updatingCartItemId = freezed,
  }) {
    return _then(_value.copyWith(
      cart: freezed == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as Cart?,
      addToCartStatus: null == addToCartStatus
          ? _value.addToCartStatus
          : addToCartStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      removeFromCartStatus: null == removeFromCartStatus
          ? _value.removeFromCartStatus
          : removeFromCartStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      clearCartStatus: null == clearCartStatus
          ? _value.clearCartStatus
          : clearCartStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      increaseQuantityStatus: null == increaseQuantityStatus
          ? _value.increaseQuantityStatus
          : increaseQuantityStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      decreaseQuantityStatus: null == decreaseQuantityStatus
          ? _value.decreaseQuantityStatus
          : decreaseQuantityStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      updatingCartItemId: freezed == updatingCartItemId
          ? _value.updatingCartItemId
          : updatingCartItemId // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CartStateImplCopyWith<$Res>
    implements $CartStateCopyWith<$Res> {
  factory _$$CartStateImplCopyWith(
          _$CartStateImpl value, $Res Function(_$CartStateImpl) then) =
      __$$CartStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Cart? cart,
      Status addToCartStatus,
      Status removeFromCartStatus,
      Status clearCartStatus,
      Status increaseQuantityStatus,
      Status decreaseQuantityStatus,
      int? updatingCartItemId});
}

/// @nodoc
class __$$CartStateImplCopyWithImpl<$Res>
    extends _$CartStateCopyWithImpl<$Res, _$CartStateImpl>
    implements _$$CartStateImplCopyWith<$Res> {
  __$$CartStateImplCopyWithImpl(
      _$CartStateImpl _value, $Res Function(_$CartStateImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? cart = freezed,
    Object? addToCartStatus = null,
    Object? removeFromCartStatus = null,
    Object? clearCartStatus = null,
    Object? increaseQuantityStatus = null,
    Object? decreaseQuantityStatus = null,
    Object? updatingCartItemId = freezed,
  }) {
    return _then(_$CartStateImpl(
      cart: freezed == cart
          ? _value.cart
          : cart // ignore: cast_nullable_to_non_nullable
              as Cart?,
      addToCartStatus: null == addToCartStatus
          ? _value.addToCartStatus
          : addToCartStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      removeFromCartStatus: null == removeFromCartStatus
          ? _value.removeFromCartStatus
          : removeFromCartStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      clearCartStatus: null == clearCartStatus
          ? _value.clearCartStatus
          : clearCartStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      increaseQuantityStatus: null == increaseQuantityStatus
          ? _value.increaseQuantityStatus
          : increaseQuantityStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      decreaseQuantityStatus: null == decreaseQuantityStatus
          ? _value.decreaseQuantityStatus
          : decreaseQuantityStatus // ignore: cast_nullable_to_non_nullable
              as Status,
      updatingCartItemId: freezed == updatingCartItemId
          ? _value.updatingCartItemId
          : updatingCartItemId // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc

class _$CartStateImpl implements _CartState {
  const _$CartStateImpl(
      {this.cart,
      this.addToCartStatus = Status.init,
      this.removeFromCartStatus = Status.init,
      this.clearCartStatus = Status.init,
      this.increaseQuantityStatus = Status.init,
      this.decreaseQuantityStatus = Status.init,
      this.updatingCartItemId});

  @override
  final Cart? cart;
  @override
  @JsonKey()
  final Status addToCartStatus;
  @override
  @JsonKey()
  final Status removeFromCartStatus;
  @override
  @JsonKey()
  final Status clearCartStatus;
  @override
  @JsonKey()
  final Status increaseQuantityStatus;
  @override
  @JsonKey()
  final Status decreaseQuantityStatus;
  @override
  final int? updatingCartItemId;

  @override
  String toString() {
    return 'CartState(cart: $cart, addToCartStatus: $addToCartStatus, removeFromCartStatus: $removeFromCartStatus, clearCartStatus: $clearCartStatus, increaseQuantityStatus: $increaseQuantityStatus, decreaseQuantityStatus: $decreaseQuantityStatus, updatingCartItemId: $updatingCartItemId)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CartStateImpl &&
            (identical(other.cart, cart) || other.cart == cart) &&
            (identical(other.addToCartStatus, addToCartStatus) ||
                other.addToCartStatus == addToCartStatus) &&
            (identical(other.removeFromCartStatus, removeFromCartStatus) ||
                other.removeFromCartStatus == removeFromCartStatus) &&
            (identical(other.clearCartStatus, clearCartStatus) ||
                other.clearCartStatus == clearCartStatus) &&
            (identical(other.increaseQuantityStatus, increaseQuantityStatus) ||
                other.increaseQuantityStatus == increaseQuantityStatus) &&
            (identical(other.decreaseQuantityStatus, decreaseQuantityStatus) ||
                other.decreaseQuantityStatus == decreaseQuantityStatus) &&
            (identical(other.updatingCartItemId, updatingCartItemId) ||
                other.updatingCartItemId == updatingCartItemId));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      cart,
      addToCartStatus,
      removeFromCartStatus,
      clearCartStatus,
      increaseQuantityStatus,
      decreaseQuantityStatus,
      updatingCartItemId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      __$$CartStateImplCopyWithImpl<_$CartStateImpl>(this, _$identity);
}

abstract class _CartState implements CartState {
  const factory _CartState(
      {final Cart? cart,
      final Status addToCartStatus,
      final Status removeFromCartStatus,
      final Status clearCartStatus,
      final Status increaseQuantityStatus,
      final Status decreaseQuantityStatus,
      final int? updatingCartItemId}) = _$CartStateImpl;

  @override
  Cart? get cart;
  @override
  Status get addToCartStatus;
  @override
  Status get removeFromCartStatus;
  @override
  Status get clearCartStatus;
  @override
  Status get increaseQuantityStatus;
  @override
  Status get decreaseQuantityStatus;
  @override
  int? get updatingCartItemId;
  @override
  @JsonKey(ignore: true)
  _$$CartStateImplCopyWith<_$CartStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
