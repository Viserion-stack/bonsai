import 'package:bonsai_app/providers/settings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = '/searchScreen';
  @override
  _SearchScreenState createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsUser>(context);
    return Scaffold(
      backgroundColor: settings.isDark ? Color(0xFF303030) : Colors.white ,
      body: Container(
        child: Center(
          child: Text("Search...", style: TextStyle(color: settings.isDark ? Colors.grey : Colors.black),),
        ),
      ),
    );
  }
}
