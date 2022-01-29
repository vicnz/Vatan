import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';

class FadeElement extends HookWidget {
  const FadeElement({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    final AnimationController _animationController = useAnimationController(
      duration: const Duration(seconds: 1),
    );
    final Animation<double> _valueAnim =
        Tween<double>(begin: -1.0, end: 1.0).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );
    useEffect(() {
      _animationController.forward();
    });

    return FadeTransition(
      opacity: _valueAnim,
      child: child,
    );
  }
}

class SlideFrom extends HookWidget {
  const SlideFrom(
      {Key? key,
      required this.child,
      required this.offset,
      required this.duration})
      : super(key: key);
  final Widget child;
  final Offset offset;
  final Duration duration;
  @override
  Widget build(BuildContext context) {
    AnimationController _animationController = useAnimationController(
      duration: duration,
      reverseDuration: const Duration(milliseconds: 100),
    );
    Animation<Offset> _offset = Tween<Offset>(
      begin: offset,
      end: const Offset(0, 0),
    ).animate(
      CurvedAnimation(
        parent: _animationController,
        curve: Curves.fastLinearToSlowEaseIn,
      ),
    );

    useEffect(() {
      _animationController.forward();
    });
    return SlideTransition(
      position: _offset,
      child: child,
    );
  }
}
