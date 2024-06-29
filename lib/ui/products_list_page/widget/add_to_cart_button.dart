import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kachpara/app/cart_bloc/cart_bloc.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/entities/product.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/products_list_page/cubit/product_list_page_cubit.dart';

import '../../../domain/entities/cart_item.dart';

class AddToCartButton extends StatelessWidget {
  const AddToCartButton({
    super.key,
    required this.product,
    required this.storeId,
    this.curationId,
  });
  final Product product;
  final String storeId;
  final String? curationId;

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartBloc>().state.cart;

    final cartItem = cart?.items.firstWhereOrNull((element) => element.product.id == product.id);
    return (cartItem != null)
        ? Container(
            padding: const EdgeInsets.all(0),
            decoration: BoxDecoration(
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.circular(31.5),
            ),
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                IconButton(
                  visualDensity: VisualDensity.compact,
                  icon: Container(
                      height: 25,
                      width: 25,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.remove,
                        color: Theme.of(context).primaryColor,
                      )),
                  onPressed: () {
                    context.read<CartBloc>().add(CartEvent.decreaseQuantity(cartItem.id));
                  },
                ),
                Padding(
                  padding: const EdgeInsets.all(4.0),
                  child: Text(
                    '${cart?.items.firstWhere((element) => element.product.id == product.id).quantity}',
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold, color: Colors.white),
                  ),
                ),
                IconButton(
                  visualDensity: VisualDensity.compact,
                  icon: Container(
                      height: 25,
                      width: 25,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Icon(
                        Icons.add,
                        color: Theme.of(context).primaryColor,
                      )),
                  onPressed: () {
                    context.read<CartBloc>().add(CartEvent.incrementQuantity(cartItem.id));
                  },
                ),
              ],
            ),
          )
        : ElevatedButton(
            style: ButtonStyle(
              minimumSize: MaterialStateProperty.all<Size>(const Size(112, 48)),
              visualDensity: VisualDensity.compact,
            ),
            onPressed: () async {
              if (context.read<UserBloc>().state.user?.phoneNo == null) {
                showDialogToGoToLogin(context);
                return;
              }
              if (cart?.restaurantId != null && cart?.restaurantId != storeId) {
                final result = await showDialogToStartNewCart(context);
                if (result == false) {
                  return;
                }
              }
              context.read<ProductListPageCubit>().addProductToCart(product, storeId, curationId);
              print(getIt<CartBloc>().state.cart?.items);
            },
            child: Text(context.l10n.common_button_add));
  }

  Future<bool> showDialogToStartNewCart(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Start new cart'),
              content: const Text('Are you sure you want to start a new cart?'),
              actions: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(const Size(100, 48)),
                  ),
                  child: Text(context.l10n.common_button_cancel),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    minimumSize: MaterialStateProperty.all<Size>(const Size(100, 48)),
                  ),
                  child: Text(context.l10n.common_button_start),
                  onPressed: () {
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          },
        ) ??
        false;
  }

  Future<bool> showDialogToGoToLogin(BuildContext context) async {
    return await showDialog<bool>(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text(context.l10n.add_to_cart_login),
              content: Text(context.l10n.add_to_cart_message_login_to_continue),
              actions: <Widget>[
                ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(const Size(100, 30)),
                    maximumSize: MaterialStateProperty.all<Size>(const Size(100, 30)),
                    minimumSize: MaterialStateProperty.all<Size>(const Size(100, 30)),
                  ),
                  child: Text(context.l10n.common_button_cancel),
                  onPressed: () {
                    Navigator.of(context).pop(false);
                  },
                ),
                ElevatedButton(
                  style: ButtonStyle(
                    fixedSize: MaterialStateProperty.all<Size>(const Size(100, 30)),
                    maximumSize: MaterialStateProperty.all<Size>(const Size(100, 30)),
                    minimumSize: MaterialStateProperty.all<Size>(const Size(100, 30)),
                  ),
                  child: Text(key: const Key("continueButton"), context.l10n.common_button_continue),
                  onPressed: () {
                    context.read<UserBloc>().add(const UserEvent.requestLogin());
                    Navigator.of(context).pop(true);
                  },
                ),
              ],
            );
          },
        ) ??
        false;
  }
}

extension on List<CartItem> {
  CartItem? firstWhereOrNull(bool Function(CartItem) test) {
    for (final element in this) {
      if (test(element)) {
        return element;
      }
    }
    return null;
  }
}
