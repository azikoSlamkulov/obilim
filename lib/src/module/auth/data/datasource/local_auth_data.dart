import 'dart:convert';

import '../../../../core/data/local/sharedpreferences/local_storage.dart';
import '../../../../util/app_constants/app_constants.dart';
import '../model/token_model.dart';

abstract class LocalAuthData {
  Future<bool>? addTokenToCache(AuthUserModel token);
  AuthUserModel? getTokenFromCache();
  Future<bool?> clearCache();
}

class AuthSharedPreferencesImpl implements LocalAuthData {
  final SharedPreferencesDB authPreferences;
  AuthSharedPreferencesImpl({required this.authPreferences});

  @override
  Future<bool>? addTokenToCache(AuthUserModel token) async {
    final tokenModel = json.encode(token.toJson());
    return await authPreferences.setString(
        key: AppTexts.tokenToCacheKey, value: tokenModel)!;
  }

  @override
  AuthUserModel? getTokenFromCache() {
    final tokenModel = authPreferences.getString(key: AppTexts.tokenToCacheKey);
    if (tokenModel == null) {
      return null;
    }
    return AuthUserModel.fromJson(json.decode(tokenModel));
  }

  @override
  Future<bool?> clearCache() async {
    return await authPreferences.remove(key: AppTexts.tokenToCacheKey);
  }
}
