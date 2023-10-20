class BaseAPI {
  static const String base = "http://85.113.29.26:8080";
  static const String api = "$base/api/v1";

  /// Auth
  static const String authPath = "$api/auth";
  static const String register = "$authPath/register";
  static const String authenticate = "$authPath/authenticate";

  /// User
  static const String userPath = "$api/user";
  static const String getUser = "$userPath/profile";
  static const String editUser = "$userPath/profile/";
  static const String userPhoto = "$userPath/photo/";

  /// Headers
  static const Map<String, String> headers = {
    "Content-Type": "application/json; charset=UTF-8"
  };
}

// post
// http://85.113.29.26:8080/api/v1/auth/register
// http://85.113.29.26:8080/api/v1/auth/authenticate

// get
// http://85.113.29.26:8080/api/v1/user
