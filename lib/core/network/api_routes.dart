class ApiRoutes {
  static const signup = '/auth/signup';
  static const login = '/auth/login';
  static const verifyLogin = '/auth/verify-me';
  static const logout = '/auth/logout';

  static const fetchConversations = '/conversations';

  static String getProfile({int? id}) => switch(id != null) {
    true => '/profile/$id',
    false => '/profile/all',
  };

  List<String> get nonTokenRequests => [
    signup, login,
  ];

  
}
