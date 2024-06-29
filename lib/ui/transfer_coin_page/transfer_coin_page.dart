import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/qr_code_scanning_page/qr_code_scanning_page.dart';
import 'package:kachpara/ui/transaction_page/transaction_page.dart';
import 'package:kachpara/ui/transfer_coin_page/cubit/transfer_coin_cubit.dart';
import 'package:kachpara/ui/transfer_coin_page/widgets/input_field.dart';
import 'package:kachpara/utils/sized_box_ext.dart';
import 'package:kachpara/utils/status.dart';

import 'widgets/bottom_rectangular_btn.dart';
import '../wallet_page/widgets/constant.dart';
import 'widgets/selected_percentage_view.dart';

class TransferCoinPage extends StatefulWidget {
  final String availableBalance;
  final String walletId;
  final String tokenId;

  static const String routeName = 'transfer_coin_page';
  const TransferCoinPage({
    super.key,
    required this.availableBalance,
    required this.walletId,
    required this.tokenId,
  });

  @override
  State<TransferCoinPage> createState() => _TransferCoinPageState();
}

class _TransferCoinPageState extends State<TransferCoinPage> {
  final amountController = TextEditingController();
  final addressController = TextEditingController();
  final cubit = getIt<TransferCoinCubit>();
  final selectedPercentageState = GlobalKey<SelectedPercentageViewState>();

  @override
  void initState() {
    super.initState();
    cubit.initAvailableBalance(
      availableBalance: widget.availableBalance,
      tokenId: widget.tokenId,
      walletId: widget.walletId,
    );
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(context.l10n.transfer_coin),
        ),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                40.h,
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      context.l10n.available_balance,
                      style: const TextStyle(fontStyle: FontStyle.normal, fontWeight: FontWeight.w400, fontSize: 16.0, letterSpacing: 0.37, color: labelColor),
                    ),
                    10.h,
                    Text(
                      "${widget.availableBalance} USDC",
                      style: const TextStyle(
                        color: headingColor,
                        fontStyle: FontStyle.normal,
                        fontWeight: FontWeight.w600,
                        fontSize: 40.0,
                        letterSpacing: 0.36,
                      ),
                    ),
                    24.h,
                    InputFieldsWithSeparateIcon(
                      textController: amountController,
                      headerText: context.l10n.amount,
                      hintText: context.l10n.amount,
                      inputType: TextInputType.number,
                      hasHeader: true,
                      onChange: (value) {
                        cubit.setAmountTransfer(value);
                        final number = double.tryParse(value);
                        final percent = (number ?? 0) / cubit.state.availableBalance;
                        selectedPercentageState.currentState?.determineSelectedPercentage(
                          (percent * 100).toInt(),
                        );
                      },
                      svg: 'walletArrow',
                      suffixIcon: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
                        child: const Text(
                          'USDC',
                          style: TextStyle(
                            fontStyle: FontStyle.normal,
                            fontWeight: FontWeight.w400,
                            fontSize: 14.0,
                            letterSpacing: 0.37,
                            color: labelColor,
                          ),
                        ),
                      ),
                    ),
                    BlocBuilder<TransferCoinCubit, TransferCoinState>(
                      bloc: cubit,
                      buildWhen: (previous, current) {
                        return previous.amountError != current.amountError;
                      },
                      builder: (context, state) {
                        return state.amountError != null
                            ? Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text(
                                  state.amountError!,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                  ),
                                ),
                              )
                            : const SizedBox();
                      },
                    ),
                    20.h,
                    SelectedPercentageView(
                      key: selectedPercentageState,
                      onChanged: (value) {
                        final availableBalance = cubit.state.availableBalance;
                        final amount = (availableBalance * value / 100).toStringAsFixed(4);
                        amountController.text = amount;
                        cubit.setAmountTransfer(amount);
                      },
                    ),
                  ],
                ),
                30.h,
                Container(
                  margin: const EdgeInsets.only(
                    bottom: 10,
                  ),
                  child: Text(
                    context.l10n.recipient_address,
                    style: const TextStyle(
                      color: headingColor,
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: TextField(
                        cursorColor: primaryColor,
                        cursorHeight: 20,
                        controller: addressController,
                        style: const TextStyle(fontSize: 14, color: inputFieldTextColor),
                        decoration: const InputDecoration(
                          hintStyle: TextStyle(fontSize: 14, color: placeholderColor),
                          filled: true,
                          fillColor: inputFieldBackgroundColor,
                          hintText: '0x000...000',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                            borderSide: BorderSide(color: cardColor, width: 0.1),
                          ),
                          disabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                            borderSide: BorderSide(color: cardColor, width: 0.1),
                          ),
                          enabledBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                            borderSide: BorderSide(color: cardColor, width: 0.1),
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: cardColor, width: 0.1),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                          ),
                        ),
                        onChanged: cubit.setDestinationAddress,
                      ),
                    ),
                    const SizedBox(
                      width: 4,
                    ),
                    GestureDetector(
                      onTap: () async {
                        final address = await context.pushNamed<String>(QrCodeScanningPage.routeName);
                        if (address != null) {
                          addressController.text = address;
                          cubit.setDestinationAddress(address);
                        }
                      },
                      child: Container(
                        width: 60,
                        height: 58,
                        decoration: const BoxDecoration(
                          color: inputFieldBackgroundColor,
                          borderRadius: BorderRadius.only(topLeft: Radius.circular(8), bottomLeft: Radius.circular(8)),
                        ),
                        child: Center(
                          child: SvgPicture.asset(
                            'assets/images/icons/qr-scanner-m.svg',
                            color: placeholderColor,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                BlocBuilder<TransferCoinCubit, TransferCoinState>(
                  bloc: cubit,
                  buildWhen: (previous, current) {
                    return previous.addressError != current.addressError;
                  },
                  builder: (context, state) {
                    return state.addressError != null
                        ? Padding(
                            padding: const EdgeInsets.only(top: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  state.addressError!,
                                  style: const TextStyle(
                                    color: Colors.red,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          )
                        : const SizedBox();
                  },
                ),
                24.h,
              ],
            ),
          ),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: BlocConsumer<TransferCoinCubit, TransferCoinState>(
                bloc: cubit,
                buildWhen: (previous, current) {
                  return previous.status != current.status;
                },
                builder: (context, state) {
                  return BottomRectangularBtn(
                    isLoading: state.status.isLoading,
                    onTapFunc: () {
                      cubit.send(context);
                    },
                    btnTitle: context.l10n.send,
                    buttonTextColor: Colors.white,
                  );
                },
                listenWhen: (previous, current) {
                  return previous.error != current.error || previous.status != current.status;
                },
                listener: (BuildContext context, TransferCoinState state) {
                  if (state.status.isSuccess) {
                    context.pushReplacementNamed(TransactionPage.routeName, queryParameters: {
                      "id": state.createdTransactionId,
                    });
                  } else if (state.status.isFailed) {
                    if (state.error?.isNotEmpty ?? false) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text(state.error!),
                        ),
                      );
                    }
                  }
                },
              ),
            ),
            45.h,
          ],
        ),
      ),
    );
  }
}
