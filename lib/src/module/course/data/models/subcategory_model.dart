import 'dart:convert';

import 'package:obilim/src/module/course/domain/entities/category_entity.dart';
import 'package:obilim/src/module/course/domain/entities/subcategory_entity.dart';

SubCategoryModel subCategoryFromJson(String str) => SubCategoryModel.fromJson(
      json.decode(str) as Map<String, dynamic>,
    );

List<SubCategoryModel> subCategoriesListFromJson(String str) {
  final subCategories = json.decode(str);
  return (subCategories as List)
      .map((subCategory) => SubCategoryModel.fromJson(subCategory))
      .toList();
}

String subCategoryToJson(SubCategoryModel data) => json.encode(data.toJson());

class SubCategoryModel extends SubCategoryEntity {
  const SubCategoryModel({
    id,
    categoryId,
    name,
    description,
    isActive,
    imageUrl,
  }) : super(
          id: id,
          categoryId: categoryId,
          name: name,
          description: description,
          isActive: isActive,
          imageUrl: imageUrl,
        );

  factory SubCategoryModel.fromJson(Map<String, dynamic> json) =>
      SubCategoryModel(
        id: json['id'] as int,
        categoryId: json['categoryId'] as int,
        name: json['name'] as String,
        description: json['description'] as String,
        isActive: json['isActive'] as bool,
        imageUrl: json['imageUrl'] as String,
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "categoryId": categoryId ?? '',
        "name": name ?? '',
        "description": description ?? '',
        "isActive": isActive ?? '',
        "imageUrl": imageUrl ?? '',
      };
}
