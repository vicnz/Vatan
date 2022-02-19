import 'package:flutter/material.dart';
import 'package:ivatan_dictionary/components/animations/PageTransition.dart';
import 'package:ivatan_dictionary/preview.dart';
import 'package:ivatan_dictionary/states/providers.dart';
import 'package:provider/provider.dart';

Widget FavoriteItem({
  required BuildContext context,
  required int index,
}) {
  ThemeData theme = Theme.of(context);

  return Consumer<Favorites>(
    builder: (context, state, child) => Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.symmetric(
        horizontal: 20,
        vertical: 3,
      ),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(18),
        ),
        elevation: 2,
        color: theme.colorScheme.surface,
        child: InkWell(
          onTap: () {
            Navigator.push(
              context,
              PageTransition(
                page: PreviewPage(
                  word: state.favorites[index]['word'],
                ),
              ),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      state.favorites[index]['word'],
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontSize: theme.textTheme.headline6?.fontSize,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      state.favorites[index]['types'],
                      style: TextStyle(
                        color: theme.colorScheme.primary,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: theme.colorScheme.onSurface,
                  ),
                  onPressed: () async {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text(
                          "Removed Item ${state.favorites[index]['word']}",
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.background,
                          ),
                        ),
                      ),
                    );

                    /// Remove Favorites from Database and Updatez
                    await state.removeFavorites(
                      db: Provider.of<DatabaseInstance>(context, listen: false)
                          .db,
                      tablename: 'dictionary',
                      word: state.favorites[index]['word'],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    ),
  );
}
