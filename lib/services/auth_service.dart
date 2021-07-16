import 'dart:convert';
import 'dart:developer';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:kazang_demo/models/model_barel.dart';
import 'package:kazang_demo/models/user.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  static const baseUrl = "http://kazang-test.getsandbox.com/users";

  Dio _dio = Dio();

  //Store session ID
  _storeUserObject(String sessionIDToken) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString("sessionID", sessionIDToken);
  }

  Future<User> registerWithUserNameAndPassword(
      {@required String username, @required String password}) async {
    Response<String> response = await _dio.post("$baseUrl",
        queryParameters: {"username": username, "password": password});

    // Checking Response Error
    if (response.statusCode != 200) {
      throw Exception("Fail to Register New User Please contact support");
    }

    print("RESPONSE DATA IS ${response.data.runtimeType}");

    // store response data inside Userjson
    final userJson = jsonDecode(response.data);

    if (userJson) {
      return User.fromJson(userJson);
    } else {
      return UserError();
    }
  }

  Future<User> loginWithUserNameAndPassword(
      {@required String username, @required String password}) async {
    Response<String> response = await _dio.post("$baseUrl/login",
        queryParameters: {"username": username, "password": password});

    // Checking Response Error
    if (response.statusCode != 200) {
      throw Exception("Fail to Login Please contact support");
    }

    // store response data inside Userjson
    final userJson = jsonDecode(response.data);

    // Strore json response local store shared Preference
    await _storeUserObject(userJson);

    User user = User.fromJson(userJson);
    inspect("****** User Object $user ******");
    print("****** User Object $user *********");

    return user;
  }
}
