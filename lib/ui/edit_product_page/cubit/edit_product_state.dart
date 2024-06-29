part of 'edit_product_cubit.dart';

@freezed
class EditProductState with _$EditProductState {
  const factory EditProductState({
    @Default(EditProductStateStatus.init) EditProductStateStatus status,
  }) = _EditProductState;
}
