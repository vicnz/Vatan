//flutter
import 'package:flutter/material.dart';
//others
import 'package:provider/provider.dart';

//app
import 'package:ivatan_dictionary/components/appbar.dart' show AppBarSection;
import 'package:ivatan_dictionary/components/favorite/favoriteheader.dart'
    show FavoriteHeader;
import 'package:ivatan_dictionary/components/favorite/favoritelist.dart'
    show FavoriteList;
import 'package:ivatan_dictionary/components/header.dart' show Header;
import 'package:ivatan_dictionary/components/searchbar.dart' show SearchBar;
import 'package:ivatan_dictionary/components/logo.dart' show PageLogo;
import 'package:ivatan_dictionary/states/providers.dart' show Favorites;

class AppMain extends StatefulWidget {
  const AppMain({Key? key}) : super(key: key);
  @override
  State<AppMain> createState() => _AppMainState();
}

class _AppMainState extends State<AppMain> {
  @override
  Widget build(BuildContext context) {
    return StatefulBuilder(
      builder: (context, setState) {
        return Scaffold(
          backgroundColor: Theme.of(context).colorScheme.background,
          body: SafeArea(
            child: CustomScrollView(
              physics: const BouncingScrollPhysics(
                parent: AlwaysScrollableScrollPhysics(),
              ),
              slivers: [
                ///Appbar
                AppBarSection(
                  context,
                  PageLogo(context,
                      color: Theme.of(context).colorScheme.onPrimary,
                      size: Theme.of(context).iconTheme.size),
                ),
                SliverList(
                  delegate: SliverChildListDelegate(
                    [
                      ///# Header (Ivatan Dictionary) #
                      const Header(),
                      const SizedBox(height: 10),

                      ///# Searchbar (Clickable) #
                      SearchBar(context),
                      const SizedBox(
                        height: 15,
                      )
                    ],
                  ),
                ),

                ///Favorite Header (Favorites)
                SliverPersistentHeader(
                  pinned: true,
                  floating: true,
                  delegate: FavoriteHeader(),
                ),

                ///Favorite Body
                if (Provider.of<Favorites>(context).favorites.isEmpty)

                  /// There is no favorite item return
                  SliverFillRemaining(
                    child: Center(
                      child: Text(
                        "You Have No Favorite Words Yet?",
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.secondary,
                          fontSize:
                              Theme.of(context).textTheme.headline6?.fontSize,
                        ),
                      ),
                    ),
                  )
                else

                  ///FavoriteList(context)
                  ///render favorite if there favorite words
                  FavoriteList(context),
              ],
            ),
          ),
        );
      },
    );
  }
}
