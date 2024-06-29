import 'dart:io';

import 'package:injectable/injectable.dart';
import 'package:kachpara/data/sources/firestore/product_data.dart';
import 'package:kachpara/domain/entities/category.dart';

import '../../utils/result.dart';

@injectable
class ProductUsecase {
  final ProductData _productData;

  ProductUsecase(this._productData);

  Future<Result<List<Category>>> getDefaultProductList(String storeId) => _productData.getDefaultProductList(storeId);

  Future<Result<String>> addMenuImage({required String storeId, required File image}) => _productData.addMenuImage(storeId: storeId, image: image);

  Future<Result> createMenuFromImage({required String storeId, required String imageUrl}) =>
      _productData.createMenuFromImage(storeId: storeId, imageUrl: imageUrl);
}
