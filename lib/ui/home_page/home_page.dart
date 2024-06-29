import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/app/store_bloc/store_bloc.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/domain/entities/store.dart';
import 'package:kachpara/l10n/extensions/extensions.dart';
import 'package:kachpara/ui/claim_free_promotion_page/claim_free_promotion_page.dart';
import 'package:kachpara/ui/google_map_page/cubit/google_map_cubit.dart';
import 'package:kachpara/ui/google_map_page/google_map_page.dart';
import 'package:kachpara/ui/leaderboard_page/leaderboard_page.dart';
import 'package:kachpara/ui/loyalty_page/loyalty_page.dart';
import 'package:kachpara/ui/onboard_page/onboard_page.dart';
import 'package:kachpara/ui/products_list_page/product_list_page.dart';
import 'package:kachpara/ui/referral_code_entry_page/referral_code_entry_page.dart';
import 'package:kachpara/ui/store_details_page/store_details_page.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app/cart_bloc/cart_bloc.dart';
import '../../core/injector.dart';
import '../checkout_page/checkout_page.dart';
import '../reward_share_page/reward_share_page.dart';
import 'cubit/home_page_cubit.dart';

class HomePage extends StatefulWidget {
  static const String routeName = 'home_page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<HomePageCubit>(),
      child: const HomePageLayout(),
    );
  }
}

class HomePageLayout extends StatefulWidget {
  const HomePageLayout({
    super.key,
  });

  @override
  State<HomePageLayout> createState() => _HomePageLayoutState();
}

class _HomePageLayoutState extends State<HomePageLayout> {
  @override
  Widget build(BuildContext context) {
    final stores = context.select((StoreBloc value) => value.state.stores);
    final cart = context.watch<CartBloc>().state.cart;
    final user = getIt<UserBloc>().state.user;
    return Scaffold(
        appBar: AppBar(
          title: const Text('Kachpara'),
          centerTitle: true,
          actions: [
            if (user?.isAdmin ?? false)
              IconButton(
                icon: Icon(
                  Icons.pin_drop,
                  color: Theme.of(context).primaryColor,
                  size: 40,
                ),
                onPressed: () async {
                  var isUpdateNeed = await Navigator.push(context, MaterialPageRoute(
                    builder: (context) {
                      return BlocProvider(create: (context) => getIt<GoogleMapCubit>(), child: const MapScreen());
                    },
                  ));

                  if (isUpdateNeed == true) {
                    getIt<StoreBloc>().add(const StoreBlocEvent.getStores());
                  }
                },
              ),
            IconButton(
              key: const Key('addStoreReferral'),
              icon: Icon(
                Icons.add_circle,
                color: Theme.of(context).primaryColor,
                size: 40,
              ),
              onPressed: () {
                context.pushNamed(ReferralCodeEntryPage.routeName);
              },
            ),
            const SizedBox(
              width: 10,
            ),
          ],
        ),
        body: Column(
          children: [
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  if (stores.isNotEmpty)
                    /* SliverPadding(
                      // padding: const EdgeInsetsDirectional.only(top: 40, bottom: 20),
                      sliver: */
                    SliverToBoxAdapter(
                      child: Container(
                        // padding: const EdgeInsets.only(left: 20, top: 30, bottom: 20),
                        color: Colors.white,
                        child: Container(
                          padding: const EdgeInsets.only(left: 50, top: 10, bottom: 30),
                        ),
                      ),
                    ),
                  if (stores.isNotEmpty)
                    StoreGridList(
                      stores: stores,
                    ),
                  if (stores.isEmpty) const SliverFillRemaining(child: EmptyHomePageBody()),
                ],
              ),
            ),
            if (cart != null)
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: InkWell(
                  onTap: () async {
                    context.pushNamed(CheckoutPage.routeName, queryParameters: {"storeId": cart.restaurantId.toString()});
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    height: 66,
                    width: double.infinity,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                      child: Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text("${cart.items.length} ${context.l10n.nav_bar_items}",
                                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white)),
                                Flexible(
                                  child: Text("₺${cart.items.fold<double>(0, (acc, item) => acc + (item.quantity * (item.product.price)))}",
                                      style: Theme.of(context).textTheme.bodyLarge!.copyWith(color: Colors.white)),
                                ),
                              ],
                            ),
                          ),
                          TextButton(
                              key: const Key('viewCart'),
                              onPressed: () {
                                context.pushNamed(CheckoutPage.routeName, queryParameters: {"storeId": cart.restaurantId.toString()});
                              },
                              child: Text(
                                context.l10n.nav_bar_view_cart,
                                style: Theme.of(context).textTheme.titleMedium?.copyWith(color: Colors.white),
                              )),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
          ],
        ));
  }
}

