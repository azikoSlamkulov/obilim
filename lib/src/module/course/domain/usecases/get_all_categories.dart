import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:obilim/src/module/course/domain/entities/category_entity.dart';
import 'package:obilim/src/module/course/domain/repositories/categories_repo.dart';

import '../../../../core/error/error.dart';
import '../../../../core/usecases/usecase.dart';

class GetAllCategories
    extends UseCase<List<CategoryEntity>, GetAllCategoriesParams> {
  final CategoriesRepo categoriesRepo;
  GetAllCategories(this.categoriesRepo);

  @override
  Future<Either<Failure, List<CategoryEntity>>> call(
      GetAllCategoriesParams params) async {
    return await categoriesRepo.getAllCategories(
      token: params.token,
    );
  }
}

class GetAllCategoriesParams extends Equatable {
  final String token;

  const GetAllCategoriesParams({required this.token});

  @override
  List<Object?> get props => [token];
}
