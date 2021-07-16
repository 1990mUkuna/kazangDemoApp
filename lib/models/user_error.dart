import 'model_barel.dart';

class UserError extends User {
  final String message;

  UserError({this.message});

  factory UserError.fromJson(Map json) {
    return UserError(
      message: json["message"],
    );
  }
}
