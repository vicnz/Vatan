import 'package:flutter/material.dart';
import 'package:ivatan_dictionary/states/providers.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class FavoriteHeader extends SliverPersistentHeaderDelegate {
  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    ThemeData theme = Theme.of(context);
    return Container(
      color: theme.colorScheme.background,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.baseline,
        textBaseline: TextBaseline.ideographic,
        children: [
          Text(
            "FAVORITES",
            style: TextStyle(
              color: theme.colorScheme.secondary,
              fontSize: theme.textTheme.headline6?.fontSize,
              fontWeight: theme.textTheme.headline6?.fontWeight,
            ),
          ),
          TextButton.icon(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all<Color>(
                theme.colorScheme.primary.withOpacity(.5),
              ),
              foregroundColor: MaterialStateProperty.all<Color>(
                theme.colorScheme.secondary,
              ),
              shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(18),
                ),
              ),
              alignment: Alignment.center,
              padding: MaterialStateProperty.all<EdgeInsets>(
                const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              ),
            ),

            ///CLEAR ALL FAVORITES
            onPressed: () async {
              Database? db =
                  Provider.of<DatabaseInstance>(context, listen: false).db;
              await Provider.of<Favorites>(context, listen: false)
                  .clearFavorites(db: db, tablename: 'dictionary');

              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Favorites Cleared",
                    style: TextStyle(color: theme.colorScheme.background),
                  ),
                ),
              );
            },
            icon: const Icon(Icons.delete_sweep_outlined),
            label: const Text("CLEAR"),
          ),
        ],
      ),
    );
  }

  @override
  double get maxExtent => 90;

  @override
  double get minExtent => 75;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) =>
      true;
}
