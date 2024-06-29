import 'dart:developer';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_functions/cloud_functions.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';
import 'package:kachpara/domain/entities/category.dart';
import 'package:kachpara/utils/result.dart';

@injectable
class ProductData {
  final FirebaseFirestore _firestore;
  final FirebaseFunctions _functions;

  ProductData(this._firestore, this._functions);

  Future<Result<List<Category>>> getDefaultProductList(String storeId) async {
    try {
      final products = await _firestore.collection("stores").doc(storeId.toString()).collection("products").get();

      if (products.docs.isEmpty) return Result.error('There is no products for this store');

      final categories = (products.docs.first.data()["categories"] as List?)?.map((e) => Category.fromJson(e)).toList();

      if (categories != null && categories.isNotEmpty) {
        return Result.success(categories);
      }

      return Result.error('There is no products for this store');
    } catch (e) {
      return Result.error('Error with fetching store products');
    }
  }

  Future<Result<String>> addMenuImage({
    required String storeId,
    required File image,
  }) async {
    final storageRef = FirebaseStorage.instance.ref();
    final menuImageRef = storageRef.child('images/$storeId/menu.png');
    try {
      final uploadTask = await menuImageRef.putFile(image);
      if (uploadTask.state == TaskState.success) {
        final imageUrl = uploadTask.ref.fullPath;

        return Result.success(imageUrl);
      }
    } on FirebaseException catch (e) {
      print('Error on menu image upload: $e');
    }

    return const Result.error('Error on menu image upload');
  }

  Future<Result> createMenuFromImage({
    required String storeId,
    required String imageUrl,
  }) async {
    final body = {
      'storeId': storeId,
      'imageUrl': imageUrl,
    };

    try {
      final response = await _functions.httpsCallable("addProductsFromImage").call(body);

      if (response.data["code"] == 200) {
        return const Result.success('Store products added successfully!');
      } else {
        return const Result.error("Error adding store products");
      }
    } catch (e) {
      return Result.error(e.toString());
    }
  }
}

//   Use CASE
// ###############################################
// Future<Result<List<Category>>> getDefaultProductList(int storeId) async {
//   final result = await _productData.getCategories(storeId);
//   return result.when(success: (data) async {
//     final categoryList = data.map((e) => e.toDomain()).toList();
//     List<Category> categories = [];
//     await Future.wait([
//       for (final category in data) _productData.getProducts(category.id)
//     ]).then((value) {
//       for (var i = 0; i < data.length; i++) {
//         value[i].when(success: (data) {
//           categories.add(categoryList[i]
//               .copyWith(products: data.map((e) => e.toDomain()).toList()));
//         }, error: (error) {
//           print("error: $error");
//         });
//       }
//     });

//     return Result.success(categories);
//   }, error: (error) {
//     return Result.error(error);
//   });
// }

// REST API
// #########################################

//   Future<Result<List<ProductModel>>> getProdudddcts(int categoryId) async {
//     try {
//       final response = await _client.get("/categoryitems",
//           queryParameters: {"businesscategory_id": categoryId});
//       if (response.statusCode == 200) {
//         if (kDebugMode) {
//           print("dio response: ${response.data}");
//         }
//         final list = response.data["items"] as List?;
//         final products = list?.map((e) => ProductModel.fromJson(e)).toList();
//         if (products != null) {
//           return Result.success(products);
//         }
//       }
//       return const Result.error("api error");
//     } catch (e) {
//       if (kDebugMode) {
//         print("getproducts catched error : $e");
//       }
//       return Result.error("catched error: $e");
//     }
//   }

//   Future<Result<List<CategoryModel>>> getCatdddegories(int storeId) async {
//     try {
//       final response = await _client
//           .get("/categories", queryParameters: {"business_id": storeId});
//       if (response.statusCode == 200) {
//         final list = response.data as List?;
//         final categories = list?.map((e) => CategoryModel.fromJson(e)).toList();
//         if (categories != null) {
//           return Result.success(categories);
//         }
//       }
//       return const Result.error("api error");
//     } catch (e) {
//       if (kDebugMode) {
//         print("getcategories catched error : $e");
//       }
//       return Result.error("catched error: $e");
//     }
//   }
// }
