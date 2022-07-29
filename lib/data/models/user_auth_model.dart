class UserAuth {
  static String? userToken;
  static String? userId;

  String? get getUserToken => userToken;
  set setUserToken(String? token) => userToken = token;

  String? get getUserId => userId;
  set setUserId(String? id) => userId = id;
}
