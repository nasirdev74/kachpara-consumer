import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kachpara/domain/entities/gift.dart';
import 'package:kachpara/ui/claim_gift_page/claim_gift_page.dart';
import 'package:kachpara/utils/status.dart';
import 'package:go_router/go_router.dart';

import '../../core/injector.dart';
import 'cubit/gifts_page_cubit.dart';

class GiftsPage extends StatelessWidget {
  static const String routeName = 'gifts_page';
  const GiftsPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<GiftsPageCubit>(),
      child: const _GiftsPageLayout(),
    );
  }
}

class _GiftsPageLayout extends StatelessWidget {
  const _GiftsPageLayout();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hediyeler'),
      ),
      body: BlocBuilder<GiftsPageCubit, GiftsPageState>(
        builder: (context, state) {
          if (state.giftsStatus == Status.loading) {
            return const Center(child: CircularProgressIndicator());
          }
          // Display the loaded gifts list
          final List<Gift> gifts = state.gifts;
          return ListView.builder(
            itemCount: gifts.length,
            itemBuilder: (context, index) {
              final gift = gifts[index];
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Card(
                  color: Colors.lightBlue,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: ListTile(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    title: Text(gift.senderName!),
                    subtitle: Text(gift.giftDescription!),
                    // Add more UI components as needed
                    trailing: const Icon(Icons.arrow_forward),
                    onTap: () {
                      context.pushNamed(ClaimGiftPage.routeName, queryParameters: {'orderId': gift.orderId});
                    },
                  ),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
