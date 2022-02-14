import 'package:flutter/material.dart';

//THEME MODE STATE
class ThemeModeState extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;

  useLight() {
    mode = ThemeMode.light;
    notifyListeners();
  }

  useDark() {
    mode = ThemeMode.dark;
    notifyListeners();
  }

  useSystem() {
    mode = ThemeMode.system;
    notifyListeners();
  }
}
