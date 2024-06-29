import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/domain/entities/address.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/claim_gift_page/cubit/claim_gift_page_cubit.dart';
import 'package:kachpara/ui/order_success_page/order_success_page.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/injector.dart';
import '../../utils/status.dart';

class ClaimGiftPage extends StatelessWidget {
  static String routeName = "claim_gift_page";
  final String orderId;

  const ClaimGiftPage({super.key, required this.orderId});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => getIt<ClaimGiftPageCubit>(param1: orderId), child: const ClaimGiftPageLayout());
  }
}

class ClaimGiftPageLayout extends StatefulWidget {
  const ClaimGiftPageLayout({super.key});

  @override
  State<ClaimGiftPageLayout> createState() => _ClaimGiftPageLayoutState();
}

class _ClaimGiftPageLayoutState extends State<ClaimGiftPageLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Hediye Detay"),
      ),
      body: BlocBuilder<ClaimGiftPageCubit, ClaimGiftPageState>(
        builder: (context, state) {
          if (state.claimPageStatus == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          String? errorMessage;
          if (!state.isNearStoreStatus) {
            errorMessage = context.l10n.claim_free_promotions_page_user_not_in_store;
          }
          final whatsapp = state.store!.whatsapp!;

          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "Hediyeyi Gönderen",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    Text(
                      state.order!.userName,
                      style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 20.0, color: Colors.blue),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
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
                              const Icon(Icons.fastfood, color: Colors.green, size: 32.0),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Text(state.order!.items[0].product.name),
                              ),
                            ],
                          ),
                          const SizedBox(height: 18.0),
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
                      // Button section
                      const SizedBox(height: 26.0),
                      if (errorMessage != null)
                        Expanded(
                          child: Text(
                            errorMessage,
                            style: const TextStyle(fontSize: 16.0, color: Colors.red),
                          ),
                        ),
                      ElevatedButton(
                          key: const Key("submitFreePromotionOrder"),
                          onPressed: state.isNearStoreStatus && state.getOrderState != Status.loading
                              ? () {
                                  context.read<ClaimGiftPageCubit>().submitOrder(Address(id: "", name: "", address: state.store?.address ?? ""),
                                      state.order!.items[0].product.price, state.store!.id, state.order!.items, DateTime.now(), false);
                                }
                              : null,
                          child: BlocConsumer<ClaimGiftPageCubit, ClaimGiftPageState>(listener: (context, state) {
                            if (state.getOrderState == Status.success) {
                              context.goNamed(OrderSuccessPage.routeName, pathParameters: {"orderId": state.orderId ?? ""});
                            } else if (state.getOrderState == Status.failed) {
                              ScaffoldMessenger.of(context)
                                ..removeCurrentSnackBar()
                                ..showSnackBar(SnackBar(content: Text(context.l10n.claim_free_promotions_page_order_submit_failed)));
                            }
                          }, builder: (context, state) {
                            if (state.getOrderState == Status.loading) {
                              return CircularProgressIndicator.adaptive(
                                valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).primaryColor),
                              );
                            }
                            return Text(context.l10n.claim_free_promotions_page_submit_my_order);
                          })),
                    ],
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
