import 'package:flutter/material.dart';
import 'package:ivatan_dictionary/states/providers.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqflite.dart';

///Animate on Favorite Selection
class HeartAnimation extends StatefulWidget {
  HeartAnimation({
    Key? key,
    required this.isFavorite,
    required this.word,
  }) : super(key: key);
  num isFavorite;
  String word;
  @override
  _HeartAnimationState createState() => _HeartAnimationState();
}

class _HeartAnimationState extends State<HeartAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation _colorAnimation;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
    );
    _colorAnimation = ColorTween(begin: Colors.grey.shade100, end: Colors.red)
        .animate(_controller);

    if (widget.isFavorite == 1) {
      _controller.forward();
    }

    _controller.addStatusListener(
      (status) {
        if (status == AnimationStatus.completed) {
          setState(() {
            widget.isFavorite = 1;
          });
        }
        if (status == AnimationStatus.dismissed) {
          setState(() {
            widget.isFavorite = 0;
          });
        }
      },
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ThemeData theme = Theme.of(context);
    Database? db = Provider.of<DatabaseInstance>(context, listen: false).db;
    Favorites favorites = Provider.of<Favorites>(context, listen: false);

    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, value) {
        return IconButton(
          icon: Icon(
            Icons.favorite_rounded,
            color: _colorAnimation.value,
          ),
          onPressed: () {
            if (_controller.status == AnimationStatus.completed) {
              _controller.reverse();
              favorites.removeFavorites(
                db: db,
                tablename: 'dictionary',
                word: widget.word,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Removed from Favorites",
                    style: TextStyle(color: theme.colorScheme.background),
                  ),
                ),
              );
            } else if (_controller.status == AnimationStatus.dismissed) {
              _controller.forward();
              favorites.addFavorites(
                db: db,
                tablename: 'dictionary',
                word: widget.word,
              );
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text(
                    "Added to Favorites",
                    style: TextStyle(color: theme.colorScheme.background),
                  ),
                ),
              );
            }
          },
        );
      },
    );
  }
}
