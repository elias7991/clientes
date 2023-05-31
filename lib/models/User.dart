import 'dart:convert';

User userFromJson(String str) => User.fromJson(json.decode(str));

String userToJson(User data) => json.encode(data.toJson());

class User {
  // define of the fields
  bool isLogged;
  String username;

  // define the constructor
  User({
    required this.isLogged,
    required this.username
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    isLogged: json["isLogged"],
    username: json["username"],
  );

  Map<String, dynamic> toJson() => {
    "isLogged": isLogged,
    "username": username
  };
}