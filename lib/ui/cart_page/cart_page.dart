import 'package:flutter/material.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';

class CartPage extends StatelessWidget {
  static const routeName = 'cart_page';
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: 10,
              itemBuilder: (context, index) {
                return const CartListItem();
              }),
        ),
        ElevatedButton(onPressed: () {}, child: Text(context.l10n.cart_page_checkout)),
      ],
    );
  }
}

class CartListItem extends StatelessWidget {
  const CartListItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        title: Text(context.l10n.cart_page_item),
      ),
    );
  }
}
