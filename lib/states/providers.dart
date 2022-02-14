import 'dart:convert' show jsonDecode;

import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart' show Database;

///DATABASE PROVIDER
class DatabaseInstance extends ChangeNotifier {
  late Database db;
  DatabaseInstance({required this.db});
  void close() async {
    await db.close();
  }
}

//FAVORITE PROVIDER
class Favorites extends ChangeNotifier {
  List favorites = [];
  Database db;
  Favorites({required this.db});

  getFavorites({required Database db, required String tablename}) async {
    favorites = await _parseFavorites(db: db, tablename: tablename);
    notifyListeners();
  }

  //remove a favorite
  removeFavorites(
      {required Database db,
      required String tablename,
      required String word}) async {
    await db.execute(
      "UPDATE $tablename SET isFavorite = 0 WHERE word = ?",
      [word],
    );
    favorites = await _parseFavorites(db: db, tablename: tablename);
    notifyListeners();
  }

  //Clear Favorites
  clearFavorites({required Database db, required String tablename}) async {
    await db.execute(
      "UPDATE $tablename SET isFavorite = 0 WHERE isFavorite = ?",
      [1],
    );
    favorites = await _parseFavorites(db: db, tablename: tablename);
    notifyListeners();
  }

  //adds new favorite
  addFavorites({
    required Database db,
    required String tablename,
    required String word,
  }) async {
    await db.execute(
      "UPDATE $tablename SET isFavorite = 1 WHERE word = ?",
      [word],
    );
    favorites = await _parseFavorites(db: db, tablename: tablename);
    notifyListeners();
  }

  //parse Favorite List
  Future<List> _parseFavorites({
    required Database db,
    required String tablename,
  }) async {
    List<Map<String, Object?>> result = await db.query(
      tablename,
      where: 'isfavorite = ?',
      whereArgs: [1],
    );

    List<Map<String, dynamic>> parsed = result.map(
      (Map<String, dynamic> element) {
        List<dynamic> types = (jsonDecode(element['definitions']) as List)
            .map(
              (child) => child['type'] as String,
            )
            .toList();
        Map<String, dynamic> row = {
          "types": types.join(","),
          "word": element['word'] as String,
        };
        return row;
      },
    ).toList();
    return parsed;
  }
}
