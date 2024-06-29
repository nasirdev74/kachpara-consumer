import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/app/cart_bloc/cart_bloc.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/entities/address.dart';
import 'package:kachpara/domain/entities/cart_item.dart';
import 'package:kachpara/domain/entities/promotion.dart';
import 'package:kachpara/domain/entities/store.dart';
import 'package:kachpara/domain/usecases/promotions_usecase.dart';
import 'package:kachpara/domain/usecases/store_usecase.dart';
import 'package:kachpara/domain/usecases/user_usecase.dart';
import 'package:kachpara/utils/status.dart';

import '../../../app/selected_items_bloc/selected_items_bloc.dart';
import '../../../domain/usecases/order_usecase.dart';

part 'checkout_page_cubit.freezed.dart';

part 'checkout_page_state.dart';

@injectable
class CheckoutPageCubit extends Cubit<CheckoutPageState> {
  CheckoutPageCubit(
    @factoryParam String storeId,
    this._orderUseCase,
    this._promotionUseCase,
    this._userUseCase,
    this._storeUsecase,
  ) : super(CheckoutPageState(storeId: storeId)) {
    _initialize();
  }

  final OrderUseCase _orderUseCase;
  final PromotionUseCase _promotionUseCase;
  final UserUseCase _userUseCase;
  final StoreUsecase _storeUsecase;

  late StreamSubscription<List<CartItem>?> cartItemsStream;

  _initialize() async {
    emit(state.copyWith(checkoutStatus: Status.loading, checkoutError: null));
    await _initPromotion();
    await _initFreePromotion();
    await getCartList();
    await getStore();
    await getRewardBalance();
    await checkDonationOnly();
    emit(state.copyWith(checkoutStatus: Status.success, checkoutError: null));
  }

  Future<void> checkDonationOnly() async {
    List<CartItem> cartItems = getIt<CartBloc>().state.cart!.items;
    if (cartItems.length == 1 && cartItems[0].product.id == state.freePromotion?.products.first.id) {
      emit(state.copyWith(donationOnly: true, isDelivery: false));
    }
  }

  Future<void> _initPromotion() async {
    final user = getIt<UserBloc>().state.user;
    final result = await _promotionUseCase.getActivePromotion(user!.id, state.storeId);
    result.when(success: (promotion) => emit(state.copyWith(promotion: promotion)), error: (e) {});
  }

  Future<void> _initFreePromotion() async {
    final result = await _promotionUseCase.getFreePromotion(state.storeId);
    result.when(success: (freePromotion) => emit(state.copyWith(freePromotion: freePromotion)), error: (e) {});
  }

  Future<void> getRewardBalance() async {
    final result = await _userUseCase.getRewardBalance(state.storeId);
    result.when(success: (rewardBalance) => emit(state.copyWith(balance: rewardBalance.balance)), error: (e) {});
  }

  Future<void> getCartList() async {
    List<CartItem> cartItems = getIt<CartBloc>().state.cart!.items;
    calculateTotal(cartItems);
    cartItemsStream = getIt<CartBloc>().stream.map((event) {
      if (event.cart != null && event.increaseQuantityStatus == Status.success) {
        return event.cart?.items;
      }
    }).listen((event) {
      if (event != null) {
        // emit(state.copyWith(cartItems: event));
        calculateTotal(event);
      }
    });
  }

  Future<void> checkout() async {
    final selectedPaymentMethod = getIt<SelectedItemsBloc>().state.selectedPaymentMethod;
    var selectedAddress = getIt<SelectedItemsBloc>().state.selectedAddress;
    // add validation to check if receivingfoodtime is still valid.
    // lets say now is 4pm, scheduled time is 5pm, checkout page stayed open
    // an hour.. scheduled time is not valid anymore.
    emit(state.copyWith(checkoutStatus: Status.loading, checkoutError: null));
    if (selectedAddress == null && state.isDelivery) {
      emit(state.copyWith(
        checkoutStatus: Status.failed,
        checkoutError: "Please select an address",
      ));
      return;
    } else if (selectedPaymentMethod == null) {
      emit(state.copyWith(
        checkoutStatus: Status.failed,
        checkoutError: "Please select a payment method",
      ));
      return;
    }

    if (state.donationOnly) {
      selectedAddress = const Address(id: "", name: "donationonly", address: "donationonly");
    }

    final curationId = getIt<CartBloc>().state.cart!.curationId;

    final result = await _orderUseCase.placeOrder(
        address: selectedAddress!,
        total: state.total,
        selectedPaymentcard: selectedPaymentMethod,
        promotion: state.promotion,
        useRewardPoints: state.useRewardPoints,
        store: state.store!,
        items: state.cartItems,
        foodReceivingTime: state.receivingfoodTime ?? DateTime.now(),
        isDelivery: state.isDelivery,
        notes: state.note,
        freePromotion: state.freePromotion,
        donationOnly: state.donationOnly,
        curationId: curationId,
        isGift: false);
    result.when(success: (data) {
      emit(state.copyWith(checkoutStatus: Status.success, orderId: data));
    }, error: (error) {
      emit(state.copyWith(checkoutStatus: Status.failed, checkoutError: error));
    });
  }

  void noteChanged(String note) {
    emit(state.copyWith(
      note: note,
      checkoutStatus: Status.success,
    ));
  }

  void receivingTimeChanged(DateTime dateTime) {
    emit(state.copyWith(
      receivingfoodTime: dateTime,
      checkoutStatus: Status.success,
    ));
  }

  void isdeliveryChange(bool isDelivery) {
    emit(state.copyWith(
      isDelivery: isDelivery,
      checkoutStatus: Status.success,
    ));
  }

  void calculateTotal(List<CartItem> cartItems) {
    double subTotal = 0;
    double balance = 0;
    for (var element in cartItems) {
      subTotal += element.product.price * element.quantity;
    }
    double discount = 0;
    if (state.promotion != null && (state.promotion!.minimumPurchaseAmount ?? 0) <= subTotal) {
      discount = state.promotion!.discountAmount;
    }
    if (state.useRewardPoints == true) {
      balance = state.balance;
    }

    double total = subTotal - discount - balance;

    emit(state.copyWith(discount: discount, subTotal: subTotal, total: total, cartItems: cartItems));
  }

  Future<bool> checkIsFirstOrder() async {
    final result = await _orderUseCase.checkIsFirstOrder();
    return result.when(success: (data) {
      return data;
    }, error: (error) {
      return false;
    });
  }

  void useRewardPointsChanged(bool value) {
    emit(state.copyWith(useRewardPoints: value));
    calculateTotal(state.cartItems);
  }

  @override
  Future<void> close() {
    cartItemsStream.cancel();
    return super.close();
  }

  Future<void> getStore() async {
    final result = await _storeUsecase.getStoreById(storeId: state.storeId);
    result.when(success: (store) => emit(state.copyWith(store: store)), error: (e) {});
  }
}
