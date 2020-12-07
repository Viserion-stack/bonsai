
import 'package:flutter/material.dart';

class SelectPage extends ChangeNotifier {
  int _index = 0;

  get index => _index;
  set index(int value) {
    _index = value;
    notifyListeners();
  }
}