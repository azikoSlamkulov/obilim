part of 'categories_cubit.dart';

sealed class CategoriesState extends Equatable {
  const CategoriesState();

  @override
  List<Object> get props => [];
}

final class CategoriesInitial extends CategoriesState {}

final class CategoriesLoading extends CategoriesState {}

final class AllCategoriesLoaded extends CategoriesState {
  final List<CategoryEntity> categoriesList;

  const AllCategoriesLoaded(this.categoriesList);

  @override
  List<Object> get props => [categoriesList];
}

final class AllSubCategoriesLoaded extends CategoriesState {
  final List<SubCategoryEntity> subCategoriesList;

  const AllSubCategoriesLoaded(this.subCategoriesList);

  @override
  List<Object> get props => [subCategoriesList];
}

final class CategoriesFailure extends CategoriesState {
  final String message;

  const CategoriesFailure({required this.message});

  @override
  List<Object> get props => [message];
}
