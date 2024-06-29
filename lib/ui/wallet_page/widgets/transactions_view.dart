import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kachpara/ui/wallet_page/cubit/wallet_page_cubit.dart';

import 'transaction_item_view.dart';

class TransactionsView extends StatelessWidget {
  const TransactionsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<WalletPageCubit, WalletPageState>(
      buildWhen: (previous, current) {
        if (previous.transactions.length != current.transactions.length) {
          return true;
        }

        for (int index = 0; index < current.transactions.length; index++) {
          if (previous.transactions[index].id !=
              current.transactions[index].id) {
            return true;
          }
        }

        return false;
      },
      builder: (context, state) {
        return SliverList.builder(
          itemCount: state.transactions.length,
          itemBuilder: (context, index) {
            final transaction = state.transactions[index];
            return TransactionItemView(
              transaction: transaction,
            );
          },
        );
      },
    );
  }
}
