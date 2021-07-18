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
          "Session-Id": "885fe94c-4c94-cf7c-298e-02c052781948",
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

  Future<List<ProductDetailsModel>> getProductsDetails(
      {@required productId}) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String sessionId = prefs.getString("accessToken");

    final productResponse = await _dio.get(
      "http://kazang-test.getsandbox.com/products/$productId",
      options: Options(
        headers: {
          "Content-Type": "application/json",
          "Session-Id": "885fe94c-4c94-cf7c-298e-02c052781948",
        },
      ),
    );

    if (productResponse.statusCode != 200) {
      throw Exception("error getting Products");
    }

    final productJson = productResponse.data as List;
    return productJson
        .map((listing) => ProductDetailsModel.fromJson(listing))
        .toList();
  }
}
