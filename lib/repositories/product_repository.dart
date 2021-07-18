import 'dart:async';
import 'dart:io';

import 'package:kazang_demo/models/model_barel.dart';
import 'package:kazang_demo/models/product_details_model.dart';
import 'package:kazang_demo/services/product_service.dart';
import 'package:meta/meta.dart';

class ProductRepository {
  final ProductService productService;

  ProductRepository({@required this.productService})
      : assert(productService != null);

  Future<List<ProductModel>> getProducts() async =>
      await productService.getProducts();

  Future<List<ProductDetailsModel>> getProductsDetails(
          {@required productId}) async =>
      await productService.getProductsDetails(productId: productId);
}
