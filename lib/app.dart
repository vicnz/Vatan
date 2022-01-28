import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

//body widgets
import 'package:ivatan_dictionary/pages/home.dart';
import 'package:ivatan_dictionary/pages/bookmarks.dart';
import 'package:ivatan_dictionary/pages/about.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    TabController _tabcontoller =
        useTabController(initialLength: 3, initialIndex: 0);
    ValueNotifier _activeTab = useState(0);
    return StatefulBuilder(
      builder: (context, setState) {
        return Scaffold(
          resizeToAvoidBottomInset: false,
          backgroundColor: Theme.of(context).colorScheme.background,
          extendBody: true,

          ///APPBAR
          appBar: AppBar(
            systemOverlayStyle: SystemUiOverlayStyle(
                statusBarColor: Colors.transparent,
                systemNavigationBarColor:
                    Theme.of(context).colorScheme.onPrimary),
            backgroundColor: Theme.of(context).colorScheme.primary,
            elevation: 0,
            leading: Icon(
              Icons.android_rounded,
              color: Theme.of(context).colorScheme.primaryVariant,
            ),
            title: Text(
              "Ivatan Dictionary",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primaryVariant,
                fontSize:
                    Theme.of(context).appBarTheme.titleTextStyle?.fontSize,
              ),
            ),
          ),

          ///BOTTOM NAVIGATION BAR
          bottomNavigationBar: Container(
            margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            child: Material(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(25),
              ),
              color: Theme.of(context).colorScheme.surface,
              elevation: 5,
              child: TabBar(
                onTap: (value) => _activeTab.value = value,
                overlayColor:
                    MaterialStateProperty.all<Color>(Colors.transparent),
                enableFeedback: true,
                controller: _tabcontoller,
                indicator: BoxDecoration(
                  color: Theme.of(context).colorScheme.primary.withOpacity(.3),
                  borderRadius: BorderRadius.circular(50),
                ),
                indicatorSize: TabBarIndicatorSize.tab,
                tabs: [
                  Tab(
                    icon: Icon(Icons.home_rounded,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  Tab(
                    icon: Icon(Icons.my_library_books_rounded,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                  Tab(
                    icon: Icon(Icons.info_rounded,
                        color: Theme.of(context).colorScheme.primary),
                  ),
                ],
              ),
            ),
          ),
          body: _widget_swapper(_activeTab.value),
        );
      },
    );
  }
}

Widget _widget_swapper(index) {
  switch (index) {
    case 0:
      return Home();
    case 1:
      return Bookmark();
    case 2:
      return About();
    default:
      return Home();
  }
}
