import 'package:flutter/material.dart';

class ChangeColor with ChangeNotifier {
  bool _hasFocus = false;

  bool get hasFocus => _hasFocus;

  set hasFocus(bool value) {
    _hasFocus = value;
    notifyListeners();
  }
}
