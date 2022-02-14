import 'package:flutter/material.dart';

class PageTransition extends PageRouteBuilder {
  final Widget page;
  PageTransition({required this.page})
      : super(
          pageBuilder: (context, animation, otherAnimation) => page,
          transitionDuration: const Duration(milliseconds: 800),
          reverseTransitionDuration: const Duration(
            milliseconds: 500,
          ),
          transitionsBuilder: (context, animation, otherAnimation, child) {
            animation = CurvedAnimation(
              parent: animation,
              curve: Curves.fastLinearToSlowEaseIn,
              reverseCurve: Curves.fastOutSlowIn,
            );
            final offset = animation.drive(
              Tween(
                begin: const Offset(10, 0),
                end: const Offset(0, 0),
              ),
            );

            return SlideTransition(position: offset, child: child);
          },
        );
}
