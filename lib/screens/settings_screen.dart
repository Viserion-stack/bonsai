import 'package:bonsai_app/providers/settings.dart';
import 'package:bonsai_app/widgets/app_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SettingsScreen extends StatefulWidget {
  static const routeName = '/settings';

  @override
  _SettingsScreenState createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final uid = FirebaseAuth.instance.currentUser.uid;
  bool isDark = false;
  bool isNotifications = false;
  void _updateSettings() async {
    FirebaseFirestore.instance.collection('users').doc(uid).update({
      'isDark': isDark,
      'isNotifications': isNotifications,
    });
  }

  @override
  Widget build(BuildContext context) {
    final settings = Provider.of<SettingsUser>(context);
    isDark = settings.isDark;
    isNotifications = settings.isNotifications;
    //Color colorDark = Color()
    return Scaffold(
      backgroundColor: isDark ? Color(0xFF303030) : Colors.white,
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SwitchListTile(
              activeColor: Colors.green[600],
              title: Text(
                'Dark screen',
                style: TextStyle(
                  fontSize: 26,
                  color: isDark ? Colors.white : Color(0xFF303030),
                ),
              ),
              value: isDark,
              onChanged: (bool values) {
                setState(() {
                  settings.isDark = values;
                  isDark = values;
                  _updateSettings();
                });
              },
            ),
            SwitchListTile(
              activeColor: Colors.green[600],
              title: Text(
                'Notifications',
                style: TextStyle(
                  fontSize: 26,
                  color: isDark ? Colors.white : Color(0xFF303030),
                ),
              ),
              value: isNotifications,
              onChanged: (bool value) {
                setState(() {
                  isNotifications = value;
                  settings.isNotifications = value;
                  _updateSettings();
                });
              },
            ),
          ],
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
