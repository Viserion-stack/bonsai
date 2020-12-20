import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';

class Settings with ChangeNotifier {
  bool isFavorite;
  bool isNotifications;

  Settings({
    this.isFavorite = false,
    this.isNotifications = false,
  });

  void _setValues(bool newFav, bool newNotif){
    isFavorite = newFav;
    isNotifications = newNotif;
    notifyListeners();
  }

  Future<void> toggleStatus() async{
    final oldStatusFav = isFavorite;
    final oldStatusNotif = isNotifications;
    isFavorite = !isFavorite;
    isNotifications = !isNotifications;
    notifyListeners();
    final uid = FirebaseAuth.instance.currentUser.uid;
    FirebaseFirestore.instance.collection('users').doc(uid).get();
  }
}
