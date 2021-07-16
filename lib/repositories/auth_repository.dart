import 'package:flutter/cupertino.dart';
import 'package:kazang_demo/models/user.dart';
import 'package:kazang_demo/services/auth_service.dart';

class AuthRepository {
  final AuthService authService;

  AuthRepository({@required this.authService}) : assert(authService != null);

  /* Future<User> registerWithUsernamrAndPassword({
    @required String username,
    @required String password
  }) async {
    return ();
  } */

  Future<User> loginWithUserNameAndPassword(
      {@required String username, @required String password}) async {
    return authService.loginWithUserNameAndPassword(
        username: username, password: password);
  }
}
