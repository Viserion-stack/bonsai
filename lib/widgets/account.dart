import 'package:bonsai_app/select_page.dart';
import 'package:provider/provider.dart';
import 'package:flutter/material.dart';

class Account extends StatefulWidget {
  final String username;
  final String password;

  Account(this.username, this.password);
  @override
  _AccountState createState() => _AccountState();
}

class _AccountState extends State<Account> {
  //Account user;
  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var index = Provider.of<SelectPage>(context, listen: true);
    return Scaffold(
      body: Stack(
        children: <Widget>[
          //HomePage(),
          //SideBar(),
        ],
      ),
    );
  }
}
