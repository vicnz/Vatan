import 'package:flutter/material.dart';

///LIGHT THEME DATA
ThemeData lightTheme = ThemeData(
  primaryColor: Colors.blue[400],
  colorScheme: ColorScheme(
    brightness: Brightness.dark,
    primary: Colors.blue.shade400,
    onPrimary: Colors.blue.shade600,
    secondary: Colors.blueAccent.shade200,
    onSecondary: Colors.blue.shade800,
    error: Colors.red.shade600,
    onError: Colors.white,
    background: Colors.white,
    onBackground: Colors.grey.shade900,
    surface: Colors.white,
    onSurface: Colors.blue.shade400,
  ),
);
///DARK THEME DATA
ThemeData darkTheme = ThemeData(
  primaryColor: Colors.blue[400],
  colorScheme: ColorScheme(
    brightness: Brightness.light,
    primary: Colors.blue.shade400,
    onPrimary: Colors.blue.shade600,
    secondary: Colors.blueAccent.shade200,
    onSecondary: Colors.blue.shade800,
    error: Colors.red.shade600,
    onError: Colors.white,
    background: Colors.blueGrey.shade900,
    onBackground: Colors.grey.shade900,
    surface: Colors.blueGrey.shade700.withOpacity(.5),
    onSurface: Colors.blue.shade400,
  ),
);
