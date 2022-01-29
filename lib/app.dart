import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:ivatan_dictionary/pages/components/_animateElement.dart';

//body widgets
import 'package:ivatan_dictionary/pages/home.dart';
import 'package:ivatan_dictionary/pages/bookmarks.dart';
import 'package:ivatan_dictionary/pages/about.dart';

//components
import 'package:ivatan_dictionary/pages/components/_bottom_navigation.dart';

class App extends HookWidget {
  @override
  Widget build(BuildContext context) {
    //Tab Switcher Controller
    TabController _tabcontroller = useTabController(
      initialLength: 3,
      initialIndex: 0,
    );
    //Active Tab Index
    ValueNotifier _activeTab = useState(0);

    //widget
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
              systemNavigationBarColor: Theme.of(context).colorScheme.onPrimary,
            ),
            backgroundColor: Theme.of(context).colorScheme.primary,
            elevation: 0,
            //Page Logo
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
          bottomNavigationBar: BottomNavBar(
            activeTab: _activeTab,
            tabController: _tabcontroller,
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
      return SlideFrom(
        child: FadeElement(child: Home()),
        offset: const Offset(0, -1.0),
        duration: const Duration(milliseconds: 500),
      );
    case 1:
      return SlideFrom(
        child: FadeElement(child: Bookmark()),
        offset: const Offset(0, -1.0),
        duration: const Duration(
          milliseconds: 500,
        ),
      );
    case 2:
      return SlideFrom(
        child: FadeElement(child: About()),
        offset: const Offset(0, -1.0),
        duration: const Duration(
          milliseconds: 500,
        ),
      );
    default:
      return SlideFrom(
        child: FadeElement(child: Home()),
        offset: const Offset(0, -1.0),
        duration: const Duration(
          milliseconds: 500,
        ),
      );
  }
}
