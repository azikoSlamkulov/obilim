import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obilim/src/config/theme/bloc/theme_bloc.dart';

import '../module/auth/presentation/logic/auth/auth_bloc.dart';
import '../module/profile/presentation/views/users_view.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        elevation: 5.0,
        child: ListView(
          children: [
            Container(
              //color: Colors.blueAccent,
              //color: AppBarTheme.of(context).backgroundColor,
              child: const Center(
                child: DrawerHeader(
                  padding: EdgeInsets.zero,
                  decoration: BoxDecoration(),
                  child: Text('fdfd'),
                  //child: Image.asset('assets/images/load/logo.png')
                ),
              ),
            ),
            Card(
              child: ListTile(
                title: const Text(
                  'Users',
                  //style: AppTextStyles.black14,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const UsersView(),
                    ),
                  );
                },
              ),
            ),
            Card(
              child: ListTile(
                title: const Text(
                  'Выход',
                  //style: AppTextStyles.black14,
                ),
                trailing: const Icon(Icons.keyboard_arrow_right),
                onTap: () {
                  BlocProvider.of<AuthBloc>(context).add(
                    SignOutEvent(),
                  );
                },
              ),
            ),
            10.verticalSpace,
            Padding(
              padding: REdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text('Тема'),
                  Switch(
                    value: context.read<ThemeBloc>().state == ThemeMode.dark,
                    onChanged: (value) {
                      context.read<ThemeBloc>().add(ThemeChanged(value));
                      Navigator.pop(context);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
