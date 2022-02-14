import 'package:flutter/material.dart';

import 'package:ivatan_dictionary/components/search/search.dart';
import 'package:ivatan_dictionary/components/words.dart' show getWords;

Widget SearchBar(BuildContext context) {
  ThemeData theme = Theme.of(context);
  return Padding(
    padding: const EdgeInsets.symmetric(
      horizontal: 20,
    ),
    child: InkWell(
      onTap: () async {
        List<String> words = await getWords(context) as List<String>;
        await showSearch(
          context: context,
          delegate: CustomSearchDelegate(words: words),
        );
      },
      child: Material(
        color: theme.colorScheme.surface,
        elevation: 5,
        shadowColor: theme.colorScheme.onBackground.withOpacity(.3),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        child: Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 18,
            vertical: 12,
          ),
          alignment: Alignment.center,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Search Here",
                style: TextStyle(
                  color: theme.colorScheme.secondary,
                ),
              ),
              Icon(
                Icons.search_rounded,
                color: theme.colorScheme.secondary,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
