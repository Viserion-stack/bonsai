import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class SettingsUser with ChangeNotifier {
  bool isDark ;
  bool isNotifications ;

  SettingsUser({
    this.isDark ,
    this.isNotifications ,
  });

  void setValues(bool newFav, bool newNotif){
    isDark = newFav;
    isNotifications = newNotif;
    notifyListeners();
  }

  Future<void> toggleStatus() async{
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
