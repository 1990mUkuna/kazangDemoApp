/* 
The Auth State consists of an Auth Status and a User 
*/

import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:kazang_demo/models/model_barel.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

//Auth  Status
class AuthInitial extends AuthState {}

class AuthLoadInProgress extends AuthState {}

class AuthLoadSuccess extends AuthState {
  final User user;
  const AuthLoadSuccess({@required this.user});

  @override
  List<Object> get props => [user];
}

class AuthLoadFailure extends AuthState {
  final String message;

  AuthLoadFailure({this.message});

  @override
  List<Object> get props => [message];
}
