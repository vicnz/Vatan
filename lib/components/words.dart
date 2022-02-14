import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'dart:convert';

Future<List<dynamic>> getWords(BuildContext context) async {
  String jsonString = await rootBundle.loadString(join('assets', 'words.json'));
  // return jsonString;
  // print(json.decode(jsonString).runtimeType);
  List<String> value = (json.decode(jsonString) as List)
      .map((element) => element as String)
      .toList();
  return value;
}
