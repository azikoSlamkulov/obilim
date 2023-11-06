import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:obilim/src/config/locator.dart';
import 'package:obilim/src/config/routes/router_utils.dart';
import 'package:obilim/src/module/auth/presentation/logic/auth/auth_bloc.dart';
import 'package:obilim/src/module/course/domain/entities/category_entity.dart';
import 'package:obilim/src/module/course/presentation/logic/categories/categories_cubit.dart';
import 'package:obilim/src/module/course/presentation/widgets/categories_card_widget.dart';

import '../../../../config/drawer.dart';

class CategoriesView extends StatelessWidget {
  const CategoriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthenticatedState) {
          final token = state.token;
          return BlocProvider<CategoriesCubit>(
            create: (context) =>
                sl<CategoriesCubit>()..getCategoriesList(token: token),
            child: BlocBuilder<CategoriesCubit, CategoriesState>(
              builder: (context, state) {
                if (state is AllCategoriesLoaded) {
                  return NestedCategoriesView(
                    categoriesList: state.categoriesList,
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

class NestedCategoriesView extends StatelessWidget {
  const NestedCategoriesView({
    required this.categoriesList,
    required this.token,
    super.key,
  });

  final List<CategoryEntity> categoriesList;
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
            itemCount: categoriesList.length,
            itemBuilder: (BuildContext context, int index) {
              final category = categoriesList[index];
              return CategoriesCardWidget(
                onTap: () {
                  context.goNamed(
                    AppPage.subCategoriesList.toName,
                    pathParameters: {
                      'categoryId': category.id.toString(),
                    },
                  );
                },
                imageUrl: category.imageUrl!,
                token: token,
                name: category.name!,
              );
            },
          ),
        ),
      ),
    );
  }
}
