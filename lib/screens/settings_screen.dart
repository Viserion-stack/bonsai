import 'package:bonsai_app/widgets/app_drawer.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

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

    return Scaffold(
      body: Container(
        child: Column(
          children: [
            SizedBox(
              height: 20,
            ),
            SwitchListTile(
              activeColor: Colors.green[600],
              title: const Text(
                'Dark screen',
                style: TextStyle(fontSize: 26),
              ),
              value: isDark,
              onChanged: (bool value) {
                setState(() {
                  isDark = value;
                  _updateSettings();
                });
              },
            ),
            SwitchListTile(
              activeColor: Colors.green[600],
              title: const Text(
                'Notifications',
                style: TextStyle(fontSize: 26),
              ),
              value: isNotifications,
              onChanged: (bool value) {
                setState(() {
                  isNotifications = value;
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
