class FavoriteItem {
  String word;
  String types;
  FavoriteItem({required this.word, required this.types});

  factory FavoriteItem.fromMap(Map<String, dynamic> json) => FavoriteItem(
        word: json['word'],
        types: json['types'],
      );

  Map<String, dynamic> toMap() => {
        "word": word,
        "types": types,
      };
}
