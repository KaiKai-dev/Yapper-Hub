import 'package:chat_app/core/routing/routing.screens.enum.dart';
import 'package:chat_app/core/routing/routing.transition.delegate.dart';
import 'package:chat_app/core/routing/routing.transition.enum.dart';
import 'package:chat_app/features/presentation/pages/login.screen.dart';
import 'package:chat_app/features/presentation/pages/sign_up/sign_up.birthday.screen.dart';
import 'package:chat_app/features/presentation/pages/sign_up/sign_up.name.screen.dart';
import 'package:chat_app/features/presentation/pages/sign_up/sign_up.shell.dart';
import 'package:chat_app/features/presentation/pages/splash.screen.dart';
import 'package:chat_app/features/presentation/pages/welcome.screen.dart';
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
      ShellRoute(
        navigatorKey: navigatorState,
        builder: (context, state, child) => SignupShell(
          state: state,
          child: child,
        ),
        routes: [
          GoRoute(
            path: AppScreens.signupName.path!,
            name: AppScreens.signupName.pageName,
            pageBuilder: (context, state) => RoutingTransitionDelegate.slide(
              child: SignupNameScreen(), 
              transition: RouteTransition.right,
            ),
          ),
          GoRoute(
            path: AppScreens.signupBirthday.path!,
            name: AppScreens.signupBirthday.pageName,
            pageBuilder: (context, state) => RoutingTransitionDelegate.slide(
              child: SignupBirthdayScreen(), 
              transition: RouteTransition.right
            ),
          ),
          GoRoute(
            path: AppScreens.signupCredentials.path!,
            name: AppScreens.signupCredentials.pageName,
            pageBuilder: (context, state) => RoutingTransitionDelegate.slide(
              child: SignupBirthdayScreen(), 
              transition: RouteTransition.right
            ),
          ),
        ],
      )
    ]
  );
});