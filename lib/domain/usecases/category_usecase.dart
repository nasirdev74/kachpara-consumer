import 'dart:developer';
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/data/models/category_model.dart';
import 'package:kachpara/data/sources/firestore/category_data.dart';
import 'package:kachpara/utils/result.dart';

@injectable
class CategoryUseCase {
  final CategoryData _categoryData;

  CategoryUseCase(this._categoryData);

  Future<Result<CategoryModel>> addCategory({
    required String storeId,
    required CategoryModel category,
  }) async {
    return await _categoryData.addCategory(storeId: storeId, category: category);
  }

  Future<Result<CategoryModel>> updateCategory({
    required String storeId,
    required CategoryModel oldCategory,
    required CategoryModel newCategory,
  }) async {
    return await _categoryData.updateCategory(
      storeId: storeId,
      oldCategory: oldCategory,
      newCategory: newCategory,
    );
  }

  Future<Result<CategoryModel>> deleteCategory({
    required String storeId,
    required CategoryModel category,
  }) async {
    return await _categoryData.deleteCategory(
      storeId: storeId,
      category: category,
    );
  }

  Future<Result<String>> uploadProductImage({
    required String storeId,
    required String categoryId,
    required String productId,
    required File image,
  }) async {
    final storageRef = FirebaseStorage.instance.ref();
    final categoryImagesRef = storageRef.child('images/$storeId/$categoryId/$productId.png');

    try {
      final uploadTask = await categoryImagesRef.putFile(image);
      if (uploadTask.state == TaskState.success) {
        final imageUrl = await uploadTask.ref.getDownloadURL();

        final result = await _categoryData.addProductImage(
          storeId: storeId,
          categoryId: categoryId,
          productId: productId,
          imageUrl: imageUrl,
        );

        return result.when(
          success: (_) => Result.success(imageUrl),
          error: (e) => Result.error(e),
        );
      }
    } on FirebaseException catch (e) {
      print('Error on image upload: $e');
    }

    return const Result.error('Error on image upload');
  }
}
