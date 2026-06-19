part of routing_library;

final GlobalKey<NavigatorState> navigatorState = GlobalKey<NavigatorState>();

final GoRouter routingConfig = GoRouter(
  routes: [
    AppRoute(screen: AppScreens.splash, child: SplashScreen()),
    AppRoute(screen: AppScreens.welcome, child: WelcomeScreen()),

    /// AuthRoutes
    AppRoute(screen: AppScreens.login, child: LoginScreen()),
    AppRoute.withTransition(
      screen: AppScreens.signup,
      child: SignupScreen(),
      transition: RouteTransition.fromRight,
      routes: [
        AppRoute.withTransition(
          screen: AppScreens.signupSuccess,
          child: SignupResultSuccessScreen(),
          transition: RouteTransition.fromRight,
        ),

        AppRoute.withTransition(
          screen: AppScreens.signupError,
          child: SignupResultErrorScreen(),
          transition: RouteTransition.fromDown
        ),

        AppRoute.withTransition(
          screen: AppScreens.signupProcessing,
          child: SignupResultProcessingScreen(),
          transition: RouteTransition.fromRight
        )
      ],
    ),

    // AppRoute.withTransition(screen: AppScreens.login, child: LoginScreen())
  ],
);
