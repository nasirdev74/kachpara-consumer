import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/app/selected_items_bloc/selected_items_bloc.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/entities/payment_card.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/buy_gift_page/cubit/buy_gift_page_cubit.dart';
import 'package:kachpara/ui/order_success_page/order_success_page.dart';
import 'package:kachpara/ui/payment_methods_page/payment_methods_page.dart';
import 'package:kachpara/utils/status.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../widgets/button.dart';

class BuyGiftPage extends StatelessWidget {
  static const String routeName = "buy_gift_page";
  const BuyGiftPage({super.key, required this.storeId, this.userId, required this.promotionId});

  final String storeId;
  final String promotionId;
  final String? userId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<BuyGiftPageCubit>(),
      child: Builder(
        builder: (context) {
          final cubit = context.read<BuyGiftPageCubit>();
          cubit.initialize(
            storeId: storeId,
            promotionId: promotionId,
            userId: userId!,
          );
          return const _BuyGiftPageLayout();
        },
      ),
    );
  }
}

class _BuyGiftPageLayout extends StatelessWidget {
  const _BuyGiftPageLayout();

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
          child: Column(
            children: [
              const ProductSection(),
              const _SavedCardssection(),
              const _PlaceOrderButton(),
            ],
          ),
        ),
      ),
    );
  }
}

class ProductSection extends StatelessWidget {
  const ProductSection({Key? key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuyGiftPageCubit, BuyGiftPageState>(
      builder: (context, state) {
        if (state.buyGiftPageStatus == Status.loading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final price = state.store!.currencySymbol + state.freePromotion!.products[0].price.toString();
        final whatsapp = state.store!.whatsapp!;

        final requestText = "${state.user!.name!} senden ${state.freePromotion!.products[0].name} ısmarlamanı istiyor? ";
        final requestText2 = "Kredi Kartınla ödemeyi yap ${state.user!.name!} istediği zaman gidip dükkandan alsın! Dükkan: ${state.store!.name} ";
        return SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Kime Ismarlıyorsun?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        state.user!.name!,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.blue),
                      ),
                      const Text(
                        "Ne Ismarlıyorsun?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        state.freePromotion!.products[0].name,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.blue),
                      ),
                      const Text(
                        "Kaç para?",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20.0,
                        ),
                      ),
                      Text(
                        price,
                        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.blue),
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Checklist section
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              const Icon(Icons.store_mall_directory, color: Colors.green, size: 32.0),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  state.store!.name ?? "",
                                  style: const TextStyle(fontSize: 16.0),
                                  overflow: TextOverflow.visible,
                                  maxLines: null,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18.0),
                          Row(
                            children: [
                              const Icon(Icons.pin_drop, color: Colors.green, size: 32.0),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: InkWell(
                                  onTap: () async {
                                    final address = state.store?.address ?? "";
                                    MapsLauncher.launchQuery(address);
                                  },
                                  child: Text(
                                    state.store?.address ?? "",
                                    style: const TextStyle(fontSize: 12.0, color: Colors.blue),
                                    overflow: TextOverflow.visible,
                                    maxLines: null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18.0),
                          InkWell(
                            onTap: () async {
                              var textmessage = "Ücretsiz Hediyem için yardımcı olur musunuz?";
                              var whatsappAndroid = Uri.parse("https://wa.me/$whatsapp?text=$textmessage");
                              if (await canLaunchUrl(whatsappAndroid)) {
                                await launchUrl(whatsappAndroid, mode: LaunchMode.externalApplication);
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(context.l10n.claim_free_promotions_page_whatsapp_not_installed),
                                  ),
                                );
                              }
                            },
                            child: Row(
                              children: [
                                const Icon(Icons.phone, color: Colors.green, size: 32.0),
                                const SizedBox(width: 8.0),
                                Expanded(
                                  child: Text(
                                    context.l10n.claim_free_promotions_page_whatsapp_contact(whatsapp),
                                    style: const TextStyle(fontSize: 16.0),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
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
    return BlocListener<BuyGiftPageCubit, BuyGiftPageState>(
        listener: (context, state) {
          if (state.buyGiftPageStatus == Status.success && state.orderId != null) {
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
                await context.read<BuyGiftPageCubit>().checkout();
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
