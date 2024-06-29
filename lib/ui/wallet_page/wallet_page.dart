import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/ui/wallet_page/cubit/wallet_page_cubit.dart';
import 'package:visibility_detector/visibility_detector.dart';
import '../../utils/status.dart';
import 'widgets/indicator_loading.dart';
import 'widgets/transactions_view.dart';
import 'widgets/wallet_header_view.dart';

class WalletPage extends StatelessWidget {
  static const String routeName = 'wallet_page';
  const WalletPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<WalletPageCubit>(),
      child: const _WalletPage(),
    );
  }
}

class _WalletPage extends StatefulWidget {
  const _WalletPage();

  @override
  State<_WalletPage> createState() => _WalletPageState();
}

class _WalletPageState extends State<_WalletPage> {
  static const walletVisKey = Key('WalletVisibilityDetector');
  final walletCubit = getIt<WalletPageCubit>();

  @override
  void dispose() {
    VisibilityDetectorController.instance.forget(walletVisKey);
    walletCubit.disposeTimer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<WalletPageCubit, WalletPageState>(
          bloc: walletCubit,
          buildWhen: (previous, current) => previous.status != current.status,
          builder: (context, state) {
            if (state.status.isLoading) {
              return const IndicatorLoading();
            }

            if (!state.wallet.available) {
              return const Center(
                child: Text("You don't have a wallet yet"),
              );
            }

            return VisibilityDetector(
              key: walletVisKey,
              onVisibilityChanged: (VisibilityInfo info) {
                final visibleFraction = info.visibleFraction;
                if (visibleFraction == 1) {
                  walletCubit.triggerPeriodicFetch();
                } else if (visibleFraction == 0) {
                  walletCubit.disposeTimer();
                }
              },
              child: RefreshIndicator(
                  onRefresh: walletCubit.refreshData,
                  child: const CustomScrollView(
                    slivers: [
                      WalletHeaderView(),
                      TransactionsView(),
                      SliverPadding(
                        padding: EdgeInsets.only(bottom: 40),
                      ),
                    ],
                  )),
            );
          },
        ),
      ),
    );
  }
}
