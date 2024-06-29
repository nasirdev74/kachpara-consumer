part of 'product_list_page_cubit.dart';

@freezed
class ProductListPageState with _$ProductListPageState {
  const factory ProductListPageState({
    @Default(Status.init) Status getProductsStatus,
    @Default(<Category>[]) List<Category> categories,
    @Default(Status.init) Status getCategoriesStatus,
    int? selectedCategoryId,
    Store? store,
    String? curationId,
    UserStore? userStore,
    Promotion? freePromotion,
  }) = _ProductListPageState;
}
