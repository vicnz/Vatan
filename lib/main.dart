//dart
import 'dart:io';
//flutter
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//others
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
//ivatan
import 'package:ivatan_dictionary/app.dart';
import 'package:ivatan_dictionary/states/modeTheme.dart';
import 'package:ivatan_dictionary/states/providers.dart';
import 'package:ivatan_dictionary/theme.dart' show lightTheme, darkTheme;
import 'package:ivatan_dictionary/states/appinfo.dart' show databaseVersion;

void main(List<String> args) {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(
    // ThemeMode state
    ChangeNotifierProvider(
      create: (_) => ThemeModeState(),
      child: const App(),
    ),
  );
}

class App extends StatefulWidget {
  const App({Key? key}) : super(key: key);
  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> {
  //Initialize Database
  Future<Database> init() async {
    var databaseDirectory = await getDatabasesPath();
    var dbPath = join(databaseDirectory, 'data.db');
    bool isDBExist = await databaseExists(dbPath);
    if (!isDBExist) {
      try {
        await Directory(dirname(dbPath)).create(recursive: true);
        //Copy Database from Assets to Device Database Location
        ByteData data = await rootBundle.load(join("assets", "data.sqlite"));
        List<int> bytes =
            data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);

        await File(dbPath).writeAsBytes(bytes, flush: true);
        return await openDatabase(dbPath);
      } catch (_) {
        print("Error Copying Database \n$_");
      }
    }
    Future.delayed(const Duration(milliseconds: 3500)); //Splash Screen
    return await openDatabase(dbPath, version: databaseVersion);
  }

  @override
  Widget build(BuildContext context) {
    /// SET SYSTEM BARS TRANSPARENT
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarColor: Theme.of(context).colorScheme.primary,
      ),
    );

    return FutureBuilder(
      future: init(),
      builder: (
        BuildContext context,
        AsyncSnapshot<Database> snapshot,
      ) {
        if (snapshot.hasData) {
          return MultiProvider(
            providers: [
              /// Database State
              ChangeNotifierProvider(
                create: (context) => DatabaseInstance(
                  db: snapshot.data!,
                ),
              ),

              /// Favorites State
              ChangeNotifierProvider(
                create: (_) {
                  return Favorites(db: snapshot.data!)
                    ..getFavorites(db: snapshot.data!, tablename: 'dictionary');
                },
              ),
            ],
            child: MaterialApp(
              theme: lightTheme,
              darkTheme: darkTheme,
              home: const AppMain(),
              title: "Vatan",
              themeMode: Provider.of<ThemeModeState>(context).mode,
              debugShowCheckedModeBanner: false,
              color: lightTheme.primaryColor,
            ),
          );
        } else {
          /// awaiting database copy operation
          return MaterialApp(
            theme: lightTheme,
            darkTheme: darkTheme,
            home: const SafeArea(
              child: Center(
                child: CircularProgressIndicator(),
              ),
            ),
            title: "Vatan",
            themeMode: Provider.of<ThemeModeState>(context).mode,
            debugShowCheckedModeBanner: false,
            color: darkTheme.primaryColor,
          );
        }
      },
    );
  }
}
