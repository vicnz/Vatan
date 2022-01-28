import 'package:flutter/material.dart';

//theme
import 'package:ivatan_dictionary/Theme.dart';

//App
import 'package:ivatan_dictionary/app.dart';

void main(List<String> args) {
  runApp(const Main());
}

class Main extends StatelessWidget {
  const Main({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return MaterialApp(
          title: "Ivatan Dictionary",
          theme: lightTheme,
          darkTheme: darkTheme,
          themeMode: ThemeMode.system,
          home: App(),
          debugShowCheckedModeBanner: false,
          color: lightTheme.colorScheme.primary,
        );
      },
    );
  }
}
