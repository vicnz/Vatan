import 'package:flutter/material.dart';
import 'package:ivatan_dictionary/components/favorite/FavoriteItem.dart';
import 'package:ivatan_dictionary/states/providers.dart' show Favorites;
import 'package:provider/provider.dart';

SliverList FavoriteList(BuildContext context) {
  ///
  ///
  return SliverList(
    delegate: SliverChildBuilderDelegate(
      (context, index) {
        return FavoriteItem(context: context, index: index);
      },
      childCount:
          Provider.of<Favorites>(context, listen: true).favorites.length,
    ),
  );
}
