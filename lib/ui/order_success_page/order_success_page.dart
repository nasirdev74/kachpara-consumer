import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/home_page/home_page.dart';
import 'package:kachpara/ui/order_detail_page/order_detail_page.dart';

class OrderSuccessPage extends StatefulWidget {
  static const String routeName = 'order_success_page';
  const OrderSuccessPage({super.key, required this.orderId});

  final String orderId;

  @override
  State<OrderSuccessPage> createState() => _OrderSuccessPageState();
}

class _OrderSuccessPageState extends State<OrderSuccessPage> with TickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        context.go('/$HomePage.routeName');
        return false;
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Scaffold(
            body: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Text(
                context.l10n.order_success_page_order_placed_successfully,
                style: Theme.of(context).textTheme.titleLarge,
              ),
              const SizedBox(height: 20),
              // LottieBuilder.asset(
              //   'assets/lottie/order_success.json',
              //   height: 200,
              //   width: 200,
              //   onLoaded: (composition) {
              //     _animationController
              //       ..duration = composition.duration
              //       ..forward();
              //   },
              // ),
              const SizedBox(height: 20),
              Text(
                context.l10n.order_success_page_placed_successfully_will_contact_soon,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  context.goNamed(HomePage.routeName);
                },
                child: Text(context.l10n.order_success_page_goto_home),
              ),
              const SizedBox(height: 20),
              TextButton(
                  key: const Key("orderDetail"),
                  onPressed: () {
                    context.goNamed(OrderDetailPage.routeName, pathParameters: {'orderId': widget.orderId});
                  },
                  child: Text(context.l10n.order_success_page_track_order))
            ],
          ),
        )),
      ),
    );
  }
}
