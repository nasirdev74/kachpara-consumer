import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:kachpara/l10n/extensions/localizations_extension.dart';
import 'package:kachpara/ui/home_page/home_page.dart';
import 'package:share_plus/share_plus.dart';

class ClaimFreePromotionSuccessPage extends StatefulWidget {
  static const String routeName = 'claim_free_promotion_success_page';
  const ClaimFreePromotionSuccessPage({super.key, required this.promotionTitle, required this.storeUrl});

  final String promotionTitle;
  final String storeUrl;

  @override
  State<ClaimFreePromotionSuccessPage> createState() => _ClaimFreePromotionSuccessPageState();
}

class _ClaimFreePromotionSuccessPageState extends State<ClaimFreePromotionSuccessPage> with TickerProviderStateMixin {
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
                context.l10n.claim_free_promotion_success_page_title(widget.promotionTitle),
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
                context.l10n.claim_free_promotion_success_page_subtext(widget.promotionTitle),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 40),
              ElevatedButton(
                onPressed: () {
                  Share.share(context.l10n.claim_free_promotion_success_page_share(widget.promotionTitle, widget.storeUrl));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Icon(Icons.share),
                    const SizedBox(width: 5), // add some spacing between icon and text
                    Text(context.l10n.common_button_share),
                  ],
                ),
              ),

              TextButton(
                  key: const Key("home_page"),
                  onPressed: () {
                    context.goNamed(HomePage.routeName);
                  },
                  child: Text(context.l10n.order_success_page_goto_home))
            ],
          ),
        )),
      ),
    );
  }
}
