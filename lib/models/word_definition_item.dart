///DEFINITION ITEM FROM THE "definitions"
class DefinitionItem {
  String type;
  String definition;
  List? samples;
  List<dynamic>? related;
  Map<String, dynamic> variants;
  String? grammar;
  List<dynamic>? antonym;
  List<dynamic>? synonym;
  String? cultural_note;
  List<dynamic>? semantics;
  List<dynamic>? morphophonemics;
  List<dynamic>? sayings;
  Map<String, dynamic>? derivative;

  DefinitionItem({
    required this.type,
    required this.definition,
    required this.variants,
    required this.derivative,
    this.samples,
    this.related,
    this.grammar,
    this.antonym,
    this.synonym,
    this.cultural_note,
    this.sayings,
    this.morphophonemics,
    this.semantics,
  });

  factory DefinitionItem.fromMap(Map<String, dynamic> json) {
    return DefinitionItem(
      type: json['type'],
      definition: json['description'],
      variants: {
        "ilokano": json['variant']['ilokano'],
        "ivatan": json['variant']['ivatan'],
        "tagalog": json['variant']['tagalog'],
      },
      derivative: json['derivative'],
      antonym: json['antonym'],
      synonym: json['synonym'],
      cultural_note: json['cultural_note'],
      samples: json['samples'],
      grammar: json['grammar'],
      morphophonemics: json['morphophonemics'],
      related: json['related'],
      sayings: json['sayings'],
      semantics: json['semantics'],
    );
  }

  Map<String, dynamic> toMap() => {
        "type": type,
        "definition": definition,
        "variants": variants,
        "derivative": derivative,
        "antonym": antonym,
        "synonym": synonym,
        "cultural_note": cultural_note,
        "samples": samples,
        "grammar": grammar,
        "morphophonemics": morphophonemics,
        "related": related,
        "sayings": sayings,
        "semantics": semantics,
      };
}
