import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/entities/address.dart';
import 'package:kachpara/domain/entities/cart_item.dart';
import 'package:kachpara/domain/entities/order.dart';
import 'package:kachpara/domain/entities/store.dart';
import 'package:kachpara/domain/usecases/gifts_usecase.dart';
import 'package:kachpara/domain/usecases/order_usecase.dart';
import 'package:kachpara/domain/usecases/store_usecase.dart';
import 'package:kachpara/domain/usecases/user_usecase.dart';
import 'package:kachpara/utils/result.dart';
import 'package:kachpara/utils/status.dart';

part 'claim_gift_page_cubit.freezed.dart';
part 'claim_gift_page_state.dart';

@injectable
class ClaimGiftPageCubit extends Cubit<ClaimGiftPageState> {
  ClaimGiftPageCubit(this._orderUseCase, this._giftsUseCase, this._storeUsecase, this._userUseCase, @factoryParam this._orderId) : super(const ClaimGiftPageState()) {
    _initialize();
  }
  final String _orderId;
  final OrderUseCase _orderUseCase;
  final StoreUsecase _storeUsecase;
  final UserUseCase _userUseCase;
  final GiftsUseCase _giftsUseCase;

  void _initialize() async {
    emit(state.copyWith(claimPageStatus: Status.loading));

    Order? order;
    final result = await _orderUseCase.getOrder(_orderId);
    result.when(
        success: ((order) {
          order = order;
        }),
        error: (e) {});

    Store? store;

    final result1 = await _storeUsecase.getStoreById(storeId: order!.storeId);
    result1.when(success: (store) => store = store, error: (e) => Result.error("Failed to get store: $e"));

    bool isNearStoreStatus = await checkIfUserNearStore(double.parse(store!.lat!), double.parse(store.lng!));

    emit(state.copyWith(claimPageStatus: Status.success, store: store, isNearStoreStatus: isNearStoreStatus, order: order));
  }

  Future<bool> checkIfUserNearStore(double storeLatitude, double storeLongitude) async {
    final result = await _userUseCase.getCurrentLocation(LocationAccuracy.bestForNavigation);
    return result.when(
      success: (position) => _userUseCase.checkIfDistanceIsNear(position, storeLatitude, storeLongitude),
      error: (message) {
        log(message);
        return false;
      },
    );
  }

  Future<void> submitOrder(Address address, double total, String storeId, List<CartItem> cartItems, DateTime pickupTime, bool isDelivery) async {
    emit(state.copyWith(getOrderState: Status.loading));

    final result = await _orderUseCase.placeFreeOrder(
        address: address, total: total, storeId: storeId, items: cartItems, foodReceivingTime: pickupTime, isDelivery: isDelivery);

    result.when(
      success: (orderId) {
        emit(state.copyWith(getOrderState: Status.success, orderId: orderId));
        _giftsUseCase.claimGift(_orderId);
      },
      error: (message) {
        log(message);
        emit(state.copyWith(getOrderState: Status.failed));
      },
    );
  }
}
