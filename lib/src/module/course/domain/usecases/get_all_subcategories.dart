import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:obilim/src/module/course/domain/entities/subcategory_entity.dart';
import 'package:obilim/src/module/course/domain/repositories/categories_repo.dart';

import '../../../../core/error/error.dart';
import '../../../../core/usecases/usecase.dart';

class GetAllSubCategories
    extends UseCase<List<SubCategoryEntity>, GetAllSubCategoriesParams> {
  final CategoriesRepo categoriesRepo;
  GetAllSubCategories(this.categoriesRepo);

  @override
  Future<Either<Failure, List<SubCategoryEntity>>> call(
      GetAllSubCategoriesParams params) async {
    return await categoriesRepo.getAllSubCategories(
      token: params.token,
      categoryId: params.categoryId,
    );
  }
}

class GetAllSubCategoriesParams extends Equatable {
  final String token;
  final int categoryId;

  const GetAllSubCategoriesParams({
    required this.token,
    required this.categoryId,
  });

  @override
  List<Object?> get props => [token, categoryId];
}
