import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/utils/status.dart';
import 'package:kachpara/widgets/promotion_item.dart';

import 'cubit/promotions_page_cubit.dart';

class PromotionsPage extends StatelessWidget {
  static const String routeName = '/promotions';
  const PromotionsPage({super.key, this.storeName = "", required this.storeId});

  final String storeName;
  final int storeId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<PromotionsPageCubit>(param1: storeId.toString()),
      child: _PromotionsPageLayout(
        storeName: storeName,
      ),
    );
  }
}

class _PromotionsPageLayout extends StatelessWidget {
  const _PromotionsPageLayout({required this.storeName});
  final String storeName;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(context.l10n.promotions_page_promotions),
              floating: true,
              snap: true,
            ),
            SliverList(delegate: SliverChildListDelegate([])),
            BlocBuilder<PromotionsPageCubit, PromotionsPageState>(
              builder: (context, state) {
                if (state.getPromotionsStatus == Status.success) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final promotion = state.promotions[index];
                        return (promotion.type == "FREE")
                            ? FreePromotionCouponitem(
                                promotion: promotion,
                              )
                            : PromotionCouponitem(
                                promotion: promotion,
                              );
                      },
                      childCount: state.promotions.length,
                    ),
                  );
                } else if (state.getPromotionsStatus == Status.loading) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                      ),
                    ),
                  );
                } else {
                  return SliverToBoxAdapter(
                    child: ErrorWidget(state.getPromotionsErrorMessage ?? ""),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
