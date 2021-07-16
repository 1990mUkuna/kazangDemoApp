/* 
The goal of User Model is to keep track of user 
object response data displayed by our app
 */
import 'package:equatable/equatable.dart';


class User extends Equatable {
  final String username;
  final String password;
  final String sessionId;

  User({this.username, this.password, this.sessionId});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      username: json["username"],
      password: json["password"],
      sessionId: json["session_id"],
    );
  }

  @override
  List<Object> get props => [username, password, sessionId];
}
