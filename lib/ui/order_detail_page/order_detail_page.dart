import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/utils/date_tostring.dart';
import 'package:kachpara/widgets/paddings.dart';

import '../../core/injector.dart';
import '../../domain/entities/order.dart';
import 'cubit/order_detail_page_cubit.dart';

class OrderDetailPage extends StatelessWidget {
  static const String routeName = 'order_detail_page';
  const OrderDetailPage({super.key, this.order, required this.orderId});

  final Order? order;
  final String orderId;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<OrderDetailPageCubit>(param1: order, param2: orderId),
      child: const _OrderdetailPageLayout(),
    );
  }
}

class _OrderdetailPageLayout extends StatelessWidget {
  const _OrderdetailPageLayout();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.order_detail_page_order_detail),
        centerTitle: true,
      ),
      body: BlocBuilder<OrderDetailPageCubit, OrderDetailPageState>(
        builder: (context, state) {
          if (state.order == null) {
            return const Center(child: CircularProgressIndicator());
          }
          String addressTitle = context.l10n.order_detail_page_address;
          String address = state.order!.address.address;
          if (state.order!.isDelivery) {
            addressTitle = context.l10n.order_detail_page_delivery_address;
          } else if (state.order!.isPickup) {
            addressTitle = context.l10n.order_detail_page_pickup_address;
            address = state.order!.pickupAddress!;
          }
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Flexible(
                  child: Card(
                    color: Colors.grey[200],
                    child: ListView.builder(
                        itemCount: state.order!.items.length,
                        shrinkWrap: true,
                        itemBuilder: ((context, index) {
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.network(
                                    "https:${state.order!.items[index].product.imageFileName ?? "//via.placeholder.com/150"}",
                                    fit: BoxFit.cover,
                                    height: 50,
                                    width: 50,
                                  ),
                                  const SizedBox(
                                    width: 20,
                                  ),
                                  Expanded(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          state.order!.items[index].product.name,
                                          style: Theme.of(context).textTheme.titleMedium!.copyWith(fontWeight: FontWeight.w500),
                                        ),
                                        Text(
                                          context.l10n.order_detail_page_quantity(state.order!.items[index].quantity),
                                          style: Theme.of(context).textTheme.titleMedium!,
                                        ),
                                      ],
                                    ),
                                  ),
                                  Text(
                                    '${state.order!.currencySymbol}${state.order!.items[index].quantity * state.order!.items[index].product.price}'.toString(),
                                    style: Theme.of(context).textTheme.titleSmall!.copyWith(fontWeight: FontWeight.bold),
                                  ),
                                ],
                              ),
                            ),
                          );
                        })),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                if (state.order!.notes != null)
                  Card(
                    color: Colors.grey[200],
                    child: Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: Row(
                        children: [
                          Expanded(
                            child: RichText(
                                text: TextSpan(children: [
                              const WidgetSpan(child: Icon(Icons.info), alignment: PlaceholderAlignment.middle),
                              TextSpan(
                                  text: context.l10n.order_detail_page_note,
                                  style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)),
                              TextSpan(text: state.order!.notes, style: Theme.of(context).textTheme.bodyLarge),
                            ])),
                          ),
                        ],
                      ),
                    ),
                  ),
                const SizedBox(
                  height: 10,
                ),
                Card(
                  color: Colors.grey[200],
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      children: [
                        Rowvalue(key: const Key("order_details_address"), title: addressTitle, value: address),
                        Rowvalue(title: context.l10n.order_detail_page_date, value: state.order!.orderPlacementTime.toDate()),
                        Rowvalue(title: context.l10n.order_detail_page_time, value: state.order!.orderPlacementTime.toTime()),
                        const VerticallSmallSpace(),
                        Rowvalue(
                            key: const Key("order_details_total"),
                            bold: true,
                            title: context.l10n.order_detail_page_total,
                            value: '${state.order!.currencySymbol}${state.order!.totalAmount}'),
                      ],
                    ),
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}

class Rowvalue extends StatelessWidget {
  const Rowvalue({super.key, required this.title, required this.value, this.bold});

  final String title;
  final String value;
  final bool? bold;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      child: Row(
        children: [
          Text(
            title,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: (bold == true) ? FontWeight.bold : FontWeight.normal),
          ),
          const SizedBox(
            width: 10,
          ),
          Expanded(
              child: Text(
            value,
            textAlign: TextAlign.end,
            style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontWeight: (bold == true) ? FontWeight.bold : FontWeight.normal),
          )),
        ],
      ),
    );
  }
}
