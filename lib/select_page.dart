import 'package:bonsai_app/screens/home_page.dart';
import 'package:flutter/material.dart';

class SelectPage extends ChangeNotifier {
  int _index;

  get index => _index;
  set index(int value) {
    _index = value;
    notifyListeners();
  }
}