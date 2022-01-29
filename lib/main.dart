import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//theme
import 'package:ivatan_dictionary/theme.dart'
    show darkTheme, lightTheme, AppThemeMode;

//App
import 'package:ivatan_dictionary/app.dart';

void main(List<String> args) {
  runApp(
    ChangeNotifierProvider(
      create: (_) => AppThemeMode(),
      child: const Main(),
    ),
  );
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
          themeMode: Provider.of<AppThemeMode>(context).mode,
          home: App(),
          debugShowCheckedModeBanner: false,
          color: lightTheme.colorScheme.primary,
        );
      },
    );
  }
}
