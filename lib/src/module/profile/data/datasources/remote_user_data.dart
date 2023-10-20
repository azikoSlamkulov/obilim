import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';

import '../../../../core/data/remote/api/base_api.dart';
import '../../../../core/data/remote/http/client.dart';
import '../models/image_model.dart';
import '../models/user_model.dart';
import '../models/user_photo_model.dart';

abstract class RemoteUserData {
  Future<List<UserModel>> getAllUsers({required String token});
  Future<UserModel> getUser({required String token});
  Future<UserModel> editUser({
    required String token,
    required int id,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String birthDate,
  });
  // Future<String> getUserPhoto({
  //   required String token,
  // });
  Future<UserPhotoModel> uploadUserPhoto({
    required String token,
    required int userID,
    required File file,
  });
}

class RemoteUserDataImpl implements RemoteUserData {
  RemoteUserDataImpl({required this.apiClient});

  final ApiClient apiClient;

  @override
  Future<List<UserModel>> getAllUsers({required String token}) async {
    String url = BaseAPI.userPath;
    apiClient.getToken(token: token);
    return apiClient.get(
      url,
      fromJson: userListFromJson,
    );
  }

  @override
  Future<UserModel> editUser({
    required String token,
    required int id,
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String birthDate,
  }) {
    String url = '${BaseAPI.editUser}$id';
    final data = ({
      'firstName': firstName,
      'lastName': lastName,
      'phoneNumber': phoneNumber,
      'birthDate': birthDate,
    });

    apiClient.getToken(token: token);
    return apiClient.put(
      url,
      body: data,
      fromJson: userFromJson,
    );
  }

  @override
  Future<UserModel> getUser({required String token}) async {
    String url = BaseAPI.getUser;
    apiClient.getToken(token: token);
    return apiClient.get(
      url,
      fromJson: userFromJson,
    );
  }

  // @override
  // Future<String> getUserPhoto({required String token}) {
  //   // UserPhotoModel userPhotoFromJson(String str) => UserPhotoModel.fromJson(
  //   //   json.decode(str) as Map<String, dynamic>,
  //   // );
  //   String url = BaseAPI.userPhoto;
  //   apiClient.getToken(token: token);
  //   return apiClient.get(
  //     url,
  //     fromJson: json.decode,
  //   );
  // }

  @override
  Future<UserPhotoModel> uploadUserPhoto({
    required String token,
    required int userID,
    required File file,
  }) {
    String url = BaseAPI.userPhoto;
    final data = ({
      'file': file,
      'userId': userID,
    });

    apiClient.getToken(token: token);
    // return apiClient.post(
    //   url,
    //   body: data,
    //   fromJson: userPhotoFromJson,
    // );
    return apiClient.upload(
      url,
      file: file,
      userID: userID,
      fromJson: userPhotoFromJson,
    );
  }

  // @override
  // Future<String> getUserPhoto({required String token}) {
  //   String url = BaseAPI.userPhoto;
  //   apiClient.getToken(token: token);
  //   return apiClient.download(
  //     url,
  //     //fromJson: imageFromJson,
  //   );
  // }
}
