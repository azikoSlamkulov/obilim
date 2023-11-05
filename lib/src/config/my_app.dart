// Future initialization(BuildContext? context) async {
//   /// Load resources
//   await Future.delayed(const Duration(seconds: 3));
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:obilim/src/config/routes/app_router.dart';
import 'package:obilim/src/config/theme/bloc/theme_bloc.dart';
import 'package:obilim/src/module/auth/presentation/logic/auth/auth_bloc.dart';

import 'theme/theme.dart';

class MyApp extends StatelessWidget {
  MyApp({Key? key}) : super(key: key);

  /// Navigation 1.0
  // @override
  // Widget build(BuildContext context) {
  //   final router = AppRouter(context.watch<AuthBloc>()).router;

  //   return ScreenUtilInit(
  //     designSize: const Size(393, 851),
  //     minTextAdapt: true,
  //     splitScreenMode: true,
  //     builder: (context, child) {
  //       return MaterialApp(
  //         debugShowCheckedModeBanner: false,
  //         //title: 'Flutter Demo',
  //         theme: ThemeData(
  //           primarySwatch: Colors.blue,
  //           textTheme: Typography.englishLike2018.apply(fontSizeFactor: 1.sp),
  //           //canvasColor: Colors.transparent,
  //         ),
  //         home: RedirectView(),
  //       );
  //     },
  //   );
  // }

  /// Navigation 2.0 (GoRouter)
  @override
  Widget build(BuildContext context) {
    final router = AppRouter(context.watch<AuthBloc>()).router;

    return ScreenUtilInit(
      designSize: const Size(393, 851),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return BlocBuilder<ThemeBloc, ThemeMode>(
          builder: (context, state) {
            return MaterialApp.router(
              debugShowCheckedModeBanner: false,
              theme: lightTheme,
              themeMode: state,
              darkTheme: darkTheme,
              routerConfig: router,
            );
          },
        );
      },
    );
  }
}
