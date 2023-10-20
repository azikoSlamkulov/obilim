import 'package:get_it/get_it.dart';
import 'package:obilim/src/core/data/local/sharedpreferences/local_storage.dart';
import 'package:obilim/src/core/data/remote/http/client.dart';
import 'package:obilim/src/module/auth/data/datasource/local_auth_data.dart';
import 'package:obilim/src/module/auth/data/datasource/remote_auth_data.dart';
import 'package:obilim/src/module/auth/data/repositories/auth_repo_impl.dart';
import 'package:obilim/src/module/auth/domain/repositories/auth_repo.dart';
import 'package:obilim/src/module/auth/domain/usecases/get_token.dart';
import 'package:obilim/src/module/auth/domain/usecases/sign_in_with_email.dart';
import 'package:obilim/src/module/auth/domain/usecases/sign_in_with_google.dart';
import 'package:obilim/src/module/auth/domain/usecases/sign_out.dart';
import 'package:obilim/src/module/auth/domain/usecases/sign_up.dart';
import 'package:obilim/src/module/auth/presentation/logic/auth/auth_bloc.dart';
import 'package:obilim/src/module/auth/presentation/logic/category_toggle_btn/type_toggle_btn_cubit.dart';
import 'package:obilim/src/module/profile/data/datasources/remote_user_data.dart';
import 'package:obilim/src/module/profile/data/repositories/user_repo_impl.dart';
import 'package:obilim/src/module/profile/domain/repositories/user_repo.dart';
import 'package:obilim/src/module/profile/domain/usecases/edit_user.dart';
import 'package:obilim/src/module/profile/domain/usecases/get_all_users.dart';
import 'package:obilim/src/module/profile/domain/usecases/get_user.dart';
import 'package:obilim/src/module/profile/domain/usecases/get_user_image.dart';
import 'package:obilim/src/module/profile/domain/usecases/upload_user_image.dart';
import 'package:obilim/src/module/profile/presentation/logic/user/user_cubit.dart';
import 'package:obilim/src/module/profile/presentation/logic/user_image/profile_image_cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'package:http/http.dart' as http;

final sl = GetIt.instance;

Future<void> init() async {
  ///Bloc
  sl.registerFactory(
    () => AuthBloc(
      getToken: sl(),
      //updateCurrentUser: sl(),
      signInWithEmail: sl(),
      signInWithGoogle: sl(),
      signUp: sl(),
      signOut: sl(),
    ),
  );

  sl.registerFactory(
    () => UserCubit(
      getAllUsers: sl(),
      getUser: sl(),
      editUser: sl(),
      uploadUserPhoto: sl(),
    ),
  );

  sl.registerFactory(
    () => ProfileImageCubit(
      //getUserPhoto: sl(),
      uploadUserPhoto: sl(),
    ),
  );

  sl.registerFactory(() => TypeToggleBtnCubit());

  ///Usecases
  sl.registerLazySingleton(() => GetToken(sl()));
  sl.registerLazySingleton(() => SignInWithEmail(sl()));
  sl.registerLazySingleton(() => SignInWithGoogle(sl()));
  sl.registerLazySingleton(() => SignUp(sl()));
  sl.registerLazySingleton(() => SignOut(sl()));

  sl.registerLazySingleton(() => GetAllUsers(sl()));
  sl.registerLazySingleton(() => GetUser(sl()));
  sl.registerLazySingleton(() => EditUser(sl()));
  sl.registerLazySingleton(() => UploadUserImage(sl()));
  //sl.registerLazySingleton(() => GetUserImage(sl()));

  ///Repositories
  sl.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(
      remoteAuth: sl(),
      localAuth: sl(),
    ),
  );

  sl.registerLazySingleton<UserRepo>(
    () => UserRepoImpl(
      localAuth: sl(),
      remoteUser: sl(),
    ),
  );

  ///datasource
  sl.registerLazySingleton<RemoteAuthData>(
    () => RemoteAuthDataImpl(apiClient: sl()),
    //() => RemoteAuthDataImpl(),
  );
  sl.registerLazySingleton<LocalAuthData>(
    () => AuthSharedPreferencesImpl(authPreferences: sl()),
  );

  sl.registerLazySingleton<RemoteUserData>(
    () => RemoteUserDataImpl(apiClient: sl()),
  );

  ///Core
  sl.registerLazySingleton<SharedPreferencesDB>(
    () => SharedPreferencesImpl(preferencesCore: sl()),
  );

  sl.registerLazySingleton<ApiClient>(
    () => ApiClientImpl(client: http.Client()),
  );

  ///Extarnal

  // SharedPreferences
  final sharedPreferences = await SharedPreferences.getInstance();
  sl.registerLazySingleton(() => sharedPreferences);

  sl.registerLazySingleton(() => http.Client);
}
