import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/app/cart_bloc/cart_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/data/sources/firestore/cart_data.dart';
import 'package:kachpara/domain/entities/cart.dart';
import 'package:kachpara/domain/entities/cart_item.dart';
import 'package:kachpara/domain/entities/product.dart';
import 'package:kachpara/utils/result.dart';

import '../../app/user_bloc/user_bloc.dart';
import '../../data/models/cart_item_model.dart';

@injectable
class CartUseCases {
  CartUseCases(this._cartData);

  final CartData _cartData;

  Future<Result<Cart?>> getCart() async {
    try {
      final user = getIt<UserBloc>().state.user;
      if (user == null) {
        return const Result.error("User not logged in");
      }
      final result = await _cartData.getCart(userId: user.id);
      return result.when(success: ((data) {
        return Result.success(data?.toDomain());
      }), error: (e) {
        return Result.error(e);
      });
    } catch (e) {
      debugPrint("Error in getting cart: $e");
      return Result.error(e.toString());
    }
  }

  Future<Result<Cart>> addToCart(Product product, String storeId, String? curationId) async {
    final user = getIt<UserBloc>().state.user;
    final cart = getIt<CartBloc>().state.cart;
    late final Cart newCart;
    // if (cart?.items.any((item) => item.product.id == product.id) ?? false) {
    //   debugPrint("Item exists in cart");
    //   newCart = cart!.copyWith(
    //     items: cart.items.map((item) {
    //       if (item.product.id == product.id) {
    //         return item.copyWith(quantity: item.quantity + 1);
    //       }
    //       return item;
    //     }).toList(),
    //   );
    // } else {
    if (cart == null) {
      newCart = Cart(
        restaurantId: storeId,
        curationId: curationId,
        items: [
          CartItem(
            id: product.id,
            quantity: 1,
            product: product,
          )
        ],
      );
    } else if (storeId == cart.restaurantId) {
      final items = cart.items
        ..add(CartItem(
          id: product.id,
          quantity: 1,
          product: product,
        ));
      newCart = cart.copyWith(items: items);
    } else if (storeId != cart.restaurantId) {
      newCart = Cart(
        restaurantId: storeId,
        curationId: curationId,
        items: [
          CartItem(
            id: product.id,
            quantity: 1,
            product: product,
          )
        ],
      );
    }
    // }
    final cartItem = newCart.items.firstWhere(
      (item) => item.product.id == product.id,
    );
    final result = await _cartData.addCartItem(user!.id, CartItemModel.fromDomain(cartItem), storeId, curationId);
    return result.when(success: ((data) {
      getIt<CartBloc>().add(CartEvent.addToCart(newCart));
      return Result.success(newCart);
    }), error: (e) {
      print("Error adding to cart in usecase: $e");
      return Result.error(e);
    });
  }

  Future<Result<void>> removeFromCart(CartItem cartItem, String storeId) async {
    final user = getIt<UserBloc>().state.user;
    if (user == null) {
      return const Result.error("User not logged in");
    }
    return await _cartData.deleteCartItem(user.id, CartItemModel.fromDomain(cartItem), storeId);
  }

  Future<Result<void>> decreaseQuantity(int cartItemId, String storeId) async {
    final user = getIt<UserBloc>().state.user;
    if (user == null) {
      return const Result.error("User not logged in");
    }
    final result = await _cartData.decreaseCartItemQuantity(user.id, cartItemId, storeId);
    return result.when(success: (v) {
      return Result.success(v);
    }, error: (e) {
      return Result.error(e);
    });
  }

  Future<Result<void>> incrementQuantity(int cartItemId, String storeId) async {
    final user = getIt<UserBloc>().state.user;
    if (user == null) {
      return const Result.error("User not logged in");
    }
    final result = await _cartData.incrementCartItemQuantity(user.id, cartItemId, storeId);
    return result.when(success: (v) {
      return Result.success(v);
    }, error: (e) {
      return Result.error(e);
    });
  }

  Future<Result<void>> clearCart(String storeId) async {
    final user = getIt<UserBloc>().state.user;
    if (user == null) {
      return const Result.error("User not logged in");
    }

    return await _cartData.deleteCart(user.id, storeId);
  }
}
