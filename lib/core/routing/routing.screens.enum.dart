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
  chats,
  people,
  menu,
  account,
  
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

  AppScreens.home               : "HomeScreen",
  AppScreens.chats              : "ChatsScreen",
  AppScreens.people             : "PeopleScreen",
  AppScreens.menu               : "MenuScreen",
  AppScreens.account            : "AccountScreen",
  
};

final Map<AppScreens, String> _paths = {
  AppScreens.splash             : "/",
  AppScreens.welcome            : "/welcome",
  AppScreens.login              : "/login",
  AppScreens.signup             : "/signup",
  AppScreens.signupProcessing   : "/signup/processing",
  AppScreens.signupSuccess      : "/signup/success",
  AppScreens.signupError        : "/signup/error",

  AppScreens.home               : "/main",
  AppScreens.chats              : "/main/chats",
  AppScreens.people             : "/main/people",
  AppScreens.menu               : '/main/menu',
  AppScreens.account            : "/main/account",
  
};
