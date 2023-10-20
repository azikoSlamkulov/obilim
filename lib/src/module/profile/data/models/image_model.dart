import 'dart:convert';

import 'package:flutter/material.dart';

import '../../domain/entities/image_entity.dart';

ImageModel imageFromJson(String str) => ImageModel.fromJson(
      json.decode(str) as Map<String, dynamic>,
    );

List<ImageModel> imageListFromJson(String str) {
  final users = json.decode(str);
  return (users as List).map((user) => ImageModel.fromJson(user)).toList();
}

String imageToJson(ImageModel data) => json.encode(data.toJson());

class ImageModel extends ImageEntity {
  const ImageModel({
    image,
  }) : super(
          image: image,
        );

  factory ImageModel.fromJson(Map<String, dynamic> json) => ImageModel(
        image: json['image'] as Image,
      );

  Map<String, dynamic> toJson() => {
        "image": image,
      };
}
