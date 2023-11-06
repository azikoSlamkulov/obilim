import 'package:obilim/src/module/course/data/models/category_model.dart';
import 'package:obilim/src/module/course/data/models/subcategory_model.dart';

import '../../../../core/data/remote/api/base_api.dart';
import '../../../../core/data/remote/http/client.dart';

abstract class RemoteCategoriesData {
  Future<List<CategoryModel>> getAllCategories({required String token});

  Future<List<SubCategoryModel>> getAllSubCategories({
    required String token,
    required int categoryId,
  });
}

class RemoteCategoriesDataImpl implements RemoteCategoriesData {
  RemoteCategoriesDataImpl({required this.apiClient});

  final ApiClient apiClient;

  @override
  Future<List<CategoryModel>> getAllCategories({required String token}) async {
    String url = BaseAPI.categoryList;
    apiClient.getToken(token: token);
    return apiClient.get(
      url,
      fromJson: categoriesListFromJson,
    );
  }

  @override
  Future<List<SubCategoryModel>> getAllSubCategories({
    required String token,
    required int categoryId,
  }) {
    String url = '${BaseAPI.subCategoryList}$categoryId';
    apiClient.getToken(token: token);
    return apiClient.get(
      url,
      fromJson: subCategoriesListFromJson,
    );
  }
}
