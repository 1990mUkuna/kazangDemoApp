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
        data: {"username": username, "password": password},
        options: Options(
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
        ));

    // Checking Response Error
    if (response.statusCode != 200) {
      throw Exception("Fail to Register New User Please contact support");
    }

    print("RESPONSE DATA IS ${response.data.runtimeType}");
    final userJson = jsonDecode(response.data);
    if (userJson == true) {
      return User.fromJson(userJson);
    } else {
      return UserError();
    }
  }

  Future<User> loginWithUserNameAndPassword(
      {@required String username, @required String password}) async {
    Response<String> response = await _dio.post("$baseUrl/login",
        data: {"username": username, "password": password},
        //queryParameters: {"username": username, "password": password},
        options: Options(
          method: "POST",
          headers: {
            "Content-Type": "application/json",
          },
          //contentType: "application/json"
        ));

    // Checking Response Error
    if (response.statusCode != 200) {
      throw Exception("Fail to Login Please contact support");
    }
    print("RESPONSE DATA IS ${response.data.runtimeType}");
    final userJson = response.data["session_id"];
    await _storeUserObject(userJson);

    inspect("****** User Object $userJson******");
    print("****** User Object $userJson *********");

    print("RESPONSE DATA IS ${response.data.runtimeType}");
    if (userJson == true) {
      return User.fromJson(userJson);
    } else {
      return UserError();
    }
  }
}
