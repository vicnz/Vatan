import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
//animation
import 'package:ivatan_dictionary/pages/components/_animateElement.dart';
//state
import 'package:ivatan_dictionary/theme.dart' show AppThemeMode;

class About extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          alignment: Alignment.centerLeft,
          width: MediaQuery.of(context).size.width,
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 15,
              vertical: 20,
            ),
            //BELOW
            child: FadeElement(child: BannerCustom()),
          ),
          decoration: BoxDecoration(
            borderRadius: const BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
            color: Theme.of(context).colorScheme.primary,
          ),
        ),
        Expanded(
          child: Stack(
            children: [
              Positioned(
                child: Image.asset(
                  'assets/images/empty.png',
                ),
                bottom: 0,
                width: MediaQuery.of(context).size.width,
              ),
              Positioned(
                child: BodyImage(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class BannerCustom extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "About",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primaryVariant,
            fontSize: Theme.of(context).textTheme.headline5?.fontSize,
          ),
        ),
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 8),
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.secondary.withOpacity(.8),
            borderRadius: BorderRadius.circular(50),
          ),
          child: TextButton.icon(
            onPressed: () {},
            icon: Icon(
              Icons.link_outlined,
              color: Theme.of(context).colorScheme.primaryVariant,
            ),
            label: Text(
              "Edit on Github",
              style: TextStyle(
                color: Theme.of(context).colorScheme.primaryVariant,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class BodyImage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 25),
          CircleAvatar(
            radius: 50,
            backgroundColor: Theme.of(context).colorScheme.secondary,
            child: const FlutterLogo(size: 100),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            "NEONZONE",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondaryVariant,
              fontSize: Theme.of(context).textTheme.headline5?.fontSize,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(height: 3),
          Text(
            "githubaccount@github",
            style: TextStyle(
              color: Theme.of(context).colorScheme.secondary,
              fontSize: Theme.of(context).textTheme.bodyText1?.fontSize,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              children: [
                Card(
                  color: Theme.of(context).colorScheme.surface,
                  elevation: 5,
                  child: Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            "About",
                            style: TextStyle(
                              color:
                                  Theme.of(context).colorScheme.primaryVariant,
                            ),
                          ),
                          padding: const EdgeInsets.symmetric(
                            horizontal: 10,
                            vertical: 5,
                          ),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(25),
                            color: Theme.of(context).colorScheme.primary,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          "Tempor amet et diam suscipit ut dolor kasd eos amet ipsum amet clita dolore clita magna. Ut sea ut dolor facilisi sit ea ullamcorper diam dolore sed stet ipsum iriure dolore sanctus sed justo facer. Amet lorem amet et sit dolor sed sit voluptua et quis eos no consequat.",
                          style: TextStyle(
                              color: Theme.of(context).colorScheme.secondary,
                              height: 1.5),
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                ThemeChanger(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class ThemeChanger extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<AppThemeMode>(
      builder: (context, state, child) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ChoiceChip(
            selectedColor:
                Theme.of(context).colorScheme.primary.withOpacity(.3),
            label: const Text("Light Theme"),
            selected:
                state.mode == ThemeMode.light && ThemeMode.system != state.mode,
            avatar: const Icon(Icons.light_mode),
            onSelected: (value) {
              state.setLightMode();
            },
          ),
          const SizedBox(width: 10),
          ChoiceChip(
            selectedColor:
                Theme.of(context).colorScheme.primary.withOpacity(.3),
            label: const Text("Dark Theme"),
            selected:
                state.mode == ThemeMode.dark && ThemeMode.system != state.mode,
            avatar: const Icon(Icons.dark_mode),
            onSelected: (value) {
              state.setDarkMode();
            },
          )
        ],
      ),
    );
  }
}
