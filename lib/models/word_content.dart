import 'dart:convert' as parser;
import 'package:ivatan_dictionary/models/word_definition_item.dart';

/// RESULT RETURNED FROM THE DATABASE
class WordResultItem {
  String word;
  num isFavorite;
  List<DefinitionItem> definitions;
  String? origin;
  WordResultItem({
    required this.word,
    required this.isFavorite,
    required this.definitions,
    this.origin,
  });

  factory WordResultItem.fromMap(Map<String, dynamic> json) {
    return WordResultItem(
      word: json['word'],
      isFavorite: json['isFavorite'],
      origin: json['origin'],
      definitions: (parser.json.decode(json['definitions']) as List)
          .map(
            (e) => DefinitionItem.fromMap(
              e,
            ),
          )
          .toList(),
    );
  }

  Map<String, dynamic> toMap() => {
        "word": word,
        "origin": origin,
        "isFavorite": isFavorite,
        "definitions": [
          ...definitions.map((DefinitionItem e) => e.toMap()),
        ],
      };
}
