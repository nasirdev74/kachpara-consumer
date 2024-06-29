import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/wallet_page/widgets/constant.dart';
import 'package:kachpara/ui/wallet_page/widgets/indicator_loading.dart';
import 'package:kachpara/ui/web_page.dart/web_page.dart';
import 'package:kachpara/utils/date_time.dart';
import 'package:kachpara/utils/status.dart';
import 'package:kachpara/utils/string.dart';

import 'cubit/transaction_cubit.dart';

class TransactionPage extends StatefulWidget {
  final String id;
  static const String routeName = 'transaction_page';
  const TransactionPage({
    super.key,
    required this.id,
  });

  @override
  State<TransactionPage> createState() => _TransactionPageState();
}

class _TransactionPageState extends State<TransactionPage> {
  late final cubit = getIt<TransactionCubit>(param1: widget.id);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        title: Text(context.l10n.transaction),
      ),
      body: Center(
        child: BlocBuilder<TransactionCubit, TransactionState>(
            bloc: cubit,
            builder: (context, state) {
              if (state.status.isLoading) {
                return const IndicatorLoading();
              }
              final transaction = state.transaction!;
              return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Container(
                      height: 445,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20),
                      ),
                      padding: const EdgeInsets.symmetric(
                        horizontal: 10,
                        vertical: 0,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const SizedBox(height: 41),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'USDC',
                                style: TextStyle(
                                  color: headingColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                transaction.amount,
                                style: const TextStyle(
                                  color: headingColor,
                                  fontSize: 26,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 2),
                          const SizedBox(height: 25),
                          DottedLine(
                            direction: Axis.horizontal,
                            lineLength: double.infinity,
                            lineThickness: 1.0,
                            dashLength: 4.0,
                            dashColor: labelColor,
                            dashRadius: 0.0,
                            dashGapLength: 4.0,
                            dashGapColor: dividerColor,
                            dashGapGradient: const [
                              primaryBackgroundColor,
                              primaryBackgroundColor
                            ],
                            dashGapRadius: 0.0,
                          ),
                          const SizedBox(height: 20),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                context.l10n.date,
                                style: const TextStyle(
                                  color: labelColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                formatDateTime(transaction.createDate),
                                style: const TextStyle(
                                  color: headingColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                context.l10n.state,
                                style: const TextStyle(
                                  color: labelColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                transaction.state
                                    .toLowerCase()
                                    .capitalize
                                    .replaceAll("_", " "),
                                style: const TextStyle(
                                  color: headingColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 24),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                context.l10n.recipient_address,
                                style: const TextStyle(
                                  color: labelColor,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                              Text(
                                transaction.partnerAddress,
                                style: const TextStyle(
                                  color: headingColor,
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                              )
                            ],
                          ),
                          const SizedBox(height: 25),
                          DottedLine(
                            direction: Axis.horizontal,
                            lineLength: double.infinity,
                            lineThickness: 1.0,
                            dashLength: 4.0,
                            dashColor: labelColor,
                            dashRadius: 0.0,
                            dashGapLength: 4.0,
                            dashGapColor: dividerColor,
                            dashGapGradient: const [
                              primaryBackgroundColor,
                              primaryBackgroundColor
                            ],
                            dashGapRadius: 0.0,
                          ),
                          const SizedBox(height: 25),
                          Material(
                            child: InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                const baseUrl = kReleaseMode
                                    ? "https://polygonscan.com/"
                                    : "https://amoy.polygonscan.com";

                                context.pushNamed(WebPage.routeName,
                                    queryParameters: {
                                      'url':
                                          '$baseUrl/tx/${transaction.txHash}',
                                      'title': context.l10n.blockchain
                                    });
                              },
                              child: Ink(
                                height: 44,
                                width: MediaQuery.of(context).size.width,
                                decoration: BoxDecoration(
                                    color: dividerColor,
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                  child: Text(
                                    context.l10n.view_on_blockchain,
                                    style: const TextStyle(
                                      color: Color(0xff030319),
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20),
                        ],
                      ),
                    ),
                    Positioned.fill(
                        top: -455,
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Center(
                            child: Container(
                              height: 90,
                              width: 90,
                              decoration: BoxDecoration(
                                  color: iconDownColor,
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                      width: 5, color: primaryBackgroundColor)),
                              child: const Icon(
                                Icons.check,
                                color: primaryBackgroundColor,
                                size: 30,
                              ),
                            ),
                          ),
                        ))
                  ],
                ),
              );
            }),
      ),
    );
  }
}

String formatDateTime(DateTime? time) {
  if (time == null) return "";
  return "${time.hour}:${time.minute}:${time.second} ${time.formattedDate}";
}
