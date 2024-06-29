import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/data/models/category_model.dart';
import 'package:kachpara/domain/entities/category.dart';
import 'package:kachpara/utils/result.dart';

@injectable
class CategoryData {
  final FirebaseFirestore _firestore;

  CategoryData(this._firestore);

  Future<Result<CategoryModel>> addCategory({
    required String storeId,
    required CategoryModel category,
  }) async {
    try {
      final storeProducts = await _firestore.collection('stores').doc(storeId).collection('products').get();
      if (storeProducts.docs.isNotEmpty) {
        final product = storeProducts.docs.first;

        await _firestore.collection('stores').doc(storeId).collection('products').doc(product.id).update({
          'categories': FieldValue.arrayUnion([category.toCustomJson()]),
        });
      } else {
        await _firestore.collection('stores').doc(storeId).collection('products').doc().set({
          'categories': FieldValue.arrayUnion([category.toCustomJson()]),
        });
      }

      return Result.success(category);
    } catch (e) {
      return Result.error("Caught error in addCategory: $e");
    }
  }

  Future<Result<CategoryModel>> updateCategory({
    required String storeId,
    required CategoryModel oldCategory,
    required CategoryModel newCategory,
  }) async {
    try {
      final storeProducts = await _firestore.collection('stores').doc(storeId).collection('products').get();
      final product = storeProducts.docs.first;
      final categories = (storeProducts.docs.first.data()["categories"] as List).map((e) => Category.fromJson(e)).toList();

      final matchingCategoryId = categories.indexWhere((item) => item.id == oldCategory.id);
      categories[matchingCategoryId] = Category.fromJson(newCategory.toCustomJson());

      await _firestore.collection('stores').doc(storeId).collection('products').doc(product.id).update({
        'categories': categories.map((e) => CategoryModel.fromDomain(e).toCustomJson()),
      });

      return Result.success(newCategory);
    } catch (e) {
      return Result.error("Caught error in updateCategory: $e");
    }
  }

  Future<Result<CategoryModel>> addProductImage({
    required String storeId,
    required String categoryId,
    required String productId,
    required String imageUrl,
  }) async {
    try {
      final storeProducts = await _firestore.collection('stores').doc(storeId).collection('products').get();
      final product = storeProducts.docs.first;
      final categories = (storeProducts.docs.first.data()["categories"] as List).map((e) => Category.fromJson(e)).toList();

      final matchingCategoryIndex = categories.indexWhere((item) => item.id.toString() == categoryId);
      final category = categories[matchingCategoryIndex];

      final matchingProductIndex = category.products.indexWhere((p) => p.id.toString() == productId);

      category.products[matchingProductIndex] = category.products[matchingProductIndex].copyWith(imageFileName: imageUrl);

      categories[matchingCategoryIndex] = category;

      await _firestore.collection('stores').doc(storeId).collection('products').doc(product.id).update({
        'categories': categories.map((e) => CategoryModel.fromDomain(e).toCustomJson()),
      });

      return Result.success(CategoryModel.fromDomain(category));
    } catch (e) {
      return Result.error("Caught error in updateCategory: $e");
    }
  }

  Future<Result<CategoryModel>> deleteCategory({
    required String storeId,
    required CategoryModel category,
  }) async {
    try {
      final storeProducts = await _firestore.collection('stores').doc(storeId).collection('products').get();
      final product = storeProducts.docs.first;
      final categories = (storeProducts.docs.first.data()["categories"] as List).map((e) => Category.fromJson(e)).toList();

      categories.removeWhere((item) => item.id == category.id);

      await _firestore.collection('stores').doc(storeId).collection('products').doc(product.id).update({
        'categories': categories.map((e) => CategoryModel.fromDomain(e).toCustomJson()),
      });

      return Result.success(category);
    } catch (e) {
      return Result.error("Caught error in deleteCategory: $e");
    }
  }
}
