import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

//preview
import 'package:ivatan_dictionary/pages/preview.dart';
//animation
import 'package:ivatan_dictionary/pages/components/_animateElement.dart';

class Bookmark extends HookWidget {
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
              Positioned.fill(
                child: BodyList(),
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
          "Favorites",
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
              Icons.delete_outlined,
              color: Theme.of(context).colorScheme.primaryVariant,
            ),
            label: Text(
              "Clear",
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
    return const Center(
      child: Text("Center Child"),
    );
  }
}

class BodyList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      crossAxisCount: 2,
      children: [
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              PreviewWordTransition(page: PreviewWord()),
            );
          },
          child: Card(
            elevation: 3,
            color: Theme.of(context).colorScheme.surface,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Word Name",
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline5?.fontSize,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    "Subtitle",
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.subtitle1?.fontSize,
                      color: Theme.of(context).colorScheme.secondaryVariant,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      alignment: Alignment.center,
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete_outline_rounded,
                      color: Theme.of(context).colorScheme.primaryVariant,
                    ),
                    label: Text(
                      "Delete",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primaryVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            Navigator.push(
              context,
              PreviewWordTransition(page: PreviewWord()),
            );
          },
          child: Card(
            elevation: 3,
            color: Theme.of(context).colorScheme.surface,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    "Word Name",
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.headline5?.fontSize,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                  ),
                  Text(
                    "Subtitle",
                    style: TextStyle(
                      fontSize: Theme.of(context).textTheme.subtitle1?.fontSize,
                      color: Theme.of(context).colorScheme.secondaryVariant,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  ElevatedButton.icon(
                    style: ButtonStyle(
                      alignment: Alignment.center,
                      backgroundColor: MaterialStateProperty.all<Color>(
                        Theme.of(context).colorScheme.primary,
                      ),
                    ),
                    onPressed: () {},
                    icon: Icon(
                      Icons.delete_outline_rounded,
                      color: Theme.of(context).colorScheme.primaryVariant,
                    ),
                    label: Text(
                      "Delete",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primaryVariant,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
