import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/app/selected_items_bloc/selected_items_bloc.dart';
import 'package:kachpara/core/injector.dart';
import 'package:kachpara/domain/entities/address.dart';
import 'package:kachpara/domain/entities/cart_item.dart';
import 'package:kachpara/domain/entities/product.dart';
import 'package:kachpara/domain/entities/promotion.dart';
import 'package:kachpara/domain/entities/store.dart';
import 'package:kachpara/domain/entities/user.dart';
import 'package:kachpara/domain/usecases/order_usecase.dart';
import 'package:kachpara/domain/usecases/promotions_usecase.dart';
import 'package:kachpara/domain/usecases/store_usecase.dart';
import 'package:kachpara/domain/usecases/user_usecase.dart';
import 'package:kachpara/utils/result.dart';
import 'package:kachpara/utils/status.dart';
import 'package:collection/collection.dart';

part 'buy_gift_page_state.dart';

part 'buy_gift_page_cubit.freezed.dart';

@injectable
class BuyGiftPageCubit extends Cubit<BuyGiftPageState> {
  BuyGiftPageCubit(
    this._promotionUseCase,
    this._userUseCase,
    this._storeUsecase,
    this._orderUseCase,
  ) : super(const BuyGiftPageState());

  final PromotionUseCase _promotionUseCase;
  final UserUseCase _userUseCase;
  final StoreUsecase _storeUsecase;
  final OrderUseCase _orderUseCase;

  Future<void> initialize({required String storeId, required String promotionId, required String userId}) async {
    emit(state.copyWith(buyGiftPageStatus: Status.loading));

    // find user
    // find store
    // find promotion product
    Store? store;
    final result1 = await _storeUsecase.getStoreById(storeId: storeId);
    result1.when(success: (storeData) => store = storeData, error: (e) => Result.error("Failed to get store: $e"));

    Promotion? freePromotion;

    final result = await _promotionUseCase.getFreePromotion(storeId);
    result.when(
        success: (promotion) => freePromotion = promotion,
        error: (e) {
          print(e);
        });

    final user = await _userUseCase.getUser(userId);

    emit(state.copyWith(buyGiftPageStatus: Status.success, store: store, freePromotion: freePromotion, user: user));
  }

  Future<void> checkout() async {
    final selectedPaymentMethod = getIt<SelectedItemsBloc>().state.selectedPaymentMethod;

    // add validation to check if receivingfoodtime is still valid.
    // lets say now is 4pm, scheduled time is 5pm, checkout page stayed open
    // an hour.. scheduled time is not valid anymore.
    emit(state.copyWith(buyGiftPageStatus: Status.loading, buyGiftPageError: null));

    if (selectedPaymentMethod == null) {
      emit(state.copyWith(
        buyGiftPageStatus: Status.failed,
        buyGiftPageError: "Kredi Kartı Bilgisi Giriniz.",
      ));
      return;
    }

    const selectedAddress = Address(id: "", name: "sendGift", address: "sendGift");

    final items = state.freePromotion!.products
        .mapIndexed((i, p) => CartItem(
            quantity: 1,
            product: Product(id: p.id, name: p.name, price: p.price, currency: p.currency, imageFileName: p.imageFileName, priceWithSign: p.priceWithSign),
            id: i))
        .toList();

    final result = await _orderUseCase.placeOrder(
        address: selectedAddress,
        total: state.freePromotion!.products[0].price,
        selectedPaymentcard: selectedPaymentMethod,
        store: state.store!,
        isDelivery: false,
        donationOnly: false,
        foodReceivingTime: DateTime.now(),
        freePromotion: state.freePromotion,
        items: items,
        isGift: true,
        giftTo: state.user!.id);

    result.when(success: (data) {
      emit(state.copyWith(buyGiftPageStatus: Status.success, orderId: data));
    }, error: (error) {
      emit(state.copyWith(buyGiftPageStatus: Status.failed, buyGiftPageError: error));
    });
  }
}
