enum AppScreens {
  splash,
  welcome,


  // Auth Screens
  login,
  signup,
  signupProcessing,
  signupSuccess,
  signupError,

  // Main Screens
  home,
  
  test;

  String? get pageName => _pageNames[this];

  String? get path => _paths[this];
}

final Map<AppScreens, String> _pageNames = {
  AppScreens.splash             : "SplashScreen",
  AppScreens.welcome            : "WelcomeScreen",
  AppScreens.login              : "LoginScreen",
  AppScreens.signup             : "SignUpScreen",
  AppScreens.signupProcessing   : "SignupProcessingScreen",
  AppScreens.signupSuccess      : "SignupSuccessScreen",
  AppScreens.signupError        : "SignupErrorScreen",

  AppScreens.home               : "MainChatScreen",
  
};

final Map<AppScreens, String> _paths = {
  AppScreens.splash             : "/",
  AppScreens.welcome            : "/welcome",
  AppScreens.login              : "/login",
  AppScreens.signup             : "/signup",
  AppScreens.signupProcessing   : "/signup/processing",
  AppScreens.signupSuccess      : "/signup/success",
  AppScreens.signupError        : "/signup/error",

  AppScreens.home               : "/main"
  
};
