import 'package:bonsai_app/auth_data.dart';
import 'package:bonsai_app/model/auth.dart';
import 'package:bonsai_app/widget/account.dart';
import 'package:flutter/material.dart';

class AccountScreen extends StatefulWidget {
  @override
  _AccountScreenState createState() => _AccountScreenState();
}

class _AccountScreenState extends State<AccountScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Account(authData[0].username, authData[0].password),
    );
  }
}
