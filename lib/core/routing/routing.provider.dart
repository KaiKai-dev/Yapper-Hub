import 'package:chat_app/core/routing/routing.screens.enum.dart';
import 'package:chat_app/core/routing/routing.transition.delegate.dart';
import 'package:chat_app/core/routing/routing.transition.enum.dart';
import 'package:chat_app/features/auth/presentation/pages/login.page.dart';
import 'package:chat_app/features/auth/presentation/pages/signup.page.dart';
import 'package:chat_app/features/splash/presentation/pages/splash.page.dart';
import 'package:chat_app/features/splash/presentation/pages/welcome.page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:riverpod/legacy.dart';

final GlobalKey<NavigatorState> navigatorState = GlobalKey<NavigatorState>();

final routingProvider = StateProvider<GoRouter>((Ref ref) {
  return GoRouter(
    routes: [
      GoRoute(
        path: AppScreens.splash.path!,
        name: AppScreens.splash.pageName,
        builder: (context, state) => SplashScreen(),
      ),
      GoRoute(
        path: AppScreens.welcome.path!,
        name: AppScreens.welcome.pageName,
        builder: (_, _) => WelcomeScreen()

      ),

      /// AuthRoutes
      GoRoute(
        path: AppScreens.login.path!,
        name: AppScreens.login.pageName,
        builder: (_, _) => LoginScreen()

      ),

      GoRoute(
        path: AppScreens.signUp.path!,
        name: AppScreens.signUp.pageName,
        pageBuilder: (_, _) => RoutingTransitionDelegate.slide(
          child: SignupScreen(), 
          transition: RouteTransition.fromRight,
        )
      ),

      
    ]
  );
});