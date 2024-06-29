import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kachpara/l10n/extensions/extensions.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/entities/payment_card.dart';
import 'package:kachpara/ui/add_payment_methods_page/components/card_type.dart';
import 'package:kachpara/ui/add_payment_methods_page/components/card_utilis.dart';
import 'package:kachpara/utils/status.dart';

import 'components/input_formatters.dart';
import 'cubit/add_payment_methods_page_cubit.dart';

class AddPaymentMethodsPage extends StatelessWidget {
  const AddPaymentMethodsPage({super.key, this.paymentMethod});

  final PaymentCard? paymentMethod;

  static const String routeName = "add_payment_methods_page";

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<AddPaymentMethodsPageCubit>(),
      child: _AddPaymentMethodsPageLayout(
        paymentMethod: paymentMethod,
      ),
    );
  }
}

class _AddPaymentMethodsPageLayout extends StatefulWidget {
  const _AddPaymentMethodsPageLayout({this.paymentMethod});
  final PaymentCard? paymentMethod;

  @override
  State<_AddPaymentMethodsPageLayout> createState() => _AddPaymentMethodsPageLayoutState();
}

class _AddPaymentMethodsPageLayoutState extends State<_AddPaymentMethodsPageLayout> {
  final double defaultPadding = 16.0;

  TextEditingController cardNumberController = TextEditingController();
  TextEditingController dateController = TextEditingController();
  TextEditingController cvcController = TextEditingController();
  CardType cardType = CardType.Others;

  void getCardTypeFrmNum() {
    if (cardNumberController.text.length <= 6) {
      String cardNum = CardUtils.getCleanedNumber(cardNumberController.text);
      CardType type = CardUtils.getCardTypeFrmNumber(cardNum);
      if (type != cardType) {
        setState(() {
          cardType = type;
        });
      }
    }
  }

  @override
  void initState() {
    cardNumberController.addListener(() {
      getCardTypeFrmNum();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(context.l10n.add_payment_methods_page_new_card),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: defaultPadding),
          child: Column(children: [
            const Spacer(),
            Form(
                child: Column(
              children: [
                TextFormField(
                  key: const Key("cardNumber"),
                  controller: cardNumberController,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    LengthLimitingTextInputFormatter(19),
                    CardNumberInputFormatter(),
                  ],
                  decoration: InputDecoration(
                      hintText: context.l10n.add_payment_methods_page_card_number_hint_text,
                      suffixIcon: CardUtils.getCardIcon(cardType),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: SvgPicture.asset("assets/images/icons/card.svg"),
                      )),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: defaultPadding),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextFormField(
                          key: const Key("cardCvv"),
                          controller: cvcController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(4),
                          ],
                          decoration: InputDecoration(
                              hintText: context.l10n.add_payment_methods_page_cvv_hint_text,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: SvgPicture.asset("assets/images/icons/Cvv.svg"),
                              )),
                        ),
                      ),
                      SizedBox(width: defaultPadding),
                      Expanded(
                        child: TextFormField(
                          key: const Key("cardExpireDate"),
                          controller: dateController,
                          keyboardType: TextInputType.number,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(5),
                            CardMonthInputFormatter(),
                          ],
                          decoration: InputDecoration(
                              hintText: context.l10n.add_payment_methods_page_date_hint_text,
                              prefixIcon: Padding(
                                padding: const EdgeInsets.symmetric(vertical: 10),
                                child: SvgPicture.asset("assets/images/icons/calendar.svg"),
                              )),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            )),
            const Spacer(flex: 2),
            Padding(
              padding: EdgeInsets.only(bottom: defaultPadding),
              child: ElevatedButton(
                  key: const Key("addPaymentMethodButton"),
                  onPressed: (() {
                    final date = dateController.text;
                    print("date is $date");
                    final monthString = date.split("/").first;
                    final yearString = date.split("/").last;
                    context.read<AddPaymentMethodsPageCubit>().createPaymentMethod(
                        number: cardNumberController.text, expirationMonth: monthString, expirationYear: yearString, cvc: cvcController.text);
                  }),
                  child: BlocConsumer<AddPaymentMethodsPageCubit, AddPaymentMethodsPageState>(
                    builder: (context, state) {
                      if (state.status == Status.loading) {
                        return const Center(
                          child: CircularProgressIndicator.adaptive(
                            valueColor: AlwaysStoppedAnimation(Colors.white),
                          ),
                        );
                      }
                      return Text(context.l10n.add_payment_methods_page_add_card);
                    },
                    listener: (context, state) {
                      if (state.status == Status.success) {
                        Navigator.pop(context);
                      }
                      if (state.status == Status.failed) {
                        ScaffoldMessenger.of(context)
                          ..removeCurrentSnackBar()
                          ..showSnackBar(SnackBar(content: Text(context.l10n.add_payment_methods_page_error_add_card)));
                      }
                    },
                  )),
            )
          ]),
        ),
      ),
    );
  }
}
