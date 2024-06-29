import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/core/theme.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/loyalty_page/cubit/loyalty_page_cubit.dart';
import 'package:kachpara/utils/date_tostring.dart';
import 'package:kachpara/widgets/button.dart';
import 'package:kachpara/widgets/paddings.dart';
import 'package:kachpara/widgets/snackbar.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

import '../../utils/status.dart';

class LoyaltyPage extends StatelessWidget {
  static const String routeName = 'loyalty_page';
  const LoyaltyPage({super.key, required this.storeId});
  final String storeId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<LoyaltyPageCubit>(param1: storeId),
      child: _LoyaltyPage(
        storeId: storeId,
      ),
    );
  }
}

class _LoyaltyPage extends StatelessWidget {
  const _LoyaltyPage({required this.storeId});

  final String storeId;

  double calculatePercentage(double value, int max) {
    return (value / max) * 100;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.reward_share_page_share_earn),
          centerTitle: true,
        ),
        body: BlocConsumer<LoyaltyPageCubit, LoyaltyPageState>(listener: (context, state) {
          if (state.getLoyaltyStatus == Status.success && state.showSnackbar) {
            // Close the dialog
            if (Platform.isAndroid) Navigator.of(context, rootNavigator: true).pop('dialog');

            showSnackBar(
              context,
              context.l10n.loyalty_page_successful_nfc_read,
            );
          }
        }, builder: (context, state) {
          if (state.getLoyaltyStatus == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          }

          final currencySymbol = state.store!.currencySymbol;
          final int maximumValue = state.store!.visitsRewardTreshold;

          final totalRewardText = currencySymbol + state.userStore!.totalRewards.toString();

          final currentVisits = state.userStore!.currentVisits;

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
            child: SingleChildScrollView(
              child: Center(
                child: Column(
                  children: [
                    Text(
                      state.store!.name,
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
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
                              'VISITS',
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
                                  (currentVisits ?? 0) / 100, maximumValue), // Replace maximumValue with the maximum value for your percentage
                              center: Text(
                                '${(calculatePercentage((currentVisits ?? 0) / 100, maximumValue) * 100).toStringAsFixed(1)}%',
                                style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                                      fontSize: 20,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                              progressColor: Colors.red, // Adjust the progress color as needed
                              animation: true,
                              animationDuration: 1000, // Adjust the animation duration as needed
                              animateFromLastPercent: true,
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              '$currentVisits / $maximumValue',
                              style: Theme.of(context).textTheme.titleSmall?.copyWith(
                                    color: Colors.white,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: 300,
                      height: 50,
                      margin: const EdgeInsets.symmetric(vertical: 20),
                      child: ButtonWidget(
                        text: context.l10n.loyalty_page_tag,
                        onPressed: () async {
                          // Start NFC session
                          if (Platform.isAndroid) {
                            showDialog(
                              context: context,
                              builder: ((context) => AlertDialog(
                                    alignment: Alignment.center,
                                    title: Text(
                                      context.l10n.loyalty_page_alert_message,
                                      style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                                      textAlign: TextAlign.center,
                                    ),
                                    content: Padding(
                                      padding: const EdgeInsets.symmetric(vertical: 20),
                                      child: Icon(
                                        Icons.nfc,
                                        size: 64,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                  )),
                            );
                          }

                          context.read<LoyaltyPageCubit>().startNFCSession(context.l10n.loyalty_page_alert_message);
                        },
                        icon: const Icon(
                          Icons.nfc,
                        ),
                      ),
                    ),
                    // Visits reward widgets
                    if (state.store != null)
                      SizedBox(
                        width: 300,
                        child: Column(
                          children: [
                            if (state.store!.visitsRewardDescription != null)
                              Padding(
                                padding: const EdgeInsets.symmetric(vertical: 8),
                                child: Text(
                                  state.store!.visitsRewardDescription!,
                                  style: Theme.of(context).textTheme.titleSmall,
                                  textAlign: TextAlign.center,
                                ),
                              ),
                            // Claim a reward
                            if (currentVisits != null && currentVisits >= maximumValue && state.store!.visitsRewardEarnedDescription != null)
                              Container(
                                padding: const EdgeInsets.all(16),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  border: Border.all(color: Theme.of(context).primaryColor),
                                ),
                                child: Column(
                                  children: [
                                    Text(
                                      state.store!.visitsRewardEarnedDescription!,
                                      style: Theme.of(context).textTheme.titleSmall,
                                      textAlign: TextAlign.center,
                                    ),
                                    const SizedBox(height: 20),
                                    ButtonWidget(
                                      text: context.l10n.loyalty_page_claim_reward,
                                      onPressed: () {
                                        // TODO: Claim reward
                                      },
                                    ),
                                  ],
                                ),
                              ),
                          ],
                        ),
                      ),
                    const VerticallBigSpace(),
                    if (state.userStore != null && state.userStore!.visits.isNotEmpty) ...[
                      Text(
                        context.l10n.loyalty_page_visit_history,
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 10),
                      ...state.userStore!.visits.map(
                        (visitTime) => Container(
                          padding: const EdgeInsets.all(8),
                          margin: const EdgeInsets.only(bottom: 4),
                          child: Text(DateTime.fromMillisecondsSinceEpoch(visitTime).customFormat()),
                        ),
                      )
                    ],
                  ],
                ),
              ),
            ),
          );
        }));
  }
}
