import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

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
            child: BannerCustom(),
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
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
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
          Container(
            height: 180,
            width: MediaQuery.of(context).size.width,
            padding: const EdgeInsets.symmetric(horizontal: 25),
            child: Stack(
              children: [
                //main content
                Positioned.fill(
                  top: 15,
                  child: Material(
                    elevation: 5,
                    borderRadius: BorderRadius.circular(25),
                    child: Container(
                      padding: const EdgeInsets.all(10),
                      child: Padding(
                        padding: const EdgeInsets.only(top: 15),
                        child: Text(
                          "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae recusandae minus soluta quo dolore ea id, nemo molestias provident illum beatae obcaecati nam quis tenetur! Labore nesciunt porro pariatur. Ut facilis optio accusamus minima rem porro blanditiis similique vel et dolorem ullam molestias, est cum omnis, odio iusto! Neque, minus.",
                          textAlign: TextAlign.justify,
                          style: TextStyle(
                            color: Theme.of(context).colorScheme.primary,
                            fontSize:
                                Theme.of(context).textTheme.bodyText2?.fontSize,
                            height:
                                Theme.of(context).textTheme.bodyText2?.height,
                          ),
                        ),
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Theme.of(context).colorScheme.surface),
                    ),
                  ),
                ),
                //Pill
                Positioned(
                  top: 0,
                  left: 0,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.secondaryVariant,
                      borderRadius: const BorderRadius.only(
                        bottomRight: Radius.circular(25),
                        topLeft: Radius.circular(25),
                        topRight: Radius.circular(25),
                        bottomLeft: Radius.zero,
                      ),
                    ),
                    child: Text(
                      "About Thy Self",
                      style: TextStyle(
                        color: Theme.of(context).colorScheme.primaryVariant,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
