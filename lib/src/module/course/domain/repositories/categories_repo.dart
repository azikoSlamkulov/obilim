import 'package:dartz/dartz.dart';
import 'package:obilim/src/module/course/domain/entities/category_entity.dart';
import 'package:obilim/src/module/course/domain/entities/subcategory_entity.dart';

import '../../../../core/error/error.dart';

abstract class CategoriesRepo {
  Future<Either<Failure, List<CategoryEntity>>> getAllCategories({
    required String token,
  });
  Future<Either<Failure, List<SubCategoryEntity>>> getAllSubCategories({
    required String token,
    required int categoryId,
  });
}
