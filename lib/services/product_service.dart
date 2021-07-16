import 'dart:developer';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:kazang_demo/models/model_barel.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ProductService {
  static const baseUrl = "http://kazang-test.getsandbox.com/products";
  Dio _dio = Dio();

  Future<List<Product>> getProducts() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String sessionId = prefs.getString("accessToken");

    final String productsUrl = baseUrl;
    final productResponse = await _dio.get(
      productsUrl,
      options: Options(
        headers: {
          // "Authorization": "Bearer $token",
        },
      ),
    );

    if (productResponse.statusCode != 200) {
      throw Exception("error getting Products");
    }

    final productJson = productResponse.data as List;
    return productJson.map((listing) => Product.fromJson(listing)).toList();
  }
}
