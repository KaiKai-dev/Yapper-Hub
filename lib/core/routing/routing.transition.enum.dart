part of routing_library;

enum RouteTransition {
  fromUp, fromDown, fromLeft , fromRight;

  Offset get start => switch(this){
    fromUp => Offset(0,-1), 
    fromDown => Offset(0, 1),
    fromLeft => Offset(-1, 0),
    fromRight => Offset(1, 0)
  };
}