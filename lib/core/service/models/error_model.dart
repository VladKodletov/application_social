import 'dart:convert';

class ErrorUser {
  ErrorUser({
    required this.message,
  });

  final String message;

  factory ErrorUser.fromJson(String str) => ErrorUser.fromMap(json.decode(str));

  factory ErrorUser.fromMap(Map<String, dynamic> json) => ErrorUser(
        message: json["message"],
      );
}
