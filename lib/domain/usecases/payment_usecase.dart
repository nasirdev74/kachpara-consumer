import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/app/selected_items_bloc/selected_items_bloc.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/data/models/payment_intent.dart';
import 'package:kachpara/data/models/user_model.dart';
import 'package:kachpara/data/sources/firestore/user_data.dart';
import 'package:kachpara/data/sources/cloud_functions/stripe_functions.dart';
import 'package:kachpara/domain/entities/card_details.dart';
import 'package:kachpara/domain/entities/payment_card.dart';
import 'package:kachpara/utils/result.dart';

@injectable
class PaymentUsecases {
  final UserData _userData;
  final StripeData _stripeData;

  PaymentUsecases(this._userData, this._stripeData);

  Future<PaymentIntent> payWithCard({required String currency, required PaymentCard selectedPaymentCard, required double total}) async {
    final user = getIt<UserBloc>().state.user!;
    if (user.id == "OgdWe87U15RjdOU10cIWBvK7DNf2") {
      const paymentIntentFake = PaymentIntent(
        id: 'pi_123456789',
        client_secret: 'fake',
        status: 'succeeded',
        amount: 100.0,
        currency: 'usd',
      );
      return paymentIntentFake;
    }
    final customerId = await createOrGetCustomerId();
    final paymentIntentResult =
        await _stripeData.createPaymentIntent(UserModel.fromDomain(user), customerId, selectedPaymentCard, "card", (total * 100).toInt(), currency);

    return paymentIntentResult.when(success: (paymentIntent) async {
      return paymentIntent;
    }, error: (error) {
      throw error;
    });
  }

  Future<String> createOrGetCustomerId() async {
    final user = getIt<UserBloc>().state.user;
    if (user != null) {
      final customerIdReult = await _userData.getCustomerIdFromFirestore(user.id);
      String? customerId = customerIdReult.maybeWhen(
          success: (data) {
            if (data != null) {
              return data;
            }
            return null;
          },
          orElse: (() => null));

      if (customerId == null) {
        final result = await _stripeData.createCustomer(UserModel.fromDomain(user));
        await result.when(
          success: (data) async {
            await _userData.saveCustomerIdToFirestore(data, user.id);
            customerId = data;
          },
          error: (message) => (throw Exception(message)),
        );
      }
      return customerId!;
    } else {
      throw Exception('User is null');
    }
  }

  Future<Result<List<PaymentCard>>> getSavedCustomerCards() async {
    final user = getIt<UserBloc>().state.user;
    if (user != null) {
      final customerIdReult = await _userData.getCustomerIdFromFirestore(user.id);
      List<PaymentCard>? customerCards = await customerIdReult.maybeWhen(
          success: (data) async {
            if (data != null) {
              final cardsResult = await _stripeData.getCustomerCards(data);
              return cardsResult.maybeWhen(
                  success: (data) {
                    return data.map((e) => e.toDomain()).toList();
                  },
                  orElse: () => null);
            }
            return null;
          },
          orElse: (() => null));
      if (customerCards != null) {
        return Result.success(customerCards);
      } else {
        return const Result.error('No cards saved');
      }
    } else {
      return const Result.error("User not Signed In");
    }
  }

  Future<Result<void>> addNewPaymentCard(CardDetails card) async {
    try {
      final user = getIt<UserBloc>().state.user!;
      final customerId = await createOrGetCustomerId();
      final result = await _stripeData.addNewPaymentCard(card, customerId);

      if (user.selectedPaymentMethodId == null) {
        result.when(
          success: (paymentCard) {
            _userData.updateSelectedPaymentMethod(user.id, paymentCard.id);
            getIt<SelectedItemsBloc>().add(SelectedItemsEvent.setPaymentMethod(paymentMethod: paymentCard));
          },
          error: (message) {
            log(message);
          },
        );
      }
      return const Result.success(null);
    } catch (e) {
      debugPrint("error in creating new payment method : $e");
      return Result.error(e.toString());
    }
  }

  Future<Result<void>> deletePaymentMethod(String paymentMethodId) async {
    return _stripeData.deletePaymentCard(paymentMethodId);
  }

  Future<Result<PaymentCard?>> getSelectedPaymentMethod() async {
    final user = getIt<UserBloc>().state.user;
    if (user?.selectedPaymentMethodId == null) return const Result.success(null);

    // getSavedCustomerCards
    final result = await getSavedCustomerCards();
    return result.when(success: (paymentMethods) {
      for (var paymentCard in paymentMethods) {
        if (paymentCard.id == user?.selectedPaymentMethodId) {
          return Result.success(paymentCard);
        }
      }
      return const Result.success(null);
    }, error: (error) {
      return Result.error(error);
    });
  }
}
