import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/entities/order.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/my_oders_page/cubit/my_orders_page_cubit.dart';
import 'package:kachpara/utils/status.dart';
import 'package:kachpara/widgets/paddings.dart';

import '../order_detail_page/order_detail_page.dart';

class MyOrdersPage extends StatelessWidget {
  const MyOrdersPage({super.key});

  static const routeName = 'my_orders_page';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<MyOrdersPageCubit>(),
      child: const MyOrdersPageLayout(),
    );
  }
}

class MyOrdersPageLayout extends StatelessWidget {
  const MyOrdersPageLayout({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(context.l10n.my_orders_page_my_orders),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VerticallBigSpace(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  context.l10n.my_orders_page_active_orders,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Flexible(child: BlocBuilder<MyOrdersPageCubit, MyOrdersPageState>(
                builder: (context, state) {
                  if (state.activeOrders.isEmpty && state.getOrdersStatus == Status.success) {
                    return Text(context.l10n.my_orders_page_no_orders);
                  }
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.activeOrders.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final order = state.activeOrders[index];
                        return OrderListItem(
                          order: order,
                          active: true,
                        );
                      });
                },
              )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  context.l10n.my_orders_page_order_history,
                  style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
              Flexible(child: BlocBuilder<MyOrdersPageCubit, MyOrdersPageState>(
                builder: (context, state) {
                  if (state.ordersHistory.isEmpty && state.getOrdersStatus == Status.success) {
                    return Text(context.l10n.my_orders_page_no_orders);
                  }
                  return ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: state.ordersHistory.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final order = state.ordersHistory[index];
                        return OrderListItem(
                          order: order,
                        );
                      });
                },
              )),
            ],
          ),
        ),
      ),
    );
  }
}

class OrderListItem extends StatelessWidget {
  const OrderListItem({super.key, this.active = false, required this.order});

  final Order order;

  final bool active;

  @override
  Widget build(BuildContext context) {
    final primaryColor = Theme.of(context).primaryColor;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: InkWell(
        onTap: () {
          context.pushNamed(OrderDetailPage.routeName, extra: order, pathParameters: {"orderId": order.id});
        },
        child: Container(
          decoration: BoxDecoration(
            color: active ? Theme.of(context).primaryColor : const Color(0xffF2F2F2),
            borderRadius: BorderRadius.circular(10),
          ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Image.network(
                  "https:${order.items[0].product.imageFileName ?? "//via.placeholder.com/150"}",
                  height: 70,
                  width: 70,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    height: 70,
                    width: 70,
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                const SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(order.storeName,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.w500,
                                color: active ? Colors.white : Colors.black,
                              )),
                      Text(
                        '${order.currencySymbol}${order.totalAmount}',
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(fontWeight: FontWeight.bold, color: active ? Colors.white : Colors.black),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
