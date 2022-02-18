import 'package:flutter/material.dart';

//components
import 'package:ivatan_dictionary/components/preview/sampleblock.dart'
    show SampleBlock, SampleList;
import 'package:ivatan_dictionary/components/preview/block.dart' show Block;
import 'package:ivatan_dictionary/components/preview/variantblock.dart';
import 'package:ivatan_dictionary/models/word_definition_item.dart';

///DEFINITION BLOCK
Widget DefinitionBlock(
  BuildContext context, {
  String type = "Default",
  required DefinitionItem content,
}) {
  ThemeData theme = Theme.of(context);
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    child: Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: theme.colorScheme.surface,
        borderRadius: BorderRadius.circular(18),
        boxShadow: [
          BoxShadow(
            color: theme.colorScheme.onBackground.withOpacity(.5),
            blurRadius: 8,
            spreadRadius: -4,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Chip(
            label: Text(
              type.toUpperCase(),
              style: TextStyle(
                color: theme.colorScheme.background,
              ),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
            backgroundColor: theme.colorScheme.primary,
          ),
          const SizedBox(height: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //Variants
              VariantBlock(context,
                  content: content.variants, title: "Variant"),
              //Definition
              Block(
                context,
                title: "Definition",
                content: content.definition,
              ),

              //Grammar
              (content.grammar != null)
                  ? Block(
                      context,
                      content: content.grammar,
                      title: "Grammar",
                    )
                  : const SizedBox(),
              //Cultural Note
              (content.cultural_note != null)
                  ? Block(
                      context,
                      content: content.cultural_note,
                      title: "Cultural Note",
                    )
                  : const SizedBox(),
              //Semantics
              (content.semantics != null)
                  ? Block(context,
                      title: "Semantics", content: content.semantics?.join(","))
                  : const SizedBox(),
              //Samples
              if ((content.samples as List).isNotEmpty)
                ...(content.samples as List)
                    .map(
                      (e) => SampleBlock(
                        context,
                        sample: e['sample'],
                        translation: e['translation'],
                      ),
                    )
                    .toList(),
              //Synonyms
              (content.synonym != null)
                  ? Block(
                      context,
                      title: "Synonyms",
                      content: content.synonym,
                    )
                  : const SizedBox(),
              //Antonyms
              (content.antonym != null)
                  ? Block(
                      context,
                      title: "Antonyms",
                      content: content.antonym,
                    )
                  : const SizedBox(),
              //Morphonemics
              (content.morphophonemics != null)
                  ? Block(context,
                      title: "Morphonemics",
                      content: content.morphophonemics?.join(","))
                  : const SizedBox(),
              //related
              (content.related != null)
                  ? Block(
                      context,
                      title: "Related",
                      content: content.related,
                    )
                  : const SizedBox(),
            ],
          )
        ],
      ),
    ),
  );
}
