import 'package:flutter/widgets.dart';

import 'coin_balance_view.dart';
import 'dash_button.dart';

class WalletHeaderView extends StatelessWidget {
  const WalletHeaderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SliverToBoxAdapter(
      child: SafeArea(
        child: Column(
          children: [
            CoinBalanceView(),
            DashActionsView(),
          ],
        ),
      ),
    );
  }
}
