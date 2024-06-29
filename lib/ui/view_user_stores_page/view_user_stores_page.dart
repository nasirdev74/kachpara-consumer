import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/entities/user.dart';
import 'package:kachpara/l10n/extensions/extensions.dart';
import 'package:kachpara/ui/buy_gift_page/buy_gift_page.dart';
import 'package:kachpara/ui/gifts_page/gifts_page.dart';
import 'package:kachpara/ui/products_list_page/product_list_page.dart';
import 'package:kachpara/ui/send_gift_page/send_gift_page.dart';
import 'package:kachpara/ui/view_user_stores_page/cubit/view_user_stores_page_cubit.dart';
import 'package:kachpara/utils/status.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../domain/entities/store.dart';
import '../competition_page/competition_page.dart';
import '../leaderboard_page/leaderboard_page.dart';
import '../onboard_page/onboard_page.dart';

class ViewUserStoresPage extends StatelessWidget {
  static const String routeName = 'view_user_stores_page';
  final String id;
  const ViewUserStoresPage({super.key, required this.id});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<ViewUserStoresPageCubit>(),
      child: ViewUserStoresPageLayout(
        id: id,
      ),
    );
  }
}

class ViewUserStoresPageLayout extends StatefulWidget {
  const ViewUserStoresPageLayout({super.key, required this.id});
  final String id;

  @override
  State<ViewUserStoresPageLayout> createState() => _ViewUserStoresPageLayoutState();
}

class _ViewUserStoresPageLayoutState extends State<ViewUserStoresPageLayout> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      final viewUserStoresCubit = context.read<ViewUserStoresPageCubit>();
      viewUserStoresCubit.getStores(widget.id);
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewUserStoresPageCubit, ViewUserStoresPageState>(builder: (context, state) {
      if (state.fetchUserStoresStatus == Status.loading) {
        return const Center(
          child: CircularProgressIndicator.adaptive(
            valueColor: AlwaysStoppedAnimation(Colors.black),
          ),
        );
      }
      final stores = context.read<ViewUserStoresPageCubit>().state.stores ?? [];
      final user = context.read<ViewUserStoresPageCubit>().state.user;
      final userName = user?.name ?? "";
      return Scaffold(
        appBar: AppBar(
          title: Text(userName),
          centerTitle: true,
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
                  if (stores.isNotEmpty) StoreGridList(stores: stores, user: user!),
                  if (stores.isEmpty) const SliverFillRemaining(child: EmptyHomePageBody()),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }
}

class StoreGridList extends StatelessWidget {
  StoreGridList({
    super.key,
    required this.stores,
    required this.user,
  });

  final List<Store> stores;
  final User user;
  final Color firstColor = Colors.green.shade100;
  final Color secondColor = Colors.green.shade100;
  final Color thirdColor = Colors.green.shade100;

  @override
  Widget build(BuildContext context) {
    return SliverPadding(
      padding: const EdgeInsets.symmetric(horizontal: 00),
      sliver: SliverGrid(
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(mainAxisExtent: 200, crossAxisCount: 1, crossAxisSpacing: 10, mainAxisSpacing: 0),
        delegate: SliverChildBuilderDelegate(
          (context, index) {
            final store = stores[index];
            if (store.kachparaEnabled ?? false) {
              return UserBaseListItem(
                storeData: store,
                user: user,
              );
            } else {
              return UserOnboardListItem(
                storeData: store,
                user: user,
              );
            }
          },
          childCount: stores.length,
        ),
      ),
    );
  }
}

class UserBaseListItem extends StatelessWidget {
  const UserBaseListItem({super.key, this.storeData, required this.user});

  final Store? storeData;
  final User user;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
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
                        // InkWell(
                        //   onTap: () async {

                        //   },
                        //   child: const Icon(
                        //     Icons.add_circle,
                        //     color: Colors.black,
                        //   ),
                        // ),
                        // const SizedBox(
                        //   width: 12,
                        // ),
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
                    context.pushNamed(
                      BuyGiftPage.routeName,
                      queryParameters: {"storeId": storeData?.id, "promotionId": "eSQUn2FAN70E6AJOO44t", "userId": user.id},
                    );
                  },
                      icons: const Icon(
                        color: Colors.white,
                        Icons.volunteer_activism,
                        size: 18,
                      ),
                      // label: "Order",
                      label: "Ismarla",
                      key: Key("gift-${storeData?.id.toString() ?? ""}")),
                  const SizedBox(
                    width: 12,
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
                  _buttons(textTheme, onPressed: () {
                    context.pushNamed(
                      LeaderboardPage.routeName,
                      queryParameters: {"storeId": storeData?.id, "storeName": storeData?.name},
                    );
                  },
                      icons: const Icon(
                        color: Colors.white,
                        Icons.list,
                        size: 18,
                      ),
                      // label: "Order",
                      label: "Liderlik",
                      key: Key("leadership-${storeData?.id.toString() ?? ""}")),
                  const SizedBox(
                    width: 12,
                  ),
                  if (storeData?.isCompetitionEnabled ?? false)
                    _buttons(textTheme, onPressed: () {
                      context.pushNamed(
                        CompetitionPage.routeName,
                        queryParameters: {"storeId": storeData?.id, "storeName": storeData?.name},
                      );
                    },
                        icons: const Icon(
                          color: Colors.white,
                          Icons.emoji_events,
                          size: 18,
                        ),
                        // label: "Order",
                        label: "Yarışma",
                        key: Key("competition-${storeData?.id.toString() ?? ""}")),
                ],
              ),
            ),
          ]),
        ),
      ),
    );
  }

  Widget _buttons(TextTheme textTheme, {String? label, Widget? icons, void Function()? onPressed, Key? key}) {
    Color _randomLightColor() {
      final Random random = Random();
      return Color.fromARGB(
        255,
        random.nextInt(200) + 55,
        random.nextInt(200) + 55,
        random.nextInt(200) + 55,
      );
    }

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Column(
        children: [
          FloatingActionButton(
            heroTag: UniqueKey(),
            key: key,
            elevation: 2,
            backgroundColor: _randomLightColor(),
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

class UserOnboardListItem extends StatelessWidget {
  const UserOnboardListItem({super.key, this.storeData, required this.user});

  final Store? storeData;
  final User user;

  @override
  Widget build(BuildContext context) {
    final textTheme = Theme.of(context).textTheme;
    return Padding(
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
    );
  }

  Widget _buttons(TextTheme textTheme, {String? label, Widget? icons, void Function()? onPressed, Key? key}) {
    Color _randomLightColor() {
      final Random random = Random();
      return Color.fromARGB(
        255,
        random.nextInt(200) + 55,
        random.nextInt(200) + 55,
        random.nextInt(200) + 55,
      );
    }

    return Padding(
      padding: const EdgeInsets.only(right: 8),
      child: Column(
        children: [
          FloatingActionButton(
            heroTag: UniqueKey(),
            key: key,
            elevation: 2,
            backgroundColor: _randomLightColor(),
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
