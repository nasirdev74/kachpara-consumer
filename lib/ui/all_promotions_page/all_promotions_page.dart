import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/utils/status.dart';
import 'package:kachpara/widgets/promotion_item.dart';

import '../../core/injector.dart';
import 'cubit/all_promotions_page_cubit.dart';

class AllPromotionsPage extends StatelessWidget {
  static const String routeName = '/all-promotions';
  const AllPromotionsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AllPromotionsPageCubit>(),
      child: const _PromotionsPageLayout(),
    );
  }
}

class _PromotionsPageLayout extends StatelessWidget {
  const _PromotionsPageLayout();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: CustomScrollView(
          slivers: [
            SliverAppBar(
              title: Text(context.l10n.all_promotions_page_promotions),
              floating: true,
              snap: true,
            ),
            BlocBuilder<AllPromotionsPageCubit, AllPromotionsPageState>(
              builder: (context, state) {
                if (state.getPromotionsStatus == Status.loading) {
                  return SliverToBoxAdapter(
                    child: Center(
                      child: CircularProgressIndicator.adaptive(
                        valueColor: AlwaysStoppedAnimation(Theme.of(context).primaryColor),
                      ),
                    ),
                  );
                } else if (state.getPromotionsStatus == Status.success) {
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final stores = state.promotions.keys.toList()[index];

                        if (state.promotions[stores]!.isNotEmpty) {
                          return Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(state.promotions[stores]![0].storeName,
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
                              ListView.builder(
                                  shrinkWrap: true,
                                  itemCount: state.promotions[stores]!.length,
                                  itemBuilder: (context, index) {
                                    final promotion = state.promotions[stores]![index];
                                    return (promotion.type == "FREE")
                                        ? FreePromotionCouponitem(
                                            promotion: promotion,
                                          )
                                        : PromotionCouponitem(
                                            promotion: promotion,
                                          );
                                  }),
                            ],
                          );
                        }
                        return null;
                      },
                      childCount: state.promotions.length,
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
