import 'package:flutter/material.dart';

class Login extends ChangeNotifier {
  String _nameLogin = "";
  String get getLogin => _nameLogin;

  void changeLogin(String newLogin) {
    _nameLogin = newLogin;
    notifyListeners();
  }
}
