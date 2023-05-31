import 'package:flutter/cupertino.dart';

import '../models/User.dart';

class LoginProvider with ChangeNotifier {
  // define the initial user
  final User _user = User(isLogged: false, username: "");

  // this function get the actual user
  User get user => _user;
  // this function set the user
  void setUser({
    required isLogged,
    required username
  }) {
    // here set the new value
    _user.isLogged = isLogged;
    _user.username = username;

    notifyListeners();
  }

}