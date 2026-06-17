part of routing_library;

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