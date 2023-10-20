import 'dart:convert';

import '../../domain/entities/user_entity.dart';

UserModel userFromJson(String str) => UserModel.fromJson(
      json.decode(str) as Map<String, dynamic>,
    );

List<UserModel> userListFromJson(String str) {
  final users = json.decode(str);
  return (users as List).map((user) => UserModel.fromJson(user)).toList();
}

String userToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends UserEntity {
  const UserModel({
    id,
    username,
    email,
    firstName,
    lastName,
    phoneNumber,
    birthDate,
    type,
    userPhoto,
  }) : super(
          id: id,
          username: username,
          email: email,
          firstName: firstName,
          lastName: lastName,
          phoneNumber: phoneNumber,
          birthDate: birthDate,
          type: type,
          userPhoto: userPhoto,
        );

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json['id'] as int,
        username: json['username'] as String,
        email: json['email'] as String,
        firstName: json['firstName'] as String,
        lastName: json['lastName'] as String,
        phoneNumber: json['phoneNumber'],
        birthDate: json['birthDate'],
        type: json['type'] as String,
        userPhoto: json['userPhoto'],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "username": username ?? '',
        "email": email ?? '',
        "firstName": firstName ?? '',
        "lastName": lastName ?? '',
        "phoneNumber": phoneNumber ?? '',
        "birthDate": birthDate ?? '',
        "type": type ?? '',
        "userPhoto": userPhoto ?? '',
      };

  // factory UserModel.fromCacheJson(Map<String, dynamic> json) => UserModel(
  //       userID: json['userID'] as String,
  //       name: json['name'] as String,
  //       phoneNumber: json['phoneNumber'] as String,
  //       email: json['email'] as String,
  //       photoURL: json['photoURL'] as String,
  //       role: json['role'] as String,
  //     );

  // Map<String, dynamic> toCacheJson() => {
  //       "userID": userID,
  //       "name": name ?? '',
  //       "phoneNumber": phoneNumber ?? '',
  //       "email": email ?? '',
  //       "photoURL": photoURL ?? '',
  //       "role": role ?? '',
  //     };
}
