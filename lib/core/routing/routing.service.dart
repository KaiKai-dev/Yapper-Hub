part of routing_library;

class RoutingService {
  RoutingService._();
  static final instance = RoutingService._();

  late final GoRouter _router;
  GoRouter get router => _router;

  void init() {
    _router = routingProvider;
  }
}
