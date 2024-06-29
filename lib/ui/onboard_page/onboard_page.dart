import 'package:clipboard/clipboard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/onboard_page/cubit/onboard_page_cubit.dart';
import 'package:kachpara/widgets/paddings.dart';
import 'package:kachpara/widgets/snackbar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../utils/status.dart';

class OnboardPage extends StatelessWidget {
  static const String routeName = 'onboard_page';
  const OnboardPage({super.key, required this.storeId});
  final String storeId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OnboardPageCubit>(param1: storeId),
      child: _OnboardPage(
        storeId: storeId,
      ),
    );
  }
}

class _OnboardPage extends StatelessWidget {
  const _OnboardPage({required this.storeId});

  final String storeId;
  final double maximumValue = 100.0; // Replace with your maximum value

  double calculatePercentage(double value, double max) {
    return (value / max) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.reward_share_page_share_earn),
          centerTitle: true,
        ),
        body: BlocBuilder<OnboardPageCubit, OnboardPageState>(builder: (context, state) {
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
                      Expanded(
                        child: Text(
                          state.store!.name,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const VerticallBigSpace(),
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).primaryColor,
                      borderRadius: const BorderRadius.all(Radius.circular(30)),
                    ),
                    child: SizedBox(
                      width: 300,
                      height: 250, // Adjust the width as needed
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'ERİŞİM',
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          CircularPercentIndicator(
                            radius: 60.0, // Adjust the size of the circular indicator as needed
                            lineWidth: 10.0, // Adjust the line width as needed
                            percent: calculatePercentage(
                                state.userStore!.outreach.length / 100, maximumValue), // Replace maximumValue with the maximum value for your percentage
                            center: Text(
                              '${(calculatePercentage(state.userStore!.outreach.length / 100, maximumValue) * 100).toStringAsFixed(1)}%',
                              style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                    fontSize: 20,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                  ),
                            ),
                            progressColor: Colors.red, // Adjust the progress color as needed
                            animation: true,
                            animationDuration: 1000, // Adjust the animation duration as needed
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            '${state.userStore!.outreach.length} kişi',
                            style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                  color: Colors.white,
                                ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
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
                  const SizedBox(
                    height: 30,
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
                            Flexible(
                              child: Column(
                                children: [
                                  Text("SİPARİŞ KOMİSYONU",
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                            color: Colors.green[500],
                                          )),
                                  Text(
                                      key: const Key('fpp_reward'),
                                      "5%",
                                      style: Theme.of(context).textTheme.titleLarge?.copyWith(color: Colors.red[500], fontWeight: FontWeight.bold)),
                                  Text(
                                      key: const Key('reward_info'),
                                      "- Çevrendekileri referans kodunla davet et. \n- Ekleyen tüm kişiler Erişim sayını arttırsın. \n- 100 kişiye ulaştıktan sonra başvur. \n- Erişimindeki her siparişden komisyon al. ",
                                      style: Theme.of(context).textTheme.bodySmall?.copyWith(color: Colors.green, fontWeight: FontWeight.bold)),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  InkWell(
                                    onTap: () async {
                                      if (state.userStore!.outreach.length < 100) {
                                        return;
                                      }

                                      var referralCode = state.userStore!.shareableReferralCode ?? "";
                                      var whatsapp = "+905348995147";
                                      var storename = state.store!.name;
                                      var textmessage = "$referralCode kodu ile 100 kişiye ulaştım. Dükkan:$storename";

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
                                    child: Container(
                                      width: 150,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        color: state.userStore!.outreach.length < 100 ? Colors.grey : Theme.of(context).primaryColor,
                                        borderRadius: BorderRadius.circular(25), // You can adjust this value for the desired shape.
                                      ),
                                      child: const Center(
                                        child: Text(
                                          "Başvur!",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 16,
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        }));
  }
}
