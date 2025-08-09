import 'package:flutter/material.dart';

class AppViewModel extends ChangeNotifier {
  ThemeMode themeMode = ThemeMode.dark;

  void toggleTheme() {
    themeMode = themeMode == ThemeMode.dark ? ThemeMode.light : ThemeMode.dark;
    notifyListeners();
  }

  bool isDarkTheme() {
    return themeMode == ThemeMode.dark;
  }
}
