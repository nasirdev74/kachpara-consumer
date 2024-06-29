import 'package:cloud_functions/cloud_functions.dart';
import 'package:flutter/widgets.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/data/models/payment_card_model.dart';
import 'package:kachpara/data/models/user_model.dart';
import 'package:kachpara/domain/entities/card_details.dart';
import 'package:kachpara/utils/result.dart';

import '../../../domain/entities/payment_card.dart';
import '../../models/payment_intent.dart';

@injectable
class StripeData {
  final FirebaseFunctions _functions;
  StripeData(this._functions);

  Future<Result<String>> createCustomer(UserModel user) async {
    final Map<String, dynamic> body = {
      "name": user.name,
      "phone": user.phoneNo,
    };
    debugPrint(body.toString());
    try {
      final response = await _functions.httpsCallable("onCreateNewCustomer").call(body);
      if (response.data["code"] == 200) {
        return Result.success(response.data["customerId"]);
      } else {
        return const Result.error("Error");
      }
    } catch (e) {
      debugPrint("Error in createCustomer: $e");
      return Result.error(e.toString());
    }
  }

  Future<Result<PaymentIntent>> createPaymentIntent(
    UserModel user,
    String customerId,
    PaymentCard selectedPaymentCard,
    String paymentMethod,
    int amount,
    String currency,
  ) async {
    try {
      final Map<String, dynamic> body = {
        "amount": amount.toString(),
        "currency": currency,
        "customer": customerId,
        "payment_method_types": [paymentMethod],
        "description": "Payment for ${user.name}",
        "setup_future_usage": "on_session",
        "payment_method": selectedPaymentCard.id,
      };
      debugPrint(body.toString());
      final response = await _functions.httpsCallable("onPayment").call(body);
      if (response.data["code"] == 200) {
        final d = response.data["paymentIntentId"];
        print(d);
        return Result.success(PaymentIntent(
            id: d["id"], status: d["status"], amount: (d["amount"] as num).toDouble(), client_secret: d["client_secret"], currency: d["currency"]));
      } else {
        return const Result.error("Error");
      }
    } catch (e) {
      debugPrint("Error in _createPaymentIntent: $e");
      return Result.error(e.toString());
    }
  }

  Future<Result<List<PaymentCardModel>>> getCustomerCards(String customerId) async {
    try {
      final response = await _functions.httpsCallable("onGetCustomerCards").call({"customerId": customerId});

      if (response.data["code"] == 200) {
        final List<PaymentCardModel> paymentMethods = [];
        for (final card in response.data["cards"]) {
          debugPrint("Card: ${card["card"]["brand"]}");
          paymentMethods.add(PaymentCardModel(
              id: card["id"],
              brand: card["card"]["brand"],
              last4: card["card"]["last4"],
              expMonth: card["card"]["exp_month"],
              expYear: card["card"]["exp_year"]));
        }
        return Result.success(paymentMethods);
      } else {
        return const Result.error("Error");
      }
    } catch (e) {
      debugPrint("Error in getCustomerCards: $e");
      return Result.error(e.toString());
    }
  }

  // Future<Result<void>> confirmPayment(
  //     PaymentIntent paymentIntent, String paymentCardId) async {
  //   try {
  //     final response = await functions.httpsCallable("onConfirmPayment").call({
  //       "paymentMethodId": paymentCardId,
  //       "paymentIntentId": paymentIntent.id
  //     });

  //     if (response.data["code"] == 200) {
  //       return const Result.success(null);
  //     } else {
  //       return const Result.error("confirm payment failed");
  //     }
  //   } catch (e) {
  //     debugPrint("Error in confirmPayment $e");
  //     return Result.error(e.toString());
  //   }
  // }

  Future<Result<PaymentCard>> addNewPaymentCard(CardDetails card, String customerId) async {
    try {
      final result = await _functions.httpsCallable("onNewCardAdded").call<Map<String, dynamic>>({
        'type': 'card',
        'card[number]': card.number,
        'card[exp_month]': card.expMonth,
        'card[exp_year]': card.expYear,
        'card[cvc]': card.cvc,
      });
      debugPrint(card.toString());
      final response = result.data;
      if (response["code"] == 200) {
        debugPrint(response.toString());
        return Result.success(PaymentCard(
            last4: response["last4"],
            brand: response["brand"],
            id: response["id"],
            expMonth: response["month"].toString(),
            expYear: response["year"].toString()));
      }
      return const Result.error("addind new card failed");
    } catch (e) {
      debugPrint("Error in add payment card data source $e");
      return Result.error(e.toString());
    }
  }

  Future<Result<void>> deletePaymentCard(String paymentMethodId) async {
    try {
      final result = await _functions.httpsCallable("onDeleteCard").call<Map<String, dynamic>>({
        'paymentMethodId': paymentMethodId,
      });
      final response = result.data;
      if (response["code"] == 200) {
        return const Result.success(null);
      }
      return const Result.error("deleting card failed");
    } catch (e) {
      debugPrint("Error in add payment card data source $e");
      return Result.error(e.toString());
    }
  }
}
