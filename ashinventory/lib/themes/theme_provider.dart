import 'package:flutter/material.dart';

class ThemeNotifier with ChangeNotifier {
  ThemeMode _themeData = ThemeMode.light;

  ThemeMode get themeData => _themeData;

  bool get isDarkMode => _themeData == ThemeMode.dark;

  set themeData(ThemeMode themeData) {
    _themeData = themeData;
    notifyListeners();
  }

  void toggleTheme() {
    _themeData == ThemeMode.light ? themeData = ThemeMode.dark : themeData = ThemeMode.light;
  }
}
