import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

//THEME MODE STATE
class ThemeModeState extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;
  useLight() {
    mode = ThemeMode.light;

    setSharedPref().then(
      (pref) => pref.setString('user-theme', 'light'),
    );
    notifyListeners();
  }

  useDark() {
    mode = ThemeMode.dark;

    setSharedPref().then(
      (pref) => pref.setString('user-theme', 'dark'),
    );
    notifyListeners();
  }

  useSystem() {
    mode = ThemeMode.system;
    notifyListeners();
  }
}

Future<SharedPreferences> setSharedPref() async {
  return await SharedPreferences.getInstance();
}
