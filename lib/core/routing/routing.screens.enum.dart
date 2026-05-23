enum AppScreens {
  splash,
  welcome,


  // Auth Screens
  login,
  signUp,
  signupName,
  signupBirthday,
  signupCredentials,
  signupProcessing,
  signupSuccess,
  signupError,
  
  test;

  String? get pageName => _pageNames[this];

  String? get path => _paths[this];
}

final Map<AppScreens, String> _pageNames = {
  AppScreens.splash             : "SplashScreen",
  AppScreens.welcome            : "WelcomeScreen",
  AppScreens.login              : "LoginScreen",
  AppScreens.signUp             : "SignUpScreen",
  AppScreens.signupName         : "SignupNameScreen",
  AppScreens.signupBirthday     : "SignupBirthdayScreen",
  AppScreens.signupCredentials  : "SignupCredentialsScreen",
  AppScreens.signupProcessing   : "SignupProcessingScreen",
  AppScreens.signupSuccess      : "SignupSuccessScreen",
  AppScreens.signupError        : "SignupErrorScreen",
  
};

final Map<AppScreens, String> _paths = {
  AppScreens.splash             : "/",
  AppScreens.welcome            : "/welcome",
  AppScreens.login              : "/login",
  AppScreens.signUp             : "/signup",
  AppScreens.signupName         : "/signup/name",
  AppScreens.signupBirthday     : "/signup/birthday",
  AppScreens.signupCredentials  : "/signup/credentials",
  AppScreens.signupProcessing   : "signup/processing",
  AppScreens.signupSuccess      : "signup/success",
  AppScreens.signupError        : "signup/error",
  
};
