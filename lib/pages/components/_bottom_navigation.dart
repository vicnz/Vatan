import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

class BottomNavBar extends HookWidget {
  BottomNavBar({Key? key, required this.activeTab, required this.tabController})
      : super(key: key);
  ValueNotifier activeTab;
  TabController tabController;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Material(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        color: Theme.of(context).colorScheme.surface,
        elevation: 5,
        child: TabBar(
          onTap: (value) => activeTab.value = value,
          overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
          enableFeedback: true,
          controller: tabController,
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
    );
  }
}
