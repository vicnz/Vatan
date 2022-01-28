import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

//Route
import 'package:ivatan_dictionary/pages/preview.dart';

class MyState extends ChangeNotifier {
  bool _isFocused = false;

  bool get isFocused => _isFocused;

  void setIsFocused(bool value) {
    _isFocused = value;
    notifyListeners();
  }

  String _searchQuery = "";

  String get searchQuery => _searchQuery;

  void setSearchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }
}

class Home extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyState(), //initalize State
      child: Column(
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
              child: SearchBar(),
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
                Consumer<MyState>(
                  builder: (context, state, child) => Positioned.fill(
                    child:
                        state.searchQuery.isNotEmpty ? BodyList() : BodyImage(),
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

class SearchBar extends HookWidget {
  @override
  Widget build(BuildContext context) {
    TextEditingController _textController = useTextEditingController();

    return Consumer<MyState>(
      builder: (context, state, child) => Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(horizontal: 8),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.secondary,
          borderRadius: BorderRadius.circular(15),
        ),
        child: Focus(
          onFocusChange: (value) => state.setIsFocused(value),
          child: TextField(
            onChanged: (value) {
              state.setSearchQuery(value);
            },
            controller: _textController,
            decoration: InputDecoration(
              hintText: "Search ...",
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 15),
              prefixIcon: Icon(
                Icons.search_rounded,
                color: Theme.of(context).colorScheme.primary,
              ),
              suffixIcon: state.isFocused
                  ? IconButton(
                      onPressed: () {
                        _textController.clear();
                        state.setSearchQuery("");
                      },
                      icon: Icon(Icons.close_rounded,
                          color: Theme.of(context).colorScheme.primary),
                    )
                  : null,
            ),
            style: TextStyle(
              color: Theme.of(context).colorScheme.primaryVariant,
            ),
          ),
        ),
      ),
    );
  }
}

class BodyImage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(height: 25),
          CircleAvatar(
            backgroundColor: Theme.of(context).colorScheme.secondary,
            radius: 45,
            child: Icon(
              Icons.mic_external_on_rounded,
              size: 40,
              color: Theme.of(context).colorScheme.primaryVariant,
            ),
          ),
          const SizedBox(height: 15),
          Text(
            "E-Chirin Da'",
            style: TextStyle(
              color: Theme.of(context).colorScheme.primaryVariant,
              fontSize: Theme.of(context).textTheme.headline4?.fontSize,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          RichText(
            textAlign: TextAlign.justify,
            text: TextSpan(
              children: [
                TextSpan(
                  text: "Find the meaning of that",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondaryVariant,
                    fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
                    fontWeight:
                        Theme.of(context).textTheme.bodyText2?.fontWeight,
                  ),
                ),
                TextSpan(
                  text: " Ivatan ",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondary,
                    fontSize: Theme.of(context).textTheme.headline6?.fontSize,
                    fontWeight:
                        Theme.of(context).textTheme.headline5?.fontWeight,
                  ),
                ),
                TextSpan(
                  text:
                      "word you heard. Learning word-by-word is the building block of learning a language.",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondaryVariant,
                    fontSize: Theme.of(context).textTheme.bodyText2?.fontSize,
                    fontWeight:
                        Theme.of(context).textTheme.bodyText2?.fontWeight,
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

class BodyList extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: 5,
      itemBuilder: (context, index) {
        return Container(
          margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 15),
          child: Material(
            color: Theme.of(context).colorScheme.onSurface.withOpacity(.9),
            elevation: 2,
            borderRadius: BorderRadius.circular(10),
            child: InkWell(
              onTap: () async {
                await Navigator.push(context, PreviewWord());
              },
              child: ListTile(
                title: Text(
                  "Index Number $index",
                  style: TextStyle(
                    color: Theme.of(context).colorScheme.secondaryVariant,
                  ),
                ),
                trailing: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_outline_rounded,
                    color: Theme.of(context).colorScheme.secondaryVariant,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}