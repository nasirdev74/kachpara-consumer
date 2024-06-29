import 'package:coupon_uikit/coupon_uikit.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/domain/entities/promotion.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/claim_free_promotion_page/claim_free_promotion_page.dart';
import 'package:kachpara/ui/products_list_page/product_list_page.dart';

class FreePromotionCouponitem extends StatelessWidget {
  const FreePromotionCouponitem({super.key, required this.promotion});
  final Promotion promotion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: CouponCard(
          height: 160,
          curvePosition: 105,
          curveRadius: 25,
          backgroundColor: Colors.yellow,
          firstChild: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(promotion.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Card(
                      color: Colors.yellow,
                      shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.yellow, width: 1), borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          context.l10n.all_promotions_page_active,
                          style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Text(promotion.description ?? "", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.normal)),
                ),
                // if (promotion.minimumPurchaseAmount != null)
                //   Text(
                //       context.l10n
                //           .all_promotions_page_applicable_minimum_purchase(
                //               promotion.minimumPurchaseAmount!),
                //       style: Theme.of(context)
                //           .textTheme
                //           .bodyLarge
                //           ?.copyWith(fontWeight: FontWeight.normal)),
              ],
            ),
          ),
          secondChild: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.l10n.all_promotions_page_expires_in((promotion.endDate?.difference(DateTime.now()).inDays ?? 100).toString()),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.normal)),
                TextButton(
                    style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.red[900] ?? Colors.red)),
                    onPressed: () {
                      context.goNamed(ClaimFreePromotionPage.routeName, queryParameters: {"storeId": promotion.storeId, "promotionId": promotion.id});
                    },
                    child: Text(
                      context.l10n.all_promotions_page_view_details,
                      key: const Key("freePromotionDetails"),
                    ))
              ],
            ),
          )),
    );
  }
}

class PromotionCouponitem extends StatelessWidget {
  const PromotionCouponitem({super.key, required this.promotion});
  final Promotion promotion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: CouponCard(
          height: 160,
          curvePosition: 105,
          curveRadius: 25,
          backgroundColor: Colors.green[100],
          firstChild: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(promotion.title, style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Card(
                      color: Colors.green[200],
                      shape: RoundedRectangleBorder(side: const BorderSide(color: Colors.green, width: 1), borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        child: Text(
                          context.l10n.all_promotions_page_active,
                          style: Theme.of(context).textTheme.bodyLarge?.copyWith(color: Colors.black),
                        ),
                      ),
                    )
                  ],
                ),
                Expanded(
                  child: Text(promotion.description ?? "", style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: FontWeight.normal)),
                ),
                // if (promotion.minimumPurchaseAmount != null)
                //   Text(
                //       context.l10n
                //           .all_promotions_page_applicable_minimum_purchase(
                //               promotion.minimumPurchaseAmount!),
                //       style: Theme.of(context)
                //           .textTheme
                //           .bodyLarge
                //           ?.copyWith(fontWeight: FontWeight.normal)),
              ],
            ),
          ),
          secondChild: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(context.l10n.all_promotions_page_expires_in((promotion.endDate?.difference(DateTime.now()).inDays ?? 100).toString()),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.normal)),
                TextButton(
                    style: ButtonStyle(foregroundColor: MaterialStateProperty.all<Color>(Colors.red[900] ?? Colors.red)),
                    onPressed: () {
                      context.goNamed(
                        ProductListpage.routeName,
                        queryParameters: {
                          "storeId": promotion.storeId,
                        },
                      );
                    },
                    child: Text(
                      context.l10n.all_promotions_page_go_to_store,
                      key: const Key("promotionDetails"),
                    ))
              ],
            ),
          )),
    );
  }
}
