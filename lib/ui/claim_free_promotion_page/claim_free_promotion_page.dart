import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/domain/entities/address.dart';
import 'package:kachpara/domain/entities/cart_item.dart';
import 'package:kachpara/domain/entities/product.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/claim_free_promotion_page/cubit/claim_free_promotion_page_cubit.dart';
import 'package:kachpara/ui/claim_free_promotion_success_page/claim_free_promotion_success_page.dart';
import 'package:maps_launcher/maps_launcher.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../core/injector.dart';
import '../../utils/status.dart';

class ClaimFreePromotionPage extends StatelessWidget {
  static String routeName = "claim_free_promotion_page";
  final String promotionId;
  final String storeId;

  const ClaimFreePromotionPage({super.key, required this.storeId, required this.promotionId});
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (context) => getIt<ClaimFreePromotionPageCubit>(param1: storeId, param2: promotionId), child: const ClaimFreePromotionPageLayout());
  }
}

class ClaimFreePromotionPageLayout extends StatefulWidget {
  const ClaimFreePromotionPageLayout({super.key});

  @override
  State<ClaimFreePromotionPageLayout> createState() => _ClaimFreePromotionPageLayoutState();
}

class _ClaimFreePromotionPageLayoutState extends State<ClaimFreePromotionPageLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.product_list_page_promotions),
      ),
      body: BlocBuilder<ClaimFreePromotionPageCubit, ClaimFreePromotionPageState>(
        builder: (context, state) {
          if (state.claimPageStatus == Status.loading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          String? errorMessage;
          if (state.nextAvailableDate != null) {
            errorMessage = context.l10n.claim_free_promotions_page_next_available_date(state.nextAvailableDate!);
          } else if (!state.isVerified) {
            if (!state.isStudentVerified) {
              errorMessage = context.l10n.claim_free_promotions_page_student_not_verified;
            } else {
              errorMessage = context.l10n.claim_free_promotions_page_not_eligible;
            }
          } else if ((!state.isClaimAnytime && !state.isClaimStartedStatus)) {
            errorMessage = context.l10n.claim_free_promotions_page_user_not_in_store;
          } else if (!state.isNearStoreStatus) {
            errorMessage = "Kachpara uygulamasına konum izni verdikten sonra dükkanda olmanız gerekmektedir.";
          }
          final now = DateTime.now();
          final startTime = DateTime(now.year, now.month, now.day, state.promotion?.claimBeginTime ?? 0, 0);
          final endTime = DateTime(now.year, now.month, now.day, state.promotion?.claimEndTime ?? 0, 0);
          final whatsapp = state.store!.whatsapp;
          final claimedDonations = state.promotion?.claimedDonations ?? 0;
          final totalDonations = state.promotion?.totalDonations ?? 0;
          final availableDonations = totalDonations - claimedDonations;
          final availability = availableDonations > 0;
          return Column(
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      (state.promotion?.title ?? "") + " Sponsor",
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20.0,
                      ),
                    ),
                    if (state.promotion!.currentSponsorURL != null)
                      InkWell(
                        onTap: () async {
                          var sponsorLink = Uri.parse(state.promotion!.currentSponsorURL!);
                          await launchUrl(sponsorLink);
                        },
                        child: Text(
                          state.promotion?.currentSponsor ?? "Kachpara",
                          style: const TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0,
                          ),
                        ),
                      ),
                    if (state.promotion!.currentSponsorURL == null)
                      Text(
                        state.promotion?.currentSponsor ?? "Kachpara",
                        style: const TextStyle(
                          color: Colors.red,
                          fontWeight: FontWeight.bold,
                          fontSize: 40.0,
                        ),
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
                              const Icon(Icons.fastfood_rounded, color: Colors.green, size: 32.0),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  state.promotion?.description ?? "",
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
                              const Icon(Icons.numbers, color: Colors.green, size: 32.0),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  "Askıda Kalan: ${availableDonations}",
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
                              const Icon(Icons.numbers, color: Colors.green, size: 32.0),
                              const SizedBox(width: 8.0),
                              Expanded(
                                child: Text(
                                  "Askıdan Toplam Dağıtılan: ${claimedDonations}",
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
                                    state.store?.name ?? "",
                                    style: const TextStyle(fontSize: 12.0, color: Colors.blue),
                                    overflow: TextOverflow.visible,
                                    maxLines: null,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Visibility(
                            visible: !state.isClaimAnytime,
                            child: Column(
                              children: [
                                const SizedBox(height: 18.0),
                                Row(
                                  children: [
                                    const Icon(Icons.calendar_month, color: Colors.green, size: 32.0),
                                    const SizedBox(width: 8.0),
                                    Expanded(
                                      child: Text(
                                        context.l10n
                                            .claim_free_promotions_page_how_to_claim_date(state.promotion?.endDate ?? DateTime.now(), startTime, endTime),
                                        style: const TextStyle(fontSize: 16.0),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 18.0),
                          if (whatsapp != null)
                            InkWell(
                              onTap: () async {
                                var promotionName = state.promotion!.title;
                                var textmessage = context.l10n.claim_free_promotions_page_whatsapp_message_text(promotionName);
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
                          onPressed: availability &&
                                  state.isVerified &&
                                  (state.isClaimStartedStatus || state.isClaimAnytime) &&
                                  state.isNearStoreStatus &&
                                  state.getOrderState != Status.loading &&
                                  state.nextAvailableDate == null
                              ? () {
                                  context.read<ClaimFreePromotionPageCubit>().submitOrder(
                                      Address(id: "", name: "", address: state.store?.address ?? ""),
                                      state.promotion!.products[0].price,
                                      state.store!.id,
                                      state.promotion!.products
                                          .mapIndexed((i, p) => CartItem(
                                              quantity: 1,
                                              product: Product(
                                                  id: p.id,
                                                  name: p.name,
                                                  price: p.price,
                                                  currency: p.currency,
                                                  imageFileName: p.imageFileName,
                                                  priceWithSign: p.priceWithSign),
                                              id: i))
                                          .toList(),
                                      state.promotion!,
                                      DateTime.now(),
                                      false);
                                }
                              : null,
                          child: BlocConsumer<ClaimFreePromotionPageCubit, ClaimFreePromotionPageState>(listener: (context, state) {
                            if (state.getOrderState == Status.success) {
                              context.goNamed(ClaimFreePromotionSuccessPage.routeName,
                                  queryParameters: {'promotionTitle': state.promotion!.title, 'storeUrl': state.store!.storeUrl});
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
