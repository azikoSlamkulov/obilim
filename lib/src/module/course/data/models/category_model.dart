import 'dart:convert';

import 'package:obilim/src/module/course/domain/entities/category_entity.dart';

CategoryModel categoryFromJson(String str) => CategoryModel.fromJson(
      json.decode(str) as Map<String, dynamic>,
    );

List<CategoryModel> categoriesListFromJson(String str) {
  final categories = json.decode(str);
  return (categories as List)
      .map((category) => CategoryModel.fromJson(category))
      .toList();
}

String categoryToJson(CategoryModel data) => json.encode(data.toJson());

class CategoryModel extends CategoryEntity {
  const CategoryModel({
    id,
    name,
    isActive,
    imageUrl,
  }) : super(
          id: id,
          name: name,
          isActive: isActive,
          imageUrl: imageUrl,
        );

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        id: json['id'] as int,
        name: json['name'] as String,
        isActive: json['isActive'] as bool,
        imageUrl: json['imageUrl'] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "name": name ?? '',
        "isActive": isActive ?? '',
        "imageUrl": imageUrl ?? '',
      };
}
