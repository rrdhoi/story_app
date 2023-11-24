import 'package:flutter/material.dart';

class AppRouteTransitions {
  static SlideTransition slideTransition({
    required Animation<double> animation,
    required Widget child,
  }) =>
      SlideTransition(
        position: Tween<Offset>(
          begin: const Offset(0.0, -1.0),
          end: Offset.zero,
        ).animate(animation),
        child: child,
      );
}
