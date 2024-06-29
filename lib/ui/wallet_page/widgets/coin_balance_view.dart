import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kachpara/ui/wallet_page/cubit/wallet_page_cubit.dart';
import 'package:kachpara/utils/sized_box_ext.dart';

import 'constant.dart';

class CoinBalanceView extends StatelessWidget {
  const CoinBalanceView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        40.h,
        Container(
          height: 58,
          width: 58,
          decoration: const BoxDecoration(shape: BoxShape.circle, image: DecorationImage(fit: BoxFit.fill, image: AssetImage("assets/images/usdc.png"))),
        ),
        // 18.h,
        // Row(
        //   mainAxisAlignment: MainAxisAlignment.center,
        //   children: [
        //     const Text(
        //       "\$23,224.00",
        //       style: TextStyle(
        //         fontStyle: FontStyle.normal,
        //         fontWeight: FontWeight.w400,
        //         fontSize: 14.0,
        //         letterSpacing: 0.44,
        //         color: labelColor,
        //       ),
        //     ),
        //     18.w,
        //     const Text(
        //       "-0.02%",
        //       style: TextStyle(
        //         fontStyle: FontStyle.normal,
        //         fontWeight: FontWeight.w400,
        //         fontSize: 14.0,
        //         letterSpacing: 0.44,
        //         color: iconUpColor,
        //       ),
        //     ),
        //   ],
        // ),
        18.h,
        BlocBuilder<WalletPageCubit, WalletPageState>(buildWhen: (previous, current) {
          return previous.tokenBalance != current.tokenBalance;
        }, builder: (context, state) {
          return Text(
            "${state.tokenBalance.amount} USDC",
            style: const TextStyle(
              fontStyle: FontStyle.normal,
              fontWeight: FontWeight.w600,
              fontSize: 26.0,
              letterSpacing: 0.37,
              color: headingColor,
            ),
          );
        }),
        18.h,
      ],
    );
  }
}
