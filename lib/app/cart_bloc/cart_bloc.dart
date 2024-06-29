import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/domain/entities/cart.dart';
import 'package:kachpara/domain/usecases/cart_usecases.dart';
import 'package:kachpara/utils/status.dart';

import '../../core/injector.dart';

part 'cart_bloc.freezed.dart';
part 'cart_event.dart';
part 'cart_state.dart';

@singleton
class CartBloc extends Bloc<CartEvent, CartState> {
  CartBloc(this._cartUseCases) : super(const CartState()) {
    on<_AddToCart>(_addToCart);
    on<_RemoveFromCart>(_removeFromCart);
    on<_ClearCart>(_clearCart);
    on<_GetCart>(_getCart);
    on<_DecreaseQuantity>(_decreaseQuantity);
    on<_IncrementQuantity>(_incrementQuantity);
  }

  final CartUseCases _cartUseCases;

  FutureOr<void> _addToCart(_AddToCart event, Emitter<CartState> emit) async {
    final userBloc = getIt<UserBloc>();
    if (userBloc.state.user == null) {
      userBloc.add(const UserEvent.requestLogin());
      return;
    }

    emit(state.copyWith(cart: event.cart, addToCartStatus: Status.success));

    emit(state.copyWith(addToCartStatus: Status.init));
  }

  FutureOr<void> _removeFromCart(_RemoveFromCart event, Emitter<CartState> emit) async {
    emit(state.copyWith(removeFromCartStatus: Status.loading));
    final cartItem = state.cart!.items.firstWhere((element) => element.product.id == event.productId);
    final result = await _cartUseCases.removeFromCart(cartItem, state.cart!.restaurantId);
    result.when(success: (v) {
      final cart = state.cart?.copyWith(items: state.cart?.items.where((e) => e.id != event.productId).toList());
      emit(state.copyWith(
        cart: cart,
        removeFromCartStatus: Status.success,
      ));
    }, error: (e) {
      emit(state.copyWith(removeFromCartStatus: Status.failed));
    });
  }

  FutureOr<void> _clearCart(_ClearCart event, Emitter<CartState> emit) async {
    if (state.cart != null) {
      final result = await _cartUseCases.clearCart(state.cart!.restaurantId);
      result.when(
        success: ((data) {
          emit(state.copyWith(cart: null));
        }),
        error: (message) {
          debugPrint(message);
        },
      );
    }
  }

  FutureOr<void> _getCart(event, Emitter<CartState> emit) async {
    final result = await _cartUseCases.getCart();
    result.when(success: (data) {
      emit(state.copyWith(cart: data));
    }, error: (error) {
      debugPrint(error.toString());
    });
  }

  FutureOr<void> _decreaseQuantity(_DecreaseQuantity event, Emitter<CartState> emit) async {
    emit(state.copyWith(decreaseQuantityStatus: Status.loading, updatingCartItemId: event.cartItemId));
    final result = await _cartUseCases.decreaseQuantity(event.cartItemId, state.cart!.restaurantId);
    result.when(success: (data) {
      final cartItem = state.cart?.items.firstWhere(
        (element) => element.id == event.cartItemId,
      );
      late final Cart? cart;
      if (cartItem!.quantity > 1) {
        cart = state.cart?.copyWith(items: state.cart?.items.map((e) => e.id == event.cartItemId ? e.copyWith(quantity: e.quantity - 1) : e).toList());
      } else {
        cart = state.cart?.copyWith(items: state.cart?.items.where((e) => e.id != event.cartItemId).toList());
      }
      emit(state.copyWith(cart: cart, decreaseQuantityStatus: Status.success, updatingCartItemId: null));
    }, error: (error) {
      emit(state.copyWith(decreaseQuantityStatus: Status.failed, updatingCartItemId: null));
      debugPrint(error.toString());
    });
  }

  FutureOr<void> _incrementQuantity(_IncrementQuantity event, Emitter<CartState> emit) async {
    emit(state.copyWith(increaseQuantityStatus: Status.loading, updatingCartItemId: event.cartItemId));
    final result = await _cartUseCases.incrementQuantity(event.cartItemId, state.cart!.restaurantId);
    result.when(success: (data) {
      final Cart? cart =
          state.cart?.copyWith(items: state.cart?.items.map((e) => e.id == event.cartItemId ? e.copyWith(quantity: e.quantity + 1) : e).toList());

      emit(state.copyWith(cart: cart, increaseQuantityStatus: Status.success, updatingCartItemId: null));
    }, error: (error) {
      emit(state.copyWith(increaseQuantityStatus: Status.failed, updatingCartItemId: null));
      debugPrint(error.toString());
    });
  }
}
