import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:geolocator/geolocator.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/app/curation_bloc/curation_bloc.dart';
import 'package:kachpara/app/store_bloc/store_bloc.dart';
import 'package:kachpara/app/user_bloc/user_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/entities/address.dart';
import 'package:kachpara/domain/entities/cart_item.dart';
import 'package:kachpara/domain/entities/promotion.dart';
import 'package:kachpara/domain/entities/store.dart';
import 'package:kachpara/domain/usecases/order_usecase.dart';
import 'package:kachpara/domain/usecases/promotions_usecase.dart';
import 'package:kachpara/domain/usecases/user_usecase.dart';
import 'package:kachpara/utils/result.dart';
import 'package:kachpara/utils/status.dart';

part 'claim_free_promotion_page_state.dart';

part 'claim_free_promotion_page_cubit.freezed.dart';

@injectable
class ClaimFreePromotionPageCubit extends Cubit<ClaimFreePromotionPageState> {
  ClaimFreePromotionPageCubit(this._userUseCase, this._orderUseCase, this._promotionUseCase, @factoryParam this._storeId, @factoryParam this._promotionId)
      : super(const ClaimFreePromotionPageState()) {
    _initialize();
  }
  final String _storeId;
  final String _promotionId;

  void _initialize() async {
    emit(state.copyWith(claimPageStatus: Status.loading));

    Promotion? _promotion;
    final result1 = await _promotionUseCase.getPromotion(_storeId, _promotionId);
    result1.when(success: (promotion) => _promotion = promotion, error: (e) => Result.error("Failed to get promotion: $e"));

    final isStudentVerified = getIt<UserBloc>().state.user!.isStudentVerified ?? false;
    final userPhoneNo = getIt<UserBloc>().state.user!.phoneNo;
    final store = getIt<StoreBloc>().state.stores.firstWhere((element) => element.id.toString() == _promotion!.storeId);
    final isClaimStartedStatus = await isClaimStarted(_promotion!.claimBeginTime!, _promotion!.claimEndTime!);

    bool isNearStoreStatus = true;
    bool isClaimAnytime = _promotion?.isClaimAnytime ?? true;

    if (isClaimStartedStatus || isClaimAnytime) {
      isNearStoreStatus = await checkIfUserNearStore(double.parse(store.lat!), double.parse(store.lng!));
    }

    bool isInBeneficiaryList = (_promotion!.beneficiaryList != null && _promotion!.beneficiaryList!.contains(userPhoneNo));

    DateTime? nextAvailableDate;
    if (_promotion!.waitPeriodInMinutes != null) {
      nextAvailableDate = await _promotionUseCase.getWaitPeriodOverDateForPromotion(store.id,_promotion!.id, _promotion!.waitPeriodInMinutes!);
    }

    emit(state.copyWith(
        claimPageStatus: Status.success,
        store: store,
        nextAvailableDate: nextAvailableDate,
        isNearStoreStatus: isNearStoreStatus,
        isClaimStartedStatus: isClaimStartedStatus,
        isClaimAnytime: isClaimAnytime,
        isVerified: (isStudentVerified || isInBeneficiaryList),
        isStudentVerified: isStudentVerified,
        promotion: _promotion));
  }

  final UserUseCase _userUseCase;
  final OrderUseCase _orderUseCase;
  final PromotionUseCase _promotionUseCase;

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

  Future<bool> isClaimStarted(int claimBeginTime, int claimEndTime) async {
    return ((claimEndTime) > DateTime.now().hour && (claimBeginTime) <= DateTime.now().hour);
  }

  Future<void> submitOrder(
      Address address, double total, String storeId, List<CartItem> cartItems, Promotion promotion, DateTime pickupTime, bool isDelivery) async {
    emit(state.copyWith(getOrderState: Status.loading));
    final result = await _orderUseCase.placeFreeOrder(
        address: address, total: total, storeId: storeId, items: cartItems, promotion: promotion, foodReceivingTime: pickupTime, isDelivery: isDelivery);
    result.when(
      success: (orderId) {
        emit(state.copyWith(getOrderState: Status.success, orderId: orderId));
      },
      error: (message) {
        log(message);
        emit(state.copyWith(getOrderState: Status.failed));
      },
    );
  }
}
