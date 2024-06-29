import 'dart:io';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/data/models/category_model.dart';
import 'package:kachpara/domain/entities/category.dart';
import 'package:kachpara/domain/usecases/category_usecase.dart';
import 'package:kachpara/ui/edit_product_page/cubit/utils.dart';

part 'edit_product_state.dart';
part 'edit_product_cubit.freezed.dart';

@injectable
class EditProductCubit extends Cubit<EditProductState> {
  EditProductCubit(
    @factoryParam this.storeId,
    this._categoryUseCase,
  ) : super(const EditProductState());

  final CategoryUseCase _categoryUseCase;
  final String storeId;

  Future<void> addCategory({
    required Category category,
  }) async {
    final result = await _categoryUseCase.addCategory(
      storeId: storeId,
      category: CategoryModel.fromDomain(category),
    );

    result.when(
      success: ((_) => emit(state.copyWith(status: EditProductStateStatus.addSuccessful))),
      error: (_) => EditProductStateStatus.addFailed,
    );
  }

  Future<void> updateCategory({
    required Category oldCategory,
    required Category newCategory,
  }) async {
    final result = await _categoryUseCase.updateCategory(
      storeId: storeId,
      oldCategory: CategoryModel.fromDomain(oldCategory),
      newCategory: CategoryModel.fromDomain(newCategory),
    );

    result.when(
      success: ((_) => emit(state.copyWith(status: EditProductStateStatus.updateSuccessful))),
      error: (_) => EditProductStateStatus.updateFailed,
    );
  }

  Future<void> deleteCategory({
    required CategoryModel category,
  }) async {
    await _categoryUseCase.deleteCategory(
      storeId: storeId,
      category: category,
    );
  }

  Future<String?> uploadProductImage({
    required String categoryId,
    required String productId,
    required File image,
  }) async {
    final result = await _categoryUseCase.uploadProductImage(
      storeId: storeId,
      categoryId: categoryId,
      productId: productId,
      image: image,
    );

    String? imageUrl;

    result.when(
      success: (url) {
        imageUrl = url;
        emit(state.copyWith(
          status: EditProductStateStatus.imageAddedSuccessfully,
        ));
      },
      error: (_) => emit(state.copyWith(status: EditProductStateStatus.imageAddingFailed)),
    );

    return imageUrl;
  }
}
