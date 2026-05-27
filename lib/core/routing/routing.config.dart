part of routing_library;

final GlobalKey<NavigatorState> navigatorState = GlobalKey<NavigatorState>();

final GoRouter routingProvider = GoRouter(
  routes: [
    RoutingBuilder(screen: AppScreens.splash, child: SplashScreen()),
    RoutingBuilder(screen: AppScreens.welcome, child: WelcomeScreen()),

    /// AuthRoutes
    RoutingBuilder(screen: AppScreens.login, child: LoginScreen()),
    RoutingBuilder.withTransition(
      screen: AppScreens.signUp,
      child: SignupScreen(),
      transition: RouteTransition.fromRight,
      routes: [
        RoutingBuilder.withTransition(
          screen: AppScreens.signupSuccess,
          child: SignupResultSuccessScreen(),
          transition: RouteTransition.fromRight,
        ),
      ],
    ),
  ],
);
