class ApiPath {
  static ApiPath? _instance;

  late _AuthApi authAPi;
  late _ProductApi cartApi;
  late _ProfileApi profileAPi;

  ApiPath._() {
    authAPi = _AuthApi();
    cartApi = _ProductApi();
    profileAPi = _ProfileApi();
  }

  factory ApiPath() => _instance ??= ApiPath._();

  final baseUrl = 'https://westmarket.herokuapp.com/api/v1/';
}

class _AuthApi {
  String get register => "user/register";
  String get verifyOtp => "user/verify-email";
  String get signIn => "user/login";
  String get requestResetPassword => "user/password-reset-request";
  String get resetPassword => "user/reset-password";
  String get profileName => "me/username";
}

class _ProductApi {
  String get cart => "user/cart/add-item";
  String get addCart => "auth/signin";
  String get checkOut => "user/cart/checkout";
}

class _ProfileApi {
  String get fundWallet => "user/wallet/62b8c3a6c4129240dad01555/recharge";
}
