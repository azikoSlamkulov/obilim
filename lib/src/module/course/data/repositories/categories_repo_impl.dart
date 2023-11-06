import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:obilim/src/core/error/error.dart';
import 'package:obilim/src/module/course/data/datasources/remote_categories_data.dart';
import 'package:obilim/src/module/course/domain/entities/category_entity.dart';
import 'package:obilim/src/module/course/domain/entities/subcategory_entity.dart';
import 'package:obilim/src/module/course/domain/repositories/categories_repo.dart';

class CategoriesRepoImpl implements CategoriesRepo {
  CategoriesRepoImpl({
    //required this.localAuth,
    required this.remoteCategories,
  });

  //final LocalAuthData localAuth;
  final RemoteCategoriesData remoteCategories;

  @override
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories({
    required String token,
  }) async {
    try {
      final allCategories = await remoteCategories.getAllCategories(
        token: token,
      );

      return Right(allCategories);
    } on ServerException {
      return Left(ServerFailure());
    }
  }

  @override
  Future<Either<Failure, List<SubCategoryEntity>>> getAllSubCategories({
    required String token,
    required int categoryId,
  }) async {
    try {
      final subCategory = await remoteCategories.getAllSubCategories(
        token: token,
        categoryId: categoryId,
      );

      return Right(subCategory);
    } on ServerException {
      return Left(ServerFailure());
    }
  }
}
