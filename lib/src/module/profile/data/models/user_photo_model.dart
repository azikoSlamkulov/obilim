import 'dart:convert';

import '../../domain/entities/user_photo_entity.dart';

UserPhotoModel userPhotoFromJson(String str) => UserPhotoModel.fromJson(
      json.decode(str) as Map<String, dynamic>,
    );

List<UserPhotoModel> userPhotoListFromJson(String str) {
  final users = json.decode(str);
  return (users as List).map((user) => UserPhotoModel.fromJson(user)).toList();
}

String userPhotoToJson(UserPhotoModel data) => json.encode(data.toJson());

class UserPhotoModel extends UserPhotoEntity {
  const UserPhotoModel({
    id,
    uuid,
    filename,
    filePath,
    createdBy,
    createdDate,
    lastModifiedBy,
    lastModifiedDate,
    type,
  }) : super(
          id: id,
          uuid: uuid,
          filename: filename,
          filePath: filePath,
          createdBy: createdBy,
          createdDate: createdDate,
          lastModifiedBy: lastModifiedBy,
          lastModifiedDate: lastModifiedDate,
          type: type,
        );

  factory UserPhotoModel.fromJson(Map<String, dynamic> json) => UserPhotoModel(
        id: json['id'] as int,
        uuid: json['uuid'] as String,
        filename: json['filename'],
        filePath: json['filePath'] as String,
        createdBy: json['createdBy'] as String,
        createdDate: json['createdDate'],
        lastModifiedBy: json['lastModifiedBy'],
        lastModifiedDate: json['lastModifiedDate'],
        type: json['type'] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "uuid": uuid ?? '',
        "filename": filename ?? '',
        "filePath": filePath ?? '',
        "createdBy": createdBy ?? '',
        "createdDate": createdDate ?? '',
        "lastModifiedBy": lastModifiedBy ?? '',
        "lastModifiedDate": lastModifiedDate ?? '',
        "type": type ?? '',
      };
}