class StoreGridList extends StatelessWidget {
  StoreGridList({
    super.key,
    required this.stores,
  });

  final List<Store> stores;
  final Color firstColor = Colors.green.shade100;
  final Color secondColor = Colors.green.shade100;
  final Color thirdColor = Colors.green.shade100;

  @override
  Widget build(BuildContext context) {
    final user = getIt<UserBloc>().state.user;
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 00),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 200, crossAxisCount: 1, crossAxisSpacing: 10, mainAxisSpacing: 0),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final store = stores[index];
            if (store.kachparaEnabled ?? false) {
              return BaseListItem(
                storeData: store,
              );
            } else if (user!.isAdmin) {
              return OnboardListItem(
                storeData: store,
              );
            }
            return null;
          },
          childCount: stores.length,
        ),
      ),
    );
  }
}

class BaseListItem extends StatelessWidget {
  const BaseListItem({
    super.key,
    this.storeData,
  });

  final Store? storeData;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = getIt<UserBloc>().state.user;
    return InkWell(
      child: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 20, right: 10),
        child: Container(
          decoration: BoxDecoration(borderRadius: BorderRadius.circular(20), color: Colors.green.shade200),
          padding: const EdgeInsets.only(
            // left: 32,
            top: 15.0,
            bottom: 15,
          ),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, mainAxisAlignment: MainAxisAlignment.spaceBetween, children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween, // Aligns children at start and end
                children: [
                  Text(
                    storeData?.shortenedName ?? "",
                    style: textTheme.titleLarge?.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 10.0),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () async {
                            Uri uri = Uri.https('www.google.com', '/maps/search/', {'api': '1', 'query': storeData?.address ?? ""});
                            launchUrl(uri);
                            // MapsLauncher.launchQuery(
                            //   storeData?.address ?? "",
                            // );
                          },
                          child: const Icon(
                            Icons.directions,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 12,
            ),
            Container(
              padding: const EdgeInsets.only(left: 35),
              height: 100,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  _buttons(textTheme, onPressed: () {
                    context.goNamed(ClaimFreePromotionPage.routeName, queryParameters: {"storeId": storeData?.id, "promotionId": "eSQUn2FAN70E6AJOO44t"});
                  },
                      icons: const Icon(
                        color: Colors.white,
                        Icons.volunteer_activism,
                        size: 18,
                      ),
                      // label: "Order",
                      label: "Askıdan Al",
                      key: Key("claim-${storeData?.id.toString() ?? ""}")),
                  const SizedBox(
                    width: 12,
                  ),
                  if (storeData?.isLoyaltyEnabled ?? false) ...[
                    _buttons(
                      textTheme,
                      icons: const Icon(
                        color: Colors.white,
                        Icons.currency_lira,
                        size: 18,
                      ),
                      label: "Loyalty",
                      key: Key("loyalty-${storeData?.id.toString() ?? ""}"),
                      onPressed: () {
                        context.pushNamed(
                          LoyaltyPage.routeName,
                          queryParameters: {'storeId': storeData?.id.toString()},
                        );
                      },
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                  ],
                  if (storeData?.isRewardEnabled ?? false) ...[
                    _buttons(
                      textTheme,
                      // label: "Reward",
                      icons: const Icon(
                        color: Colors.white,
                        Icons.currency_lira,
                        size: 18,
                      ),
                      label: "Paylaş\nKazan",
                      key: Key("reward-${storeData?.id.toString() ?? ""}"),
                      onPressed: () {
                        context.pushNamed(
                          RewardSharePage.routeName,
                          queryParameters: {'storeId': storeData?.id.toString()},
                        );
                      },
                    ),
                    const SizedBox(
                      width: 12,
                    ),
                  ],
                  if (storeData?.orderEnabled ?? false) ...[
                    _buttons(textTheme, onPressed: () {
                      context.pushNamed(
                        ProductListpage.routeName,
                        queryParameters: {"storeId": storeData?.id},
                      );
                    },
                        icons: const Icon(
                          color: Colors.white,
                          Icons.restaurant,
                          size: 18,
                        ),
                        // label: "Order",
                        label: "Sipariş Ver",
                        key: Key("menu-${storeData?.id.toString() ?? ""}")),
                    const SizedBox(
                      width: 12,
                    ),
                  ],
                  if ((user?.isAdmin ?? false) || (storeData?.adminUserIds.contains(user?.id) ?? false))
                    _buttons(
                      textTheme,
                      icons: const Icon(
                        color: Colors.white,
                        Icons.currency_lira,
                        size: 18,
                      ),
                      label: "Details",
                      key: Key("store-${storeData?.id.toString() ?? ""}"),
                      onPressed: () {
                        context.pushNamed(
                          StoreDetailsPage.routeName,
                          queryParameters: {'storeId': storeData!.id.toString()},
                        );
                      },
                    ),
                  // const SizedBox(
                  //   width: 12,
                  // ),
                  // _buttons(textTheme, onPressed: () {
                  //   context.pushNamed(
                  //     LeaderboardPage.routeName,
                  //     queryParameters: {"storeId": storeData?.id, "storeName": storeData?.name},
                  //   );
                  // },
                  //     icons: const Icon(
                  //       color: Colors.white,
                  //       Icons.emoji_events,
                  //       size: 18,
                  //     ),
                  //     // label: "Order",
                  //     label: "Liderlik",
                  //     key: Key("leadership-${storeData?.id.toString() ?? ""}")),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buttons(TextTheme textTheme, {String? label, Widget? icons, void Function()? onPressed, Key? key}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Column(
        children: [
          FloatingActionButton(
            heroTag: UniqueKey(),
            key: key,
            elevation: 2,
            backgroundColor: Colors.red.shade300,
            onPressed: onPressed,
            child: icons,
          ),
          SizedBox(height: 4),
          Text(
            label ?? "",
            style: textTheme.titleSmall?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardListItem extends StatelessWidget {
  const OnboardListItem({
    super.key,
    this.storeData,
  });

  final Store? storeData;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    final user = getIt<UserBloc>().state.user;
    return InkWell(
      onTap: () {
        context.pushNamed(
          OnboardPage.routeName,
          queryParameters: {'storeId': storeData?.id.toString()},
        );
      },
      child: Padding(
        padding: const EdgeInsets.only(left: 20, bottom: 20, right: 10),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: Colors.red.shade100,
          ),
          padding: const EdgeInsets.only(
            top: 15.0,
            bottom: 15,
          ),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        storeData?.shortenedName ?? "",
                        style: textTheme.titleLarge?.copyWith(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 10.0),
                        child: Row(
                          children: [
                            InkWell(
                              onTap: () async {
                                Uri uri = Uri.https('www.google.com', '/maps/search/', {'api': '1', 'query': storeData?.address ?? ""});
                                launchUrl(uri);
                                // MapsLauncher.launchQuery(
                                //   storeData?.address ?? "",
                                // );
                              },
                              child: const Icon(
                                Icons.directions,
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 12,
                ),
                Container(
                  padding: const EdgeInsets.only(left: 35),
                  height: 78,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    children: [
                      if ((user?.isAdmin ?? false) || (storeData?.adminUserIds.contains(user?.id) ?? false))
                        _buttons(
                          textTheme,
                          icons: const Icon(
                            color: Colors.white,
                            Icons.currency_lira,
                            size: 18,
                          ),
                          label: "Details",
                          key: Key("store-${storeData?.id.toString() ?? ""}"),
                          onPressed: () {
                            context.pushNamed(
                              StoreDetailsPage.routeName,
                              queryParameters: {'storeId': storeData!.id.toString()},
                            );
                          },
                        ),
                      const SizedBox(
                        width: 12,
                      ),
                      _buttons(
                        textTheme,
                        // label: "Reward",
                        icons: const Icon(
                          Icons.campaign,
                          size: 18,
                        ),
                        label: "Erişim",
                        onPressed: () {
                          context.pushNamed(
                            OnboardPage.routeName,
                            queryParameters: {'storeId': storeData?.id.toString()},
                          );
                        },
                      ),
                      _buttons(textTheme, onPressed: () {
                        context.pushNamed(
                          ProductListpage.routeName,
                          queryParameters: {"storeId": storeData?.id},
                        );
                      },
                          icons: const Icon(
                            color: Colors.white,
                            Icons.restaurant,
                            size: 18,
                          ),
                          // label: "Order",
                          label: "Menü",
                          key: Key("menu-${storeData?.id.toString() ?? ""}")),
                      const SizedBox(
                        width: 12,
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      _buttons(textTheme, onPressed: () {
                        context.pushNamed(
                          LeaderboardPage.routeName,
                          queryParameters: {"storeId": storeData?.id, "storeName": storeData?.name},
                        );
                      },
                          icons: const Icon(
                            Icons.emoji_events,
                            size: 18,
                          ),
                          // label: "Order",
                          label: "Liderlik",
                          key: Key(storeData?.id.toString() ?? "")),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buttons(TextTheme textTheme, {String? label, Widget? icons, void Function()? onPressed, Key? key}) {
    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Column(
        children: [
          FloatingActionButton(
            heroTag: UniqueKey(),
            key: key,
            elevation: 2,
            backgroundColor: Colors.red.shade300,
            onPressed: onPressed,
            child: icons,
          ),
          SizedBox(height: 4),
          Text(
            label ?? "",
            style: textTheme.titleSmall?.copyWith(
              color: Colors.black,
              fontWeight: FontWeight.w500,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}

class EmptyHomePageBody extends StatelessWidget {
  const EmptyHomePageBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 32),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.l10n.home_page_welcome,
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 8),
            Text(
              context.l10n.home_page_welcome_subtext,
              style: const TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}

// showAddStoreDialog(context) {
//   return showDialog(
//     context: context,
//     builder: (context) {
//       return Dialog(
//         child: Container(
//           padding: const EdgeInsets.all(20),
//           child: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ButtonWidget(
//                   key: const Key('addStoreReferral'),
//                   onPressed: () {
//                     Navigator.pop(context);
//                     context.pushNamed(ReferralCodeEntryPage.routeName);
//                   },
//                   text: context.l10n.home_page_add_store),
//               const VerticallSmallSpace(),
//               ButtonWidget(
//                   key: const Key('addFromMap'),
//                   onPressed: () async {
//                     Navigator.pop(context);
//                     var isUpdateNeed = await Navigator.push(context, MaterialPageRoute(
//                       builder: (context) {
//                         return BlocProvider(create: (context) => getIt<GoogleMapCubit>(), child: const MapScreen());
//                       },
//                     ));

//                     if (isUpdateNeed == true) {
//                       getIt<StoreBloc>().add(const StoreBlocEvent.getStores());
//                     }
//                   },
//                   text: context.l10n.home_page_add_from_map),
//             ],
//           ),
//         ),
//       );
//     },
//   );
// }
