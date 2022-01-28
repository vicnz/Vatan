import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

class PreviewWord extends MaterialPageRoute {
  PreviewWord()
      : super(
          builder: (context) => _PreviewWordBody(),
        );
}

class _PreviewWordBody extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      extendBody: true,
      appBar: AppBar(
        systemOverlayStyle: SystemUiOverlayStyle(
            statusBarColor: Colors.transparent,
            systemNavigationBarColor: Theme.of(context).colorScheme.onPrimary),
        backgroundColor: Theme.of(context).colorScheme.primary,
        elevation: 0,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: Icon(Icons.arrow_back_ios_new_rounded,
              color: Theme.of(context).colorScheme.primaryVariant),
        ),
        title: Text(
          "Ivatan Dictionary",
          style: TextStyle(
            color: Theme.of(context).colorScheme.primaryVariant,
            fontSize: Theme.of(context).appBarTheme.titleTextStyle?.fontSize,
          ),
        ),
      ),
      body: Column(
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
                Positioned.fill(
                  child: ListView.builder(
                    itemCount: 2,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          const SizedBox(height: 10),
                          DecriptionItem(pill: "Category ${index + 1}"),
                        ],
                      );
                    },
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

class BannerCustom extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.baseline,
      textBaseline: TextBaseline.alphabetic,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          "Word Name",
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
              Icons.favorite_border_rounded,
              color: Theme.of(context).colorScheme.primaryVariant,
            ),
            label: Text(
              "Add",
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

//DESCRIPTION LIST

//DECRIPTION ITEM
class DecriptionItem extends HookWidget {
  DecriptionItem({Key? key, required this.pill}) : super(key: key);

  String pill;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: Stack(
        children: [
          Positioned(
            child: Container(
              padding: const EdgeInsets.only(
                top: 30,
                left: 10,
                right: 10,
                bottom: 10,
              ),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.surface,
                borderRadius: BorderRadius.circular(5),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(.05),
                    offset: const Offset(0, 8),
                    blurRadius: 4,
                    spreadRadius: 8,
                  ),
                ],
              ),
              margin: const EdgeInsets.only(top: 10),
              child: Column(
                children: [
                  DescriptionSection(
                    title: "Description",
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  DescriptionSection(title: "Grammar"),
                  const SizedBox(height: 10),
                  BlockQuote(title: "Sample 1"),
                ],
              ),
            ),
          ),

          //Pill
          Positioned(
            top: 0,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
              child: Text(pill),
              decoration: BoxDecoration(
                color: Theme.of(context).colorScheme.primary,
                borderRadius: BorderRadius.circular(25),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class DescriptionSection extends HookWidget {
  DescriptionSection({Key? key, required this.title}) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          title,
          style: TextStyle(
            color: Theme.of(context).colorScheme.primary,
            fontSize: Theme.of(context).textTheme.headline5?.fontSize,
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        Text(
          "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae recusandae minus soluta quo dolore ea id, nemo molestias provident illum beatae obcaecati nam quis tenetur! Labore nesciunt porro pariatur. Ut facilis optio accusamus minima rem porro blanditiis similique vel et dolorem ullam molestias, est cum omnis, odio iusto! Neque, minus.",
          style: TextStyle(
            color: Theme.of(context).colorScheme.secondaryVariant,
            fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
            fontWeight: FontWeight.w300,
            height: Theme.of(context).textTheme.bodyText2?.height,
          ),
        ),
      ],
    );
  }
}

class BlockQuote extends HookWidget {
  BlockQuote({Key? key, required this.title}) : super(key: key);
  String title;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(5),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.primary.withOpacity(.1),
          border: Border(
            left: BorderSide(
              width: 5,
              color: Theme.of(context).colorScheme.primary,
            ),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: TextStyle(
                color: Theme.of(context).colorScheme.primary,
                fontSize: Theme.of(context).textTheme.headline6?.fontSize,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            Text(
              "Lorem ipsum dolor sit amet consectetur adipisicing elit. Quae recusandae minus soluta quo dolore ea id, nemo molestias provident illum beatae obcaecati nam quis tenetur! Labore nesciunt porro pariatur. Ut facilis optio accusamus minima rem porro blanditiis similique vel et dolorem ullam molestias, est cum omnis, odio iusto! Neque, minus.",
              style: TextStyle(
                color: Theme.of(context).colorScheme.secondaryVariant,
                fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
                fontWeight: FontWeight.w300,
                height: Theme.of(context).textTheme.bodyText2?.height,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
