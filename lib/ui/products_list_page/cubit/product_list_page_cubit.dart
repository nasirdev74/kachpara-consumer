import 'dart:developer';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/entities/category.dart';
import 'package:kachpara/domain/entities/promotion.dart';
import 'package:kachpara/domain/entities/store.dart';
import 'package:kachpara/domain/entities/user_store.dart';
import 'package:kachpara/domain/usecases/cart_usecases.dart';
import 'package:kachpara/domain/usecases/promotions_usecase.dart';
import 'package:kachpara/domain/usecases/store_usecase.dart';
import 'package:kachpara/domain/usecases/user_usecase.dart';
import 'package:kachpara/utils/result.dart';

import '../../../domain/entities/product.dart';
import '../../../domain/usecases/product_usecase.dart';
import '../../../utils/status.dart';

part 'product_list_page_cubit.freezed.dart';
part 'product_list_page_state.dart';

@injectable
class ProductListPageCubit extends Cubit<ProductListPageState> {
  ProductListPageCubit(this._productUsecase, this._cartUseCases, @factoryParam this._storeId, @factoryParam this._referralCode, this._promotionUseCase,
      this._userUseCase, this._storeUsecase)
      : super(const ProductListPageState()) {
    _initProductListPage();
  }

  final ProductUsecase _productUsecase;
  final CartUseCases _cartUseCases;
  final PromotionUseCase _promotionUseCase;
  final StoreUsecase _storeUsecase;
  final UserUseCase _userUseCase;
  Store? _store;
  final String _storeId;
  final String? _referralCode;

  Future<void> _initProductListPage({bool showLoadingIndicator = true}) async {
    if (showLoadingIndicator) emit(state.copyWith(getCategoriesStatus: Status.loading));

    // this hack was needed because getIt can't pass more than 2 factory parameters.
    List<String> parts = _storeId.split("-");
    String storeIdPart = parts[0];
    String? curationId;
    if (parts.length > 1) {
      curationId = parts[1];
    }
    final result1 = await _storeUsecase.getStoreById(storeId: storeIdPart);
    result1.when(success: (store) => _store = store, error: (e) => Result.error("Failed to get store: $e"));

    bool isStoreAdded = await _userUseCase.isStoreAdded(storeIdPart.toString());

    // _referralCode == null if user clicks store through a list
    // in this case, we are not going to add store to the user list.
    // addition is only going to happen through dynamic link.
    if (!isStoreAdded && _referralCode != null) {
      _storeUsecase.addStore(store: _store!, referralCode: _referralCode);
    }
    final userStore = await _userUseCase.getUserStore(storeIdPart.toString());

    // double lat = double.parse(_store!.lat!);
    // double lng = double.parse(_store!.lng!);

    // bool inDeliveryZone = await _userUseCase.checkIfInDeliveryZone(lat, lng);
    // bool inDeliveryZone = true;

    final result = await _productUsecase.getDefaultProductList(_store!.id);
    result.when(success: (data) async {
      List<Category> categories = data;
      // if (!inDeliveryZone) {
      //   categories = data
      //       .where((category) =>
      //           category.products.any((product) => product.promotionId != null))
      //       .toList();
      // }

      final freePromotionResult = await _promotionUseCase.getFreePromotion(storeIdPart);
      freePromotionResult.when(success: (freePromotion) async {
        emit(state.copyWith(
          getCategoriesStatus: Status.success,
          categories: categories,
          selectedCategoryId: data.first.id,
          freePromotion: freePromotion,
          store: _store,
          userStore: userStore,
          curationId: curationId,
        ));
      }, error: (error) {
        emit(
          state.copyWith(
            getCategoriesStatus: Status.success,
            categories: categories,
            store: _store,
            userStore: userStore,
            curationId: curationId,
          ),
        );
      });
    }, error: (error) {
      emit(state.copyWith(getCategoriesStatus: Status.success, categories: [], store: _store, userStore: userStore, curationId: curationId));
    });
  }

  void reloadProductListPage() => _initProductListPage(showLoadingIndicator: false);

  Future<void> addProductToCart(Product product, String storeId, String? curationId) async {
    await _cartUseCases.addToCart(product, storeId, curationId);
  }

  Future<void> addMenuImage({
    required File image,
  }) async {
    emit(state.copyWith(getCategoriesStatus: Status.loading));
    final imageUploadResult = await _productUsecase.addMenuImage(storeId: _storeId.split("-")[0], image: image);

    imageUploadResult.when(
      success: (imageUrl) async {
        await _productUsecase.createMenuFromImage(storeId: _storeId.split("-")[0], imageUrl: imageUrl);

        reloadProductListPage();
      },
      error: (error) {},
    );
  }
}
