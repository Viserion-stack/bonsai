import 'package:flutter/material.dart';

class Auth {
  final userId;
  final String email;
  final String password;
  final String username;

  const Auth(
      {@required this.userId,
      @required this.email,
      @required this.password,
      @required this.username});
}
