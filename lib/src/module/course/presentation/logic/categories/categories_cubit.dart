import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:obilim/src/core/error/error.dart';
import 'package:obilim/src/module/course/domain/entities/category_entity.dart';
import 'package:obilim/src/module/course/domain/entities/subcategory_entity.dart';
import 'package:obilim/src/module/course/domain/usecases/get_all_categories.dart';
import 'package:obilim/src/module/course/domain/usecases/get_all_subcategories.dart';

part 'categories_state.dart';

const SERVER_FAILURE_MESSAGE = 'Server Failure';
const CACHED_FAILURE_MESSAGE = 'Cache Failure';

class CategoriesCubit extends Cubit<CategoriesState> {
  final GetAllCategories getAllCategories;
  final GetAllSubCategories getAllSubCategories;
  CategoriesCubit({
    required this.getAllCategories,
    required this.getAllSubCategories,
  }) : super(CategoriesLoading());

  void getCategoriesList({required String token}) async {
    final categoriesList = await getAllCategories.call(
      GetAllCategoriesParams(
        token: token,
      ),
    );
    categoriesList.fold(
      (error) => emit(CategoriesFailure(message: _mapFailureToMessage(error))),
      (categories) {
        emit(AllCategoriesLoaded(categories));
      },
    );
  }

  void getSubCategoriesList(
      {required String token, required int categoryId}) async {
    final subCategoriesList = await getAllSubCategories.call(
      GetAllSubCategoriesParams(
        token: token,
        categoryId: categoryId,
      ),
    );
    subCategoriesList.fold(
      (error) => emit(CategoriesFailure(message: _mapFailureToMessage(error))),
      (subCategories) {
        emit(AllSubCategoriesLoaded(subCategories));
      },
    );
  }

  String _mapFailureToMessage(Failure failure) {
    switch (failure.runtimeType) {
      case ServerFailure:
        return SERVER_FAILURE_MESSAGE;
      case CacheFailure:
        return CACHED_FAILURE_MESSAGE;
      default:
        return 'Unexpected Error';
    }
  }
}
