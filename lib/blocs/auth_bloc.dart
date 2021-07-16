/* 
The Auth Bloc responds to incomming AppEvents and Tansforms 
them into outgoing AuthState and It immediately subsribe to the User stream 
From AuthenticationRepository  and adds an AuthenticationUserChanged event 
internally to process changes in the current user.
It has dependency on the Auth Repository  
*/
import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:kazang_demo/blocs/auth_event.dart';
import 'package:kazang_demo/models/model_barel.dart';
import 'package:kazang_demo/repositories/auth_repository.dart';

import 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepository authRepository;
  AuthBloc({@required this.authRepository})
      : assert(authRepository != null),
        super(AuthInitial());
  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is RegisterUserEvent) {
      yield AuthLoadInProgress();
      try {
        User user = await authRepository.registerWithUsernamrAndPassword(
            username: event.username, password: event.password);
        yield AuthLoadSuccess(user: user);
      } catch (_) {
        yield AuthLoadFailure();
      }
    } else if (event is LoginUserEvent) {
      yield AuthLoadInProgress();
      try {
        var authResult = await authRepository.loginWithUserNameAndPassword(
          username: event.username,
          password: event.password,
        );
        print("AuthResult from LoginWithEmailBloc *** $authResult");
        inspect("AuthResult from LoginWithEmailBloc *** $authResult");

        yield AuthLoadSuccess(user: authResult);
      } catch (e) {
        print("err $e Username: ${event.username} PassWord:${event.password} ");
        inspect(e);
        yield AuthLoadFailure();
      }
    }
  }
}
