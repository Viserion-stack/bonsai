import 'package:bonsai_app/widgets/app_drawer.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
   static const routeName = '/settings';
  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: Center(
        child: Container(child: Text('Here will be something'),
        ),
      ),
       drawer: AppDrawer(),
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Container(
          padding: EdgeInsets.only(left: 45),
          child: Text(
            'settings',
            style: TextStyle(
              color: Colors.white,
              fontFamily: 'Pacifico',
              fontSize: 40,
            ),
          ),
        ),
      ),
    );
  }
}