import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    primary: Color(0xFF90C418),
    primaryVariant: Color(0xFF4F6B0D), //heading text
    secondary: Color(0xFF7AA614),
    secondaryVariant: Color(0xFF90C418), //body text
    surface: Colors.white,
    background: Colors.white,
    error: Color(0xFFB00020),
    brightness: Brightness.light,
    onBackground: Colors.white,
    onPrimary: Color(0xFF90C418),
    onSecondary: Color(0xFF7AA614),
    onSurface: Colors.white,
    onError: Color(0xFFB00020),
  ),
  primaryColor: const Color(0xFF90C418),
);
ThemeData darkTheme = ThemeData(
  colorScheme: const ColorScheme(
    primary: Color(0xFF90C418),
    primaryVariant: Color(0xFF4F6B0D), //heading text
    secondary: Color(0xFF7AA614),
    secondaryVariant: Color(0xFF90C418), //body text
    surface: Color(0xFF414141),
    background: Color(0xFF202020),
    error: Color(0xFFCF6679),
    brightness: Brightness.dark,
    onBackground: Color(0xFF202020),
    onPrimary: Color(0xFF90C418),
    onSecondary: Color(0xFF7AA614),
    onSurface: Color(0xFF414141),
    onError: Color(0xFFCF6679),
  ),
  primaryColor: const Color(0xFF90C418),
);

class AppThemeMode extends ChangeNotifier {
  ThemeMode mode = ThemeMode.light;

  //Set App Theme Mode to Dark
  void setDarkMode() {
    mode = ThemeMode.dark;
    notifyListeners();
  }

  //Set App Theme Mode to Light
  void setLightMode() {
    mode = ThemeMode.light;
    notifyListeners();
  }

  //Set App Theme Mode to System Preferenced
  void setToSystemMode() {
    mode = ThemeMode.system;
  }
}
