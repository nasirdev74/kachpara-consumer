import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/entities/earnings.dart';
import 'package:kachpara/domain/entities/reward_usage.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/widgets/paddings.dart';

import '../../domain/entities/user.dart';
import 'cubit/earnings_page_cubit.dart';

class EarningsPage extends StatelessWidget {
  static const String routeName = 'earnings_page';
  const EarningsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<EarningsPageCubit>(),
      child: const _EarningsPage(),
    );
  }
}

class _EarningsPage extends StatelessWidget {
  const _EarningsPage();

  @override
  Widget build(BuildContext context) {
    final user = context.select<UserBloc, User>(
      (value) => value.state.user!,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.earnings_page_earnings),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // const VerticallBigSpace(),
            // Container(
            //   decoration: BoxDecoration(
            //     color: Theme.of(context).primaryColor,
            //     borderRadius: BorderRadius.all(Radius.circular(30)),
            //   ),
            //   child: Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 20),
            //     child: Row(
            //       children: [
            //         Expanded(
            //           child: Column(
            //             children: [
            //               Text(
            //                 context.l10n.earnings_page_current_balance,
            //                 style:
            //                     Theme.of(context).textTheme.bodyText1?.copyWith(
            //                           color: Colors.white,
            //                         ),
            //               ),
            //               Text(
            //                 user.rewardPoints.toString(),
            //                 style: Theme.of(context)
            //                     .textTheme
            //                     .headline4
            //                     ?.copyWith(
            //                         fontSize: 70,
            //                         color: Colors.white,
            //                         fontWeight: FontWeight.w500),
            //               ),
            //             ],
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            const VerticallBigSpace(),
            Text(
              context.l10n.earnings_page_earnings,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            BlocSelector<EarningsPageCubit, EarningsPageState, List<Earnings>>(
                selector: ((state) => state.earnings),
                builder: (context, state) {
                  if (state.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(context.l10n.earnings_page_no_earnings),
                      ),
                    );
                  }
                  return ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 4,
                          ),
                      shrinkWrap: true,
                      itemCount: state.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.green[100],
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(context.l10n.earnings_page_store,
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            )),
                                    const Spacer(),
                                    Text(
                                      state[index].storeName,
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(context.l10n.earnings_page_reffered_user,
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            )),
                                    const Spacer(),
                                    Text(
                                      state[index].userName,
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(context.l10n.earnings_page_earned_amount,
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            )),
                                    const Spacer(),
                                    Text(
                                      state[index].amount.toString(),
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }),
            const VerticallBigSpace(),
            Text(
              context.l10n.earnings_page_rewards_used,
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
            ),
            const SizedBox(
              height: 10,
            ),
            BlocSelector<EarningsPageCubit, EarningsPageState, List<RewardUsage>>(
                selector: ((state) => state.rewardUsages),
                builder: (context, state) {
                  if (state.isEmpty) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Text(context.l10n.earnings_page_no_rewards),
                      ),
                    );
                  }
                  return ListView.separated(
                      separatorBuilder: (context, index) => const SizedBox(
                            height: 4,
                          ),
                      shrinkWrap: true,
                      itemCount: state.length,
                      itemBuilder: (context, index) {
                        return Container(
                          decoration: BoxDecoration(
                            color: Colors.red[100],
                            borderRadius: const BorderRadius.all(Radius.circular(10)),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(16),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    Text(context.l10n.earnings_page_store,
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            )),
                                    const Spacer(),
                                    Text(
                                      state[index].storeName,
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(context.l10n.earnings_page_order_id,
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            )),
                                    const Spacer(),
                                    Text(
                                      state[index].orderId,
                                      style: Theme.of(context).textTheme.bodyLarge?.copyWith(),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    Text(context.l10n.earnings_reward_amount_used,
                                        style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                                              fontWeight: FontWeight.bold,
                                            )),
                                    const Spacer(),
                                    Text(
                                      state[index].amount.toString(),
                                      style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      });
                }),
          ],
        ),
      ),
    );
  }
}
