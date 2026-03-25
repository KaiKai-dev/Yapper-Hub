import 'package:flutter/material.dart';

enum RouteTransition {
  up, down, left , right;

  Offset get start => switch(this){
    up => Offset(0,1), 
    down => Offset(0, -1),
    left => Offset(-1, 0),
    right => Offset(1, 0)
  };
}