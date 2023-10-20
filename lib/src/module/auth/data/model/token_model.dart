import 'dart:convert';

import '../../domain/entities/token_entity.dart';

AuthUserModel tokenFromJson(String str) => AuthUserModel.fromJson(
      json.decode(str) as Map<String, dynamic>,
    );

String tokenToJson(AuthUserModel data) => json.encode(data.toJson());

class AuthUserModel extends TokenEntity {
  const AuthUserModel({
    token,
    //user,
  }) : super(
          token: token,
          //user: user,
        );

  factory AuthUserModel.fromJson(Map<String, dynamic> json) => AuthUserModel(
        token: json['token'] as String,
        //user: json['user'] as String,
      );

  Map<String, dynamic> toJson() => {
        "token": token,
        //"user": user,
      };
}
