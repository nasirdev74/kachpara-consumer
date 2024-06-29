import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/app/selected_items_bloc/selected_items_bloc.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/entities/payment_card.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/order_success_page/order_success_page.dart';
import 'package:kachpara/ui/payment_methods_page/payment_methods_page.dart';
import 'package:kachpara/ui/send_gift_page/cubit/send_gift_page_cubit.dart';
import 'package:kachpara/utils/status.dart';

import '../../widgets/button.dart';

class SendGiftPage extends StatelessWidget {
  static const String routeName = "send_gift_page";
  const SendGiftPage({super.key, required this.storeId, this.userId, required this.promotionId});

  final String storeId;
  final String promotionId;
  final String? userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<SendGiftPageCubit>(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<SendGiftPageCubit>();
          cubit.initialize(
            storeId: storeId,
            promotionId: promotionId,
            userId: userId!,
          );
          return const _SendGiftPageLayout();
        },
      ),
    );
  }
}

class _SendGiftPageLayout extends StatelessWidget {
  const _SendGiftPageLayout();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Yemek Ismarla"),
          centerTitle: true,
          elevation: 0,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: CustomScrollView(slivers: [
              SliverList(delegate: SliverChildListDelegate([const ProductSection(), const _SavedCardssection(), const _PlaceOrderButton()])),
            ]),
          ),
        ));
  }
}

class ProductSection extends StatelessWidget {
  const ProductSection({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SendGiftPageCubit, SendGiftPageState>(
      builder: (context, state) {
        if (state.sendGiftPageStatus == Status.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final price = state.store!.currencySymbol + state.freePromotion!.products[0].price.toString();

        final requestText = "${state.user!.name!} senden ${state.freePromotion!.products[0].name} ısmarlamanı istiyor? ";
        final requestText2 = "Kredi Kartınla ödemeyi yap ${state.user!.name!} istediği zaman gidip dükkandan alsın! Dükkan: ${state.store!.name} ";
        return Container(
          alignment: Alignment.center,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(requestText, style: const TextStyle(fontSize: 18.0, color: Colors.blue)),
              const SizedBox(
                height: 20,
              ),
              Image.network('https:${state.freePromotion!.products[0].imageFileName}'),
              const SizedBox(
                height: 20,
              ),
              Text(requestText2, style: const TextStyle(fontSize: 18.0, color: Colors.red)),
              const SizedBox(
                height: 20,
              ),
            ],
          ),
        );
      },
    );
  }
}

class _PlaceOrderButton extends StatelessWidget {
  const _PlaceOrderButton();
  @override
  Widget build(BuildContext context) {
    return BlocListener<SendGiftPageCubit, SendGiftPageState>(
        listener: (context, state) {
          if (state.sendGiftPageStatus == Status.success && state.orderId != null) {
            context.goNamed(OrderSuccessPage.routeName, pathParameters: {"orderId": state.orderId ?? ""});
          }
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: ButtonWidget(
              key: const Key("placeOrder"),
              onPressed: () async {
                final phoneNo = context.read<UserBloc>().state.user?.phoneNo;
                if (phoneNo == null) {
                  showDialogToGoToLogin(context);
                  return;
                }
                await context.read<SendGiftPageCubit>().checkout();
              },
              text: "Ödeme Yap"),
        ));

    // return BlocBuilder<SendGiftPageCubit, SendGiftPageState>(
    //   builder: (context, state) async {
    // if (state.checkoutStatus == Status.success && state.orderId != null) {
    //   // context.goNamed(OrderSuccessPage.routeName,
    //   //     pathParameters: {"orderId": state.orderId ?? ""});
    // } else if (state.checkoutStatus == Status.failed) {
    //   showSnackBar(
    //       context,
    //       state.checkoutError ??
    //           context.l10n.checkout_page_message_checkout_failed);
    // }
    // child: Padding(
    //   padding: const EdgeInsets.symmetric(vertical: 20),
    //   child: ButtonWidget(
    //       key: const Key("placeOrder"),
    //       onPressed: () async {
    //         await context.read<SendGiftPageCubit>().checkout();
    //       },
    //       text: "Ödeme Yap(${price})"),
    // ),
    //   },
    // );
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

class _SavedCardssection extends StatelessWidget {
  const _SavedCardssection();
  @override
  Widget build(BuildContext context) {
    final paymentMethod = context.select<SelectedItemsBloc, PaymentCard?>(
      (value) => value.state.selectedPaymentMethod,
    );
    final paymentMethodText = paymentMethod?.last4 ?? context.l10n.checkout_page_add_payment_method;
    return InkWell(
      key: const Key("payment_methods_list"),
      onTap: () {
        context.pushNamed(PaymentMethodsPage.routeName);
      },
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.grey,
          borderRadius: BorderRadius.circular(12),
        ),
        child: SafeArea(
            child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(context.l10n.checkout_page_payment_methods, style: const TextStyle(fontWeight: FontWeight.w500)),
                Text(paymentMethodText, style: const TextStyle(fontSize: 15))
              ],
            ),
            const Icon(
              CupertinoIcons.forward,
              color: Colors.black54,
            )
          ],
        )),
      ),
    );
  }
}
