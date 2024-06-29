import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/entities/payment_card.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/add_payment_methods_page/add_payment_methods_page.dart';

import '../../app/selected_items_bloc/selected_items_bloc.dart';
import '../../core/router.dart';
import '../../utils/status.dart';
import 'cubit/payment_methods_page_cubit.dart';

class PaymentMethodsPage extends StatelessWidget {
  const PaymentMethodsPage({super.key});

  static const routeName = 'payment_methods_page';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(create: (context) => getIt<PaymentMethodsPageCubit>(), child: const PaymentMethodsPageLayout());
  }
}

class PaymentMethodsPageLayout extends StatefulWidget {
  const PaymentMethodsPageLayout({super.key});

  @override
  State<PaymentMethodsPageLayout> createState() => _PaymentMethodsPageLayoutState();
}

class _PaymentMethodsPageLayoutState extends State<PaymentMethodsPageLayout> with RouteAware {
  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
      AppRouter.routeObserver.subscribe(this, ModalRoute.of(context)!);
    });
    context.read<PaymentMethodsPageCubit>().getPaymentMethods();
    super.initState();
  }

  @override
  void didPopNext() {
    context.read<PaymentMethodsPageCubit>().getPaymentMethods();
    super.didPopNext();
  }

  @override
  Widget build(BuildContext context) {
    final selectedPayment = context.select<SelectedItemsBloc, PaymentCard?>(
      (value) => value.state.selectedPaymentMethod,
    );
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.payment_methods_page_choose_payment_method),
        leading: const BackButton(
          color: Colors.black,
        ),
        actions: [
          IconButton(
            key: const Key("addPaymentMethodPage"),
            onPressed: () {
              context.pushNamed(AddPaymentMethodsPage.routeName);
            },
            icon: Icon(
              Icons.add_circle,
              color: Theme.of(context).primaryColor,
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Flexible(
              child: BlocBuilder<PaymentMethodsPageCubit, PaymentMethodsPageState>(
                builder: (context, state) {
                  if (state.getPaymentMethodsStatus == Status.loading) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  if (state.getPaymentMethodsStatus == Status.failed) {
                    return Center(
                        child: Text(
                      context.l10n.profile_page_error(state.getPaymentMethodsErrorMessage!),
                    ));
                  }
                  if (state.paymentMethods.isEmpty) {
                    return Center(
                      child: Text(context.l10n.payment_methods_page_no_payment_methods),
                    );
                  }
                  return ListView.builder(
                      itemCount: state.paymentMethods.length,
                      itemBuilder: ((context, index) {
                        return Slidable(
                          endActionPane: ActionPane(
                            extentRatio: .4,
                            motion: const StretchMotion(),
                            children: [
                              SlidableAction(
                                onPressed: (ctx) async {
                                  if (state.paymentMethods[index] != selectedPayment) {
                                    showConfirmationDialog(context, state.paymentMethods[index]);
                                  } else {
                                    showConfirmationDefaultDeleteDialog(context, state.paymentMethods[index]);
                                  }
                                },
                                backgroundColor: const Color(0xFFFE4A49),
                                foregroundColor: Colors.white,
                                icon: Icons.delete,
                                label: 'Delete',
                              ),
                            ],
                          ),
                          child: ListTile(
                              leading: selectedPayment == state.paymentMethods[index]
                                  ? Icon(
                                      Icons.check_circle,
                                      color: Colors.green[700],
                                    )
                                  : const Icon(
                                      Icons.check_circle_outline,
                                      color: Colors.grey,
                                    ),
                              title: Text(
                                state.paymentMethods[index].brand,
                                style: const TextStyle(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              subtitle: Text(
                                  '${state.paymentMethods[index].last4},${state.paymentMethods[index].expMonth}/${state.paymentMethods[index].expYear}'),
                              shape: const Border(
                                bottom: BorderSide(),
                              ),
                              trailing: Icon(
                                Icons.edit,
                                color: Colors.green[700],
                              ),
                              onTap: () {
                                getIt<SelectedItemsBloc>().add(SelectedItemsEvent.setPaymentMethod(paymentMethod: state.paymentMethods[index]));
                              }),
                        );
                      }));
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  showConfirmationDialog(BuildContext context, PaymentCard payment) {
    showDialog(
        context: context,
        builder: ((dContext) => AlertDialog(
              content: Text("Are you sure to delete payment ${payment.last4}?"),
              actions: [
                ElevatedButton(
                    onPressed: () async {
                      await context.read<PaymentMethodsPageCubit>().deletePayment(payment.id);
                      Navigator.pop(dContext);
                    },
                    style: ElevatedButton.styleFrom(minimumSize: const Size(100, 40)),
                    child: const Text("ok")),
                ElevatedButton(
                    onPressed: () {
                      Navigator.pop(dContext);
                    },
                    style: ElevatedButton.styleFrom(minimumSize: const Size(100, 40)),
                    child: const Text("cancel"))
              ],
            )));
  }

  showConfirmationDefaultDeleteDialog(BuildContext context, PaymentCard paymentCard) {
    showDialog(
        context: context,
        builder: ((dContext) => AlertDialog(
              content: const Text("Please change the default payment before to delete"),
              actions: [
                ElevatedButton(
                    onPressed: () async {
                      Navigator.pop(dContext);
                    },
                    style: ElevatedButton.styleFrom(minimumSize: const Size(100, 40)),
                    child: const Text("ok")),
              ],
            )));
  }
}
