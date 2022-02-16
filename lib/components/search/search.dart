import 'package:flutter/material.dart';
import 'package:ivatan_dictionary/preview.dart';
// import 'package:ivatan_dictionary/components/animations/PageTransition.dart';

class CustomSearchDelegate extends SearchDelegate {
  List<String> words;
  List<String> items = [];

  CustomSearchDelegate({required this.words}) {
    query = "";
    items = [];
  }

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        icon: const Icon(Icons.clear),
        onPressed: () {
          query = "";
        },
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      icon: const Icon(Icons.home_rounded, size: 25),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    //what comes in
    return PreviewPage(
      word: query,
      close: close,
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    ThemeData theme = Theme.of(context);
    items = words
        .where(
          (element) => element.toLowerCase().startsWith(
                query.toLowerCase(),
              ),
        )
        .toList();

    if (query.isNotEmpty || query != "") {
      return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: ListView.builder(
          physics: const BouncingScrollPhysics(
            parent: AlwaysScrollableScrollPhysics(),
          ),
          itemCount: items.length,
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Material(
                color: theme.colorScheme.surface,
                elevation: 3,
                shadowColor: theme.colorScheme.onBackground.withOpacity(.3),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15),
                ),
                child: InkWell(
                  onTap: () async {
                    query = items[index];
                    showResults(context);
                  },
                  child: ListTile(
                    title: Text(
                      items[index],
                      style: TextStyle(
                        color: theme.colorScheme.onSecondary,
                      ),
                    ),
                    trailing: Icon(Icons.chevron_right_rounded,
                        color: theme.colorScheme.onPrimary),
                  ),
                ),
              ),
            );
          },
        ),
      );
    } else {
      return Center(
        child: Text(
          "Some Words Starts with or Ends with a (-) dash?",
          style: TextStyle(color: theme.colorScheme.onPrimary),
        ),
      );
    }
  }

  @override
  ThemeData appBarTheme(BuildContext context) {
    final ThemeData theme = Theme.of(context);
    final ColorScheme colorScheme = theme.colorScheme;
    return theme.copyWith(
      scaffoldBackgroundColor: colorScheme.background,
      appBarTheme: AppBarTheme(
        elevation: 0,
        backgroundColor: colorScheme.background,
        iconTheme: theme.primaryIconTheme.copyWith(color: theme.primaryColor),
        toolbarTextStyle: TextStyle(
          color: theme.primaryColor,
          fontSize: theme.textTheme.bodyText2?.fontSize,
        ),
        titleTextStyle: TextStyle(
          color: colorScheme.primary,
          fontSize: theme.textTheme.headline6?.fontSize,
          fontWeight: theme.textTheme.headline6?.fontWeight,
        ),
      ),
      textTheme: TextTheme(
        titleLarge: TextStyle(color: theme.primaryColor),
      ),
      inputDecorationTheme: searchFieldDecorationTheme ??
          InputDecorationTheme(
            hintStyle: TextStyle(
              color: colorScheme.secondary,
              fontSize: theme.inputDecorationTheme.hintStyle?.fontSize,
              fontWeight: FontWeight.w400,
            ),
            border: InputBorder.none,
          ),
    );
  }
}
