import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obilim/src/config/drawer.dart';
import 'package:obilim/src/config/locator.dart';
import 'package:obilim/src/module/auth/presentation/logic/auth/auth_bloc.dart';
import 'package:obilim/src/module/course/domain/entities/subcategory_entity.dart';
import 'package:obilim/src/module/course/presentation/logic/categories/categories_cubit.dart';
import 'package:obilim/src/module/course/presentation/widgets/categories_card_widget.dart';

class SubCategoriesView extends StatelessWidget {
  const SubCategoriesView({
    required this.categoryId,
    Key? key,
  }) : super(key: key);

  final String categoryId;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthenticatedState) {
          final token = state.token;
          int id = int.parse(categoryId);
          return BlocProvider<CategoriesCubit>(
            create: (context) => sl<CategoriesCubit>()
              ..getSubCategoriesList(
                token: token,
                categoryId: id,
              ),
            child: BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                if (state is AllSubCategoriesLoaded) {
                  return NestedSubCategoriesView(
                    subCategoriesList: state.subCategoriesList,
                    token: token,
                  );
                } else if (state is CategoriesFailure) {
                  return Text(state.message);
                }

                return const Text('SomeError');
              },
            ),
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}

class NestedSubCategoriesView extends StatelessWidget {
  const NestedSubCategoriesView({
    required this.subCategoriesList,
    required this.token,
    super.key,
  });

  final List<SubCategoryEntity> subCategoriesList;
  final String token;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      endDrawer: const MainDrawer(),
      appBar: AppBar(
        title: const Text('Catalog'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: REdgeInsets.all(10.0),
          child: ListView.builder(
            itemCount: subCategoriesList.length,
            itemBuilder: (BuildContext context, int index) {
              final subCategory = subCategoriesList[index];
              return CategoriesCardWidget(
                onTap: () {},
                imageUrl: subCategory.imageUrl!,
                token: token,
                name: subCategory.name!,
              );
            },
          ),
        ),
      ),
    );
  }
}
