enum AppScreens {
  splash,
  welcome,


  // Auth Screens
  login,
  signUp,
  signupName,
  signupBirthday,
  signupCredentials,
  
  test;

  String? get pageName => _pageNames[this];

  String? get path => _paths[this];
}

final Map<AppScreens, String> _pageNames = {
  AppScreens.splash: "SplashScreen",
  AppScreens.welcome: "WelcomeScreen",
  AppScreens.login: "LoginScreen",
  AppScreens.signUp: "SignUpScreen",
  AppScreens.signupName: "SignupNameScreen",
  AppScreens.signupBirthday: "SignupBirthdayScreen",
  AppScreens.signupCredentials: "SignupCredentialsScreen"
  
};

final Map<AppScreens, String> _paths = {
  AppScreens.splash: "/",
  AppScreens.welcome: "/welcome",
  AppScreens.login: "/login",
  AppScreens.signUp: "/signup",
  AppScreens.signupName: "/signup/name",
  AppScreens.signupBirthday: "/signup/birthday",
  AppScreens.signupCredentials: "/signup/credentials"
  
};
