import 'package:bhagvatgeeta/helper/theme_preference.dart';
import 'package:flutter/cupertino.dart';

class ThemeController extends ChangeNotifier {
  late bool _isDark;
  late ThemePreference _prefs;

  bool get isDark => _isDark;

  ThemeController() {
    _isDark = false;
    _prefs = ThemePreference();
    getPrefs();
  }

  set isDark(bool value) {
    _isDark = value;
    _prefs.setTheme(value);
    notifyListeners();
  }

  getPrefs() async {
    _isDark = await _prefs.getTheme();
    notifyListeners();
  }

  onTapped() {
    isDark = !isDark;
    notifyListeners();
  }
}
