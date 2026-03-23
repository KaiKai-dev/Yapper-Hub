import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

enum RouteTransition {
  up, down, left , right;

  Offset get start => switch(this){
    up => Offset(0,1), 
    down => Offset(0, -1),
    left => Offset(-1, 0),
    right => Offset(1, 0)
  };

  Page<dynamic> builder({
    required GoRouterState state,
    required Widget child,
    Curve curve = Curves.easeInOut
  }) {
    return CustomTransitionPage(
      child: child, 
      transitionsBuilder: (context, animation, secondaryAnimation, child){
        final tween = Tween(begin: start, end: Offset.zero).chain(CurveTween(curve: curve));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }
    );

    
  }
}