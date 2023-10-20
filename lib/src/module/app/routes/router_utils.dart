enum AppPage {
  /// Auth
  loading,
  signIn,
  signUp,
  passwordRecovery,

  /// Home
  home,
  error,

  /// Catalog
  course,
  chapterList,
  lessonList,
  lesson,

  /// Profile
  profile,

  /// Admin
  admin,
}

extension AppPageExtension on AppPage {
  String get toPath {
    switch (this) {
      case AppPage.loading:
        return "/splash";
      case AppPage.signUp:
        return "signUp";
      case AppPage.signIn:
        return "/signIn";
      case AppPage.passwordRecovery:
        return "passwordRecovery";

      /// Home
      case AppPage.home:
        return "/";

      /// Course
      case AppPage.course:
        return "/course";
      case AppPage.chapterList:
        return "chapterList/:courseNumber";
      case AppPage.lessonList:
        return "lessonList/:chapterNumber";
      case AppPage.lesson:
        return "lesson/:lessonNumber";

      /// Profile
      case AppPage.profile:
        return "/profile";

      /// Error
      case AppPage.error:
        return "/error";

      /// Admin
      case AppPage.admin:
        return "/admin";

      default:
        return "/";
    }
  }

  String get toName {
    switch (this) {
      case AppPage.loading:
        return "SPLASH";
      case AppPage.signIn:
        return "SIGNIN";
      case AppPage.signUp:
        return "SIGNUP";
      case AppPage.passwordRecovery:
        return "PASSWORDRECOVERY";

      /// Home
      case AppPage.home:
        return "HOME";

      /// Course
      case AppPage.course:
        return "COURSE";
      case AppPage.chapterList:
        return "CHAPTERLIST";
      case AppPage.lessonList:
        return "LESSONLIST";
      case AppPage.lesson:
        return "LESSON";

      /// Profile
      case AppPage.profile:
        return "PROFILE";

      /// Error
      case AppPage.error:
        return "ERROR";

      /// Admin
      case AppPage.admin:
        return "ADMIN";

      default:
        return "HOME";
    }
  }

  String get toTitle {
    switch (this) {
      case AppPage.loading:
        return "My App Splash";
      case AppPage.signIn:
        return "My App Sign In";
      case AppPage.signUp:
        return "My App Sign Up";
      case AppPage.passwordRecovery:
        return "Password Recovery";

      /// Home
      case AppPage.home:
        return "Home View";

      /// Course
      case AppPage.course:
        return "Course View";
      case AppPage.chapterList:
        return "ChapterList View";
      case AppPage.lessonList:
        return "LessonList View";
      case AppPage.lesson:
        return "Lesson View";

      /// Profile
      case AppPage.profile:
        return "Profile View";

      case AppPage.error:
        return "App Error";

      /// Admin
      case AppPage.admin:
        return "Admin View";
      default:
        return "My App";
    }
  }
}
