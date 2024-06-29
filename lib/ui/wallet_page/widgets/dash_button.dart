import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/wallet_page/cubit/wallet_page_cubit.dart';
import 'package:kachpara/ui/transfer_coin_page/transfer_coin_page.dart';
import 'package:kachpara/ui/wallet_page/widgets/constant.dart';
import 'package:kachpara/utils/sized_box_ext.dart';

import 'qr_wallet_view.dart';

enum DashAction {
  send,
  receive;

  String displayText(BuildContext context) {
    switch (this) {
      case DashAction.send:
        return context.l10n.send;
      case DashAction.receive:
        return context.l10n.receive;
    }
  }
}

class DashButton extends StatelessWidget {
  final Function? onTap;
  final DashAction action;

  const DashButton({
    super.key,
    this.onTap,
    required this.action,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: () {
          onTap?.call();
        },
        child: Container(
          color: Colors.transparent,
          child: Column(
            children: [
              SvgPicture.asset(
                'assets/images/icons/${action.name}.svg',
                // ignore: deprecated_member_use
                color: inputFieldTextColor,
              ),
              4.h,
              Text(
                action.displayText(context),
                style: const TextStyle(
                  fontStyle: FontStyle.normal,
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.37,
                  color: inputFieldTextColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class DashActionsView extends StatelessWidget {
  const DashActionsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 80,
      margin: const EdgeInsets.symmetric(horizontal: 16.0),
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      child: Row(
        children: [
          BlocBuilder<WalletPageCubit, WalletPageState>(builder: (context, state) {
            return DashButton(
              action: DashAction.send,
              onTap: () {
                final tokenBalance = state.tokenBalance;
                try {
                  final availableBalance = double.parse(tokenBalance.amount);
                  if (availableBalance > 0) {
                    context.goNamed(
                      TransferCoinPage.routeName,
                      queryParameters: {
                        "availableBalance": tokenBalance.amount,
                        "tokenId": tokenBalance.token.id,
                        "walletId": context.read<WalletPageCubit>().state.wallet.id,
                      },
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(context.l10n.insufficient_balance),
                      ),
                    );
                  }
                } catch (e) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text(e.toString()),
                    ),
                  );
                }
              },
            );
          }),
          DashButton(
            action: DashAction.receive,
            onTap: () {
              final walletAddress = context.read<WalletPageCubit>().state.wallet.address;
              QRWalletView.showBottomSheet(
                context: context,
                walletAddress: walletAddress,
              );
            },
          ),
        ],
      ),
    );
  }
}
