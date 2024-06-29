import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/reward_share_page/cubit/reward_share_page_cubit.dart';
import 'package:kachpara/widgets/paddings.dart';
import 'package:clipboard/clipboard.dart';
import 'package:kachpara/widgets/snackbar.dart';
import 'package:share_plus/share_plus.dart';

import '../../utils/status.dart';

class RewardSharePage extends StatelessWidget {
  static const String routeName = 'reward_share_page';
  const RewardSharePage({super.key, required this.storeId});
  final String storeId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<RewardSharePageCubit>(param1: storeId),
      child: _RewardSharePage(
        storeId: storeId,
      ),
    );
  }
}

class _RewardSharePage extends StatelessWidget {
  const _RewardSharePage({required this.storeId});

  final String storeId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.reward_share_page_share_earn),
          centerTitle: true,
        ),
        body: BlocBuilder<RewardSharePageCubit, RewardSharePageState>(builder: (context, state) {
          if (state.getRewardStatus == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          final currencySymbol = state.store!.currencySymbol;
          final firstPurchaseReward = state.store!.firstPurchaseReward ?? 0;
          final firstPurchaseRewardText = currencySymbol + firstPurchaseReward.toString();

          final addStoreReward = state.store!.addStoreReward ?? 0;
          final addStoreRewardText = currencySymbol + addStoreReward.toString();

          final totalRewardText = currencySymbol + state.userStore!.totalRewards.toString();

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        state.store!.name,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  const VerticallBigSpace(),
                  Container(
                    decoration: BoxDecoration(
                      color: Colors.red,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Column(
                              children: [
                                Text(
                                  'KAZANÇ',
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.black, fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  key: const Key("reward_share_total_rewards"),
                                  totalRewardText,
                                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(fontSize: 40, color: Colors.white, fontWeight: FontWeight.w500),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  const VerticallBigSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'DAVET ET',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 229, 235, 243),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green[500]!),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                              children: [
                                Text(state.userStore!.shareableReferralCode ?? "...",
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                          color: Colors.green[500],
                                        )),
                                IconButton(
                                  onPressed: () {
                                    if (state.userStore!.shareableReferralCode != null) {
                                      FlutterClipboard.copy(state.userStore!.shareableReferralCode!);
                                      showSnackBar(context, context.l10n.reward_share_page_coppied_to_clipborad);
                                    }
                                  },
                                  icon: Icon(
                                    Icons.copy,
                                    color: Colors.green[500],
                                    size: 20,
                                  ),
                                ),
                                VerticalDivider(
                                  color: Colors.green[500],
                                  thickness: 2,
                                ),
                                IconButton(
                                  onPressed: () {
                                    if (state.userStore!.shareableReferralCode != null) {
                                      Share.share(
                                          context.l10n.reward_share_page_first_purchase_promotion(state.userStore!.shareableReferralCode!, state.store!.name));
                                    }
                                  },
                                  icon: Icon(
                                    Icons.share,
                                    color: Colors.green[500],
                                    size: 20,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const VerticallBigSpace(),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'PERFORMANS',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 229, 235, 243),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green[500]!),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                Text('TOPLAM SİPARİŞ',
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          color: Colors.green[500],
                                        )),
                                Text(
                                    key: const Key('total_orders'),
                                    state.userStore!.totalOrders.toString(),
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.green[500], fontWeight: FontWeight.bold)),
                              ],
                            ),
                            VerticalDivider(
                              color: Colors.green[500],
                              thickness: 2,
                            ),
                            Column(
                              children: [
                                Text('TOPLAM EKLETME',
                                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                          color: Colors.green[500],
                                        )),
                                Text(
                                    key: const Key('total_store_additions'),
                                    state.userStore!.totalStoreAdditions.toString(),
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.green[500], fontWeight: FontWeight.bold)),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 25,
                  ),

                  Container(
                    decoration: BoxDecoration(
                      color: const Color.fromARGB(255, 229, 235, 243),
                      borderRadius: BorderRadius.circular(10),
                      border: Border.all(color: Colors.green[500]!),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: IntrinsicHeight(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // Column(
                            //   children: [
                            //     Text("DÜKKAN EKLETME",
                            //         style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                            //               color: Colors.green[500],
                            //             )),
                            //     Text(
                            //         key: Key('add_store_reward'),
                            //         addStoreRewardText,
                            //         style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.red[500], fontWeight: FontWeight.bold)),
                            //   ],
                            // ),
                            // VerticalDivider(
                            //   color: Colors.green[500],
                            //   thickness: 2,
                            // ),

                            Column(
                              children: [
                                Text(
                                  'SİPARİŞ KOMİSYONU',
                                  style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                                ),
                                const SizedBox(
                                  height: 5,
                                ),
                                Text(
                                    key: const Key('fpp_reward'),
                                    firstPurchaseRewardText,
                                    style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.red[500], fontWeight: FontWeight.bold)),
                                Center(
                                  child: Text(
                                      key: const Key('reward_info'),
                                      "Arkadaşlarının ilk siparişinden \n kazanacağın ödül miktarı",
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.green, fontWeight: FontWeight.bold)),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  if (addStoreReward > 0)
                    Container(
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 229, 235, 243),
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.green[500]!),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: IntrinsicHeight(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(
                                child: Column(
                                  children: [
                                    Text(
                                      'EKLETME ÖDÜLÜ',
                                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                        key: const Key('total_orders'),
                                        addStoreRewardText,
                                        style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.red[500], fontWeight: FontWeight.bold)),
                                    Center(
                                      child: Text(
                                        key: const Key('reward_info'),
                                        "* Ödül Direk Davetiyeleri Kapsar. \n* Davet Ettiğiniz kişiler dükkanın sipariş alanında olmalıdırlar.",
                                        style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.green, fontWeight: FontWeight.bold),
                                        textAlign: TextAlign.center, // Adjust the textAlign property as needed
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),

                  // Container(
                  //   decoration: BoxDecoration(
                  //     color: Color.fromARGB(255, 229, 235, 243),
                  //     borderRadius: BorderRadius.circular(10),
                  //     border: Border.all(color: Colors.green[500]!),
                  //   ),
                  //   child: Padding(
                  //     padding: const EdgeInsets.all(15.0),
                  //     child: IntrinsicHeight(
                  //       child: Row(
                  //         mainAxisAlignment: MainAxisAlignment.center,
                  //         children: [
                  //           Column(
                  //             mainAxisAlignment: MainAxisAlignment.center,
                  //             children: [
                  //               Text("DAVETİYE LİNKİ",
                  //                   style: Theme.of(context).textTheme.titleMedium?.copyWith(
                  //                         color: Colors.green[500],
                  //                       )),
                  //               Text(
                  //                   key: Key("shareable_referral_link"),
                  //                   state.userStore!.shareableReferralLink ?? "...",
                  //                   style: Theme.of(context).textTheme.titleSmall?.copyWith(color: Colors.red[500], fontSize: 8)),
                  //             ],
                  //           ),
                  //           Row(
                  //             children: [
                  //               IconButton(
                  //                 onPressed: () {
                  //                   if (state.userStore!.shareableReferralLink != null) {
                  //                     FlutterClipboard.copy(state.userStore!.shareableReferralLink!);
                  //                     showSnackBar(context, context.l10n.reward_share_page_coppied_to_clipborad);
                  //                   }
                  //                 },
                  //                 icon: Icon(
                  //                   Icons.copy,
                  //                   color: Colors.green[500],
                  //                   size: 20,
                  //                 ),
                  //               ),
                  //               VerticalDivider(
                  //                 color: Colors.green[500],
                  //                 thickness: 2,
                  //               ),
                  //               IconButton(
                  //                 onPressed: () {
                  //                   if (state.userStore!.shareableReferralLink != null) {
                  //                     Share.share(context.l10n.reward_share_page_first_purchase_promotion(
                  //                       state.userStore!.shareableReferralLink!,
                  //                       state.store!.name,
                  //                     ));
                  //                   }
                  //                 },
                  //                 icon: Icon(
                  //                   Icons.share,
                  //                   color: Colors.green[500],
                  //                   size: 20,
                  //                 ),
                  //               ),
                  //             ],
                  //           ),
                  //         ],
                  //       ),
                  //     ),
                  //   ),
                  // ),
                  const VerticallBigSpace(),
                ],
              ),
            ),
          );
        }));
  }
}
