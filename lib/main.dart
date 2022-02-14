import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ivatan_dictionary/app.dart';
import 'package:ivatan_dictionary/states/ModeTheme.dart';
import 'package:ivatan_dictionary/states/providers.dart';

//ThemeData
import 'package:ivatan_dictionary/theme.dart' show lightTheme, darkTheme;
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

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
    return await openDatabase(dbPath);
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: init(),
      builder: (
        BuildContext context,
        AsyncSnapshot<Database> snapshot,
      ) {
        if (snapshot.hasData) {
          return MultiProvider(
            providers: [
              //Database State
              ChangeNotifierProvider(
                create: (context) => DatabaseInstance(
                  db: snapshot.data!,
                ),
              ),
              //Favorites State
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
              color:
                  (Provider.of<ThemeModeState>(context).mode == ThemeMode.light)
                      ? lightTheme.colorScheme.background
                      : darkTheme.colorScheme.background,
            ),

            /// # TO OUR MAIN APP
          );
        } else {
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
            color:
                (Provider.of<ThemeModeState>(context).mode == ThemeMode.light)
                    ? lightTheme.colorScheme.background
                    : darkTheme.colorScheme.background,
          );
        }
      },
    );
  }
}
