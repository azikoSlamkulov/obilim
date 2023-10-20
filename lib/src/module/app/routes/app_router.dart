// GoRouter.of(context).goNamed(
//   APP_PAGE.shopCatalog.toName,
// );
// --------------------------------------------------------------------
// Navigator.push(
//   context,
//   MaterialPageRoute(
//     builder: (context) => MobileCatalogView(
//       type: type,
//       collection: collection,
//       category: category.name!,
//     ),
//   ),
// );
// --------------------------------------------------------------------

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:obilim/src/module/app/routes/router_utils.dart';

import '../../auth/presentation/logic/auth/auth_bloc.dart';
import '../../auth/presentation/views/password_recovery_view.dart';
import '../../auth/presentation/views/sign_in_view.dart';
import '../../auth/presentation/views/sign_up_view.dart';
import '../../course/presentation/views/chapter_list_view.dart';
import '../../course/presentation/views/catalog_view.dart';
import '../../course/presentation/views/lesson_list_view.dart';
import '../../course/presentation/views/lesson_view.dart';
import '../../home/presentation/views/home_view.dart';
import '../../profile/presentation/views/profile_view.dart';
import '../../../util/app_constants/app_constants.dart';
import '../navbar/navbar.dart';

const _pageKey = ValueKey('_pageKey');
const _scaffoldKey = ValueKey('_scaffoldKey');

class AppRouter {
  final AuthBloc authBloc;
  GoRouter get router => _goRouter;

  AppRouter(
    this.authBloc,
  );

  late final GoRouter _goRouter = GoRouter(
    //refreshListenable: GoRouterRefreshStream(authBloc.stream),
    initialLocation: AppPage.home.toPath,
    routes: <GoRoute>[
      /// Admin
      // GoRoute(
      //   path: AppPage.admin.toPath,
      //   name: AppPage.admin.toName,
      //   //builder: (context, state) => const MobileProfileViwe(),
      //   pageBuilder: (context, state) => const MaterialPage<void>(
      //     key: _pageKey,
      //     child: RootLayout(
      //       key: _scaffoldKey,
      //       currentIndex: 2,
      //       mobile: TestView(),
      //       tablet: TestView(),
      //     ),
      //   ),
      // ),

      /// Loading
      GoRoute(
        path: AppPage.loading.toPath,
        name: AppPage.loading.toName,
        builder: (context, state) => const Scaffold(
          backgroundColor: AppColors.white,
          body: Center(
            //child: progressIndicator.circularProgress(),
            child: CircularProgressIndicator(),
          ),
        ),
      ),

      /// Auth
      GoRoute(
        path: AppPage.signIn.toPath,
        name: AppPage.signIn.toName,
        builder: (context, state) => const SignInView(),
        routes: [
          GoRoute(
            path: AppPage.signUp.toPath,
            name: AppPage.signUp.toName,
            builder: (context, state) => SignUpView(),
          ),
          GoRoute(
            path: AppPage.passwordRecovery.toPath,
            name: AppPage.passwordRecovery.toName,
            builder: (context, state) => const PasswordRecoveryView(),
          ),
        ],
      ),

      /// Home
      GoRoute(
        path: AppPage.home.toPath,
        name: AppPage.home.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 0,
            // title: AppPage.home.toTitle,
            mobile: HomeView(),
            tablet: HomeView(),
          ),
        ),
      ),

      /// Course
      GoRoute(
        path: AppPage.course.toPath,
        name: AppPage.course.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 1,
            //title: AppPage.course.toTitle,
            mobile: CatalogView(),
            tablet: CatalogView(),
          ),
        ),
        routes: [
          GoRoute(
            path: AppPage.chapterList.toPath,
            name: AppPage.chapterList.toName,
            builder: (context, state) => RootLayout(
              key: _scaffoldKey,
              currentIndex: 1,
              //title: AppPage.chapterList.toTitle,
              mobile: ChapterListView(
                courseNumber: state.pathParameters['courseNumber']!,
              ),
              tablet: ChapterListView(
                courseNumber: state.pathParameters['courseNumber']!,
              ),
            ),
            routes: [
              GoRoute(
                path: AppPage.lessonList.toPath,
                name: AppPage.lessonList.toName,
                builder: (context, state) => RootLayout(
                  key: _scaffoldKey,
                  currentIndex: 1,
                  //title: AppPage.lessonList.toTitle,
                  mobile: LessonListView(
                    courseNumber: state.pathParameters['courseNumber']!,
                    chapterNumber: state.pathParameters['chapterNumber']!,
                  ),
                  tablet: LessonListView(
                    courseNumber: state.pathParameters['courseNumber']!,
                    chapterNumber: state.pathParameters['chapterNumber']!,
                  ),
                ),
                routes: [
                  GoRoute(
                    path: AppPage.lesson.toPath,
                    name: AppPage.lesson.toName,
                    builder: (context, state) => RootLayout(
                      key: _scaffoldKey,
                      currentIndex: 1,
                      //title: AppPage.lesson.toTitle,
                      mobile: LessonView(
                        courseNumber: state.pathParameters['courseNumber']!,
                        chapterNumber: state.pathParameters['chapterNumber']!,
                        lessonNumber: state.pathParameters['lessonNumber']!,
                      ),
                      tablet: LessonView(
                        courseNumber: state.pathParameters['courseNumber']!,
                        chapterNumber: state.pathParameters['chapterNumber']!,
                        lessonNumber: state.pathParameters['lessonNumber']!,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),

      /// Profile
      GoRoute(
        path: AppPage.profile.toPath,
        name: AppPage.profile.toName,
        pageBuilder: (context, state) => const MaterialPage<void>(
          key: _pageKey,
          child: RootLayout(
            key: _scaffoldKey,
            currentIndex: 2,
            //title: AppPage.profile.toTitle,
            mobile: ProfileView(),
            tablet: ProfileView(),
          ),
        ),
      ),
    ],

    // Error
    errorBuilder: (context, state) => Scaffold(
      backgroundColor: AppColors.white,
      body: Center(
        child: Text(
          state.extra.toString(),
          style: const TextStyle(
            fontSize: 22,
          ),
        ),
      ),
    ),

    // Redirect
    redirect: (context, state) {
      // --- 1 ---
      final bool loggedIn = authBloc.state is AuthenticatedState;
      final bool loggingIn = state.matchedLocation == AppPage.home.toPath;
      final bool onBoarding = state.matchedLocation == AppPage.signUp.toPath;
      // final bool signIn = state.subloc == AppPage.signIn.toPath;
      // final bool passwordRecovery =
      //     state.subloc == AppPage.passwordRecovery.toPath;
      final bool loading = authBloc.state is AuthLoadingState;
      //final bool loading = state.subloc == AppPage.loading.toPath;

      if (loading) {
        return AppPage.loading.toPath;
      } else if (!loggedIn) {
        return onBoarding ? null : AppPage.signIn.toPath;
      } else if (loggingIn) {
        return AppPage.home.toPath;
      }
      return null;
    },
  );
}
