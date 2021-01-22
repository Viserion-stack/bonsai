import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SettingsUser with ChangeNotifier {
  bool isDark;
  bool isNotifications;
  String userName;
  String email;

  SettingsUser({
    this.isDark,
    this.isNotifications,
    this.userName,
    this.email,
  });

  void setValues(bool newFav, bool newNotif, String username, String emailAddress) {
    isDark = newFav;
    isNotifications = newNotif;
    userName = username;
    email = emailAddress;

    notifyListeners();
  }

  Future<void> toggleStatus() async {
    final oldStatusFav = isDark;
    final oldStatusNotif = isNotifications;
    isDark = !isDark;
    isNotifications = !isNotifications;
    notifyListeners();
    final uid = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance.collection('users').doc(uid).get();
    // Here need to get values of isDark and isNotification for change state global variables
    // then need to use this function for update data
  }
}
