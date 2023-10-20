import 'dart:convert';

import '../../../../core/data/remote/api/base_api.dart';
import '../../../../core/data/remote/http/client.dart';
import '../model/token_model.dart';

abstract class RemoteAuthData {
  // Get token
  Future<AuthUserModel?> getTokenFromServer();

  // Sign Up
  Future<AuthUserModel> signUp({
    required String username,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String type,
  });

  // Sign In
  Future<AuthUserModel> signInWithEmail({
    required String userName,
    required String password,
  });

  Future<AuthUserModel> signInWithGoogle();

  Future<AuthUserModel?> signInWithFacebook();

  // Sign Out
  Future<bool> signOut();
}

/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

class RemoteAuthDataImpl implements RemoteAuthData {
  RemoteAuthDataImpl({
    required this.apiClient,
  });

  final ApiClient apiClient;

  // Get token
  @override
  Future<AuthUserModel?> getTokenFromServer() async {
    return null;
  }

  // Sign Up
  @override
  Future<AuthUserModel> signUp({
    required String username,
    required String email,
    required String password,
    required String firstName,
    required String lastName,
    required String type,
  }) async {
    String url = BaseAPI.register;
    final data = ({
      'username': username,
      'email': email,
      'password': password,
      'firstName': firstName,
      'lastName': lastName,
      'type': type,
    });
    return apiClient.post(
      url,
      body: data,
      fromJson: tokenFromJson,
    );
  }

  //String tokenFromJsonv(String str) => json.decode(str);

  // Sign In
  @override
  Future<AuthUserModel> signInWithEmail({
    required String userName,
    required String password,
  }) async {
    String url = BaseAPI.authenticate;
    final data = ({
      'username': userName,
      'password': password,
    });
    return apiClient.post(
      url,
      body: data,
      fromJson: tokenFromJson,
    );
  }

  @override
  Future<AuthUserModel?> signInWithFacebook() {
    // TODO: implement signInWithFacebook
    throw UnimplementedError();
  }

  @override
  Future<AuthUserModel> signInWithGoogle() {
    // TODO: implement signInWithGoogle
    throw UnimplementedError();
  }

  // Sign Out
  @override
  Future<bool> signOut() async {
    return true;
  }
}
