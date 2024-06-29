import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/data/models/transaction_model.dart';
import 'package:kachpara/ui/transaction_page/transaction_page.dart';
import 'package:kachpara/ui/wallet_page/widgets/constant.dart';
import 'package:kachpara/utils/date_time.dart';
import 'package:kachpara/utils/sized_box_ext.dart';

class TransactionItemView extends StatelessWidget {
  final TransactionModel transaction;
  const TransactionItemView({
    super.key,
    required this.transaction,
  });

  TransactionType get type => transaction.transactionType;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 5.0,
        horizontal: 20,
      ),
      child: InkWell(
        borderRadius: BorderRadius.circular(16),
        onTap: () {
          context.goNamed(
            TransactionPage.routeName,
            queryParameters: {
              'id': transaction.id,
            },
          );
        },
        child: Ink(
          height: 67,
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            color: inputFieldBackgroundColor,
            borderRadius: BorderRadius.circular(16),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Container(
                      height: 24,
                      width: 24,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: type.bgColor.withOpacity(0.15),
                      ),
                      child: Icon(
                        type.icon,
                        size: 15,
                        color: type.iconColor,
                      )),
                  16.w,
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        transaction.transactionType.displayText(context),
                        style: const TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 14.0,
                          letterSpacing: 0.37,
                          color: headingColor,
                        ),
                      ),
                      5.h,
                      Text(
                        transaction.partnerAddress,
                        style: const TextStyle(
                          fontStyle: FontStyle.normal,
                          fontWeight: FontWeight.w400,
                          fontSize: 12.0,
                          letterSpacing: 0.37,
                          color: headingColor,
                        ),
                      ),
                    ],
                  )
                ],
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "${transaction.amount} USDC",
                    style: TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      letterSpacing: 0.44,
                      color: type.iconColor,
                    ),
                  ),
                  5.h,
                  Text(
                    transaction.createDate?.formattedDate ?? "",
                    style: const TextStyle(
                      fontStyle: FontStyle.normal,
                      fontWeight: FontWeight.w400,
                      fontSize: 12.0,
                      letterSpacing: 0.44,
                      color: headingColor,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
