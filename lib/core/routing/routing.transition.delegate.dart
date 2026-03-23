import 'package:chat_app/core/routing/routing.transition.enum.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class RoutingTransitionDelegate<T> extends CustomTransitionPage<T> {
  final RouteTransition transition;
  final Curve? curve;
  
  RoutingTransitionDelegate.slide({
    super.key,
    required super.child,
    required this.transition,
    this.curve = Curves.easeInOut
  }) : super(
    transitionsBuilder:(context, animation, secondaryAnimation, child){
        final tween = Tween(begin: transition.start, end: Offset.zero).chain(CurveTween(curve: curve!));

        return SlideTransition(
          position: animation.drive(tween),
          child: child,
        );
      }
  );
}