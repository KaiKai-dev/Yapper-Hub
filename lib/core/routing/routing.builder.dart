part of routing_library;

class RoutingBuilder extends GoRoute {
  final AppScreens screen;
  final Widget child;

  RoutingBuilder({
    required this.screen,
    required this.child,
    List<RouteBase>? routes,
  }) : super(
          path: screen.path!,
          name: screen.name,
          routes: routes ?? [],
          builder: (_, _) => child,
        );

  RoutingBuilder.withTransition({
    required this.screen,
    required this.child,
    List<RouteBase>? routes,
    RouteTransition? transition,
  }) : super(
          path: screen.path!,
          name: screen.name,
          routes: routes ?? [],
          pageBuilder: (_, _) => transition == null
              ? MaterialPage(child: child)
              : RoutingTransitionDelegate.slide(child: child, transition: transition),
        );
}