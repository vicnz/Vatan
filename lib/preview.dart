import 'package:flutter/material.dart';

//components
import 'package:ivatan_dictionary/components/AppBar.dart' show AppBarSection;
import 'package:ivatan_dictionary/components/preview/DefinitionBlock.dart';
import 'package:ivatan_dictionary/components/preview/PreviewHeader.dart'
    show PreviewHeader;
import 'package:ivatan_dictionary/models/word_content.dart';
import 'package:ivatan_dictionary/models/word_definition_item.dart';
import 'package:ivatan_dictionary/states/providers.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

class PreviewPage extends StatefulWidget {
  PreviewPage({Key? key, required this.word, this.close}) : super(key: key);
  final String word;
  dynamic close;
  @override
  _PreviewPageState createState() => _PreviewPageState();
}

class _PreviewPageState extends State<PreviewPage> {
  /// Get WordList Items
  /// @ BuildContext context
  /// @ String word
  /// -> List<WordResultItem>
  Future fetchData(BuildContext context, String word) async {
    Database? db = Provider.of<DatabaseInstance>(context).db;
    var result =
        await db.query('dictionary', where: 'word = ?', whereArgs: [word]);
    if ((result).isNotEmpty) {
      var item = WordResultItem.fromMap(result.first);
      return item;
    } else {
      return <WordResultItem>[];
    }
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.colorScheme.background,
      body: SafeArea(
        child: FutureBuilder(
          future: fetchData(context, widget.word),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.hasData) {
              return CustomScrollView(
                physics: const BouncingScrollPhysics(
                  parent: AlwaysScrollableScrollPhysics(),
                ),
                slivers: [
                  if (widget.close?.runtimeType == null)
                    AppBarSection(
                      context,
                      IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                          if (widget.close != null) widget.close();
                        },
                        icon: const Icon(Icons.arrow_back_rounded),
                      ),
                      title: widget.word,
                    ),
                  if (snapshot.data.runtimeType == WordResultItem)
                    SliverList(
                      delegate: SliverChildListDelegate(
                        [
                          PreviewHeader(
                            word: widget.word,
                            origin: (snapshot.data as WordResultItem).origin,
                            isFavorite:
                                (snapshot.data as WordResultItem).isFavorite,
                          ),
                          ...(snapshot.data as WordResultItem)
                              .definitions
                              .map(
                                (DefinitionItem item) => DefinitionBlock(
                                  context,
                                  type: item.type,
                                  content: item,
                                ),
                              )
                              .toList()
                        ],
                      ),
                    )
                  else

                    ///if the search result result to "nothing"
                    ///then return this widget
                    SliverFillRemaining(
                      child: Center(
                        child: Text(
                          "There is No Word Associated To \"${widget.word}\"",
                          style: TextStyle(color: theme.colorScheme.onPrimary),
                        ),
                      ),
                    ),
                ],
              );
            } else {
              ///If List<WordResultItem> is not yet ready then return
              ///a "Waiting" UI
              return const SafeArea(
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
