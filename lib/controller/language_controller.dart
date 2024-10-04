import 'package:flutter/material.dart';

class LanguageController extends ChangeNotifier {
  bool isHindi = false;

  onChange() {
    isHindi = !isHindi;
    notifyListeners();
  }
}
