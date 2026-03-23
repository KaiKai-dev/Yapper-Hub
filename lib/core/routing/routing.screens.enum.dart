enum AppScreens {
  splash,
  welcome,


  // Auth Screens
  login,
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
  AppScreens.signupName: "SignupNameScreen",
  AppScreens.signupBirthday: "SignupBirthdayScreen",
  AppScreens.signupCredentials: "SignupCredentialsScreen"
  
};

final Map<AppScreens, String> _paths = {
  AppScreens.splash: "/",
  AppScreens.welcome: "/welcome",
  AppScreens.login: "/login",
  AppScreens.signupName: "/signup/name",
  AppScreens.signupBirthday: "/signup/birthday",
  AppScreens.signupCredentials: "/signup/credentials"
  
};
