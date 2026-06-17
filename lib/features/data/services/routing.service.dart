import 'package:chat_app/core/routing/routing.library.dart';
import 'package:chat_app/core/routing/routing.screens.enum.dart';
import 'package:go_router/go_router.dart';

class RoutingService {
  RoutingService._();
  static final instance = RoutingService._();

  late final GoRouter _router;
  GoRouter get router => _router;

  void init() {
    _router = routingConfig;
  }

  void pushNamed(AppScreens route, {
    Map<String, dynamic>? data,
  }) {
    router.pushNamed(route.name, queryParameters: data ?? {});
  }
}
