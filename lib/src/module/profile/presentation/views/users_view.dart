import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obilim/src/module/auth/presentation/logic/auth/auth_bloc.dart';
import 'package:obilim/src/util/app_constants/app_constants.dart';

import '../../../../../locator.dart';
import '../../../auth/presentation/views/sign_in_view.dart';
import '../../domain/entities/user_entity.dart';
import '../logic/user/user_cubit.dart';

class UsersView extends StatelessWidget {
  const UsersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<AuthBloc, AuthState>(
      builder: (context, state) {
        if (state is AuthenticatedState) {
          final token = state.token;
          return BlocProvider<UserCubit>(
            create: (context) => sl<UserCubit>()..getUsers(token: token),
            child: BlocBuilder<UserCubit, UserState>(
              builder: (context, state) {
                if (state is UserLoading) {
                  return const Center(child: CircularProgressIndicator());
                } else if (state is AllUsersLoaded) {
                  return NestedUsersView(
                    allUsers: state.allUsers,
                  );
                } else if (state is UserFailure) {
                  //return MyErrorWidget('${state.exception}');
                  return Text(state.message);
                } else {
                  //return const SomeError();,
                  return Text('');
                }
              },
            ),
          );
        }
        //TODO:
        return SignInView();
      },
    );
  }
}

class NestedUsersView extends StatelessWidget {
  const NestedUsersView({
    required this.allUsers,
    super.key,
  });

  final List<UserEntity> allUsers;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Users List View'),
      ),
      body: Center(
        child: allUsers.isNotEmpty
            ? ListView.separated(
                padding: REdgeInsets.all(14),
                itemCount: allUsers.length,
                //itemExtent: 155.h,
                itemBuilder: (context, index) {
                  final user = allUsers[index];
                  return Text(
                    user.firstName!,
                    style: AppTextStyles.black14,
                  );
                },
                separatorBuilder: (context, index) => const Divider(
                  color: Colors.red,
                ),
              )
            : Align(
                alignment: Alignment.center,
                child: Text(
                  'Список пуст!',
                  style: AppTextStyles.grey16,
                ),
              ),
      ),
    );
  }
}
