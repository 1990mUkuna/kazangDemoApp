/* The Auth Event file can have multiple sub class 
   that ihnerite from AuthEvent
 */
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';


abstract class AuthEvent extends Equatable {
  const AuthEvent();
}

class RegisterUserEvent extends AuthEvent {
  final String username;
  final String password;

  const RegisterUserEvent({
    @required this.username,
    @required this.password,
  }) : assert(username != null && password != null);

  @override
  List<Object> get props => [
        username,
        password,
      ];
}

class LoginUserEvent extends AuthEvent {
  final String username;
  final String password;

  LoginUserEvent({
    @required this.username,
    @required this.password,
  }) : assert(
          username != null && password != null,
        );

  @override
  List<Object> get props => [
        username,
        password,
      ];
}
