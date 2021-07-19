import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kazang_demo/models/model_barel.dart';
import 'package:kazang_demo/models/product_details_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductService {
  static const baseUrl = "http://kazang-test.getsandbox.com/products";
  Dio _dio = Dio();

  Future<List<ProductModel>> getProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String sessionId = prefs.getString("accessToken");

    final String productsUrl = baseUrl;
    final productResponse = await _dio.get(
      productsUrl,
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Session-Id": "$sessionId",
        },
      ),
    );

    if (productResponse.statusCode != 200) {
      throw Exception("error getting Products");
    }

    final productJson = productResponse.data as List;
    return productJson
        .map((listing) => ProductModel.fromJson(listing))
        .toList();
  }

  Future<ProductDetailsModel> getProductsDetails(
      {@required int productId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String sessionId = prefs.getString("accessToken");

    final productResponse = await _dio.get(
      "http://kazang-test.getsandbox.com/products/1",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Session-Id": "$sessionId",
        },
      ),
    );

    if (productResponse.statusCode != 200) {
      throw Exception("error getting Products");
    }

    final productJson = productResponse.data;
    //final showProductById = ProductDetailsModel.fromJson(productJson);
    return ProductDetailsModel.fromJson(productJson);
  }
}
