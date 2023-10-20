import 'dart:async';
import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:obilim/locator.dart';
import 'package:obilim/src/module/auth/presentation/logic/auth/auth_bloc.dart';
import 'package:obilim/src/module/auth/presentation/logic/category_toggle_btn/type_toggle_btn_cubit.dart';

class AppBlocObserver extends BlocObserver {
  @override
  void onChange(BlocBase<dynamic> bloc, Change<dynamic> change) {
    super.onChange(bloc, change);
    log('onChange(${bloc.runtimeType}, $change)');
  }

  @override
  void onError(BlocBase<dynamic> bloc, Object error, StackTrace stackTrace) {
    log('onError(${bloc.runtimeType}, $error, $stackTrace)');
    super.onError(bloc, error, stackTrace);
  }
}

Future<void> bootstrap(FutureOr<Widget> Function() builder) async {
  WidgetsFlutterBinding.ensureInitialized();
  await init();
  FlutterError.onError = (details) {
    log(details.exceptionAsString(), stackTrace: details.stack);
  };
  Bloc.observer = AppBlocObserver();
  runApp(
    MultiBlocProvider(
      providers: [
        /// Auth
        BlocProvider<AuthBloc>(
          create: (context) => sl<AuthBloc>()..add(GetTokenEvent()),
        ),
        BlocProvider<TypeToggleBtnCubit>(
          create: (context) => sl<TypeToggleBtnCubit>(),
        ),
      ],
      child: await builder(),
    ),
  );
}
