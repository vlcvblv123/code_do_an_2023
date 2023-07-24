import 'package:CodeGenius/Online_Course/pages/application/application_page.dart';
import 'package:CodeGenius/Online_Course/pages/application/bloc/app_blocs.dart';
import 'package:CodeGenius/Online_Course/pages/course/contributor/contributor.dart';
import 'package:CodeGenius/Online_Course/pages/course/contributor/cubit/contributor_cubits.dart';
import 'package:CodeGenius/Online_Course/pages/course/contributor/cubit/contributor_states.dart';

import 'package:CodeGenius/Online_Course/pages/course/course_details/course_detail.dart';
import 'package:CodeGenius/Online_Course/pages/course/lesson/bloc/lesson_blocs.dart';
import 'package:CodeGenius/Online_Course/pages/course/lesson/lesson_detail.dart';

import 'package:CodeGenius/Online_Course/pages/course/paywebview/bloc/payview_blocs.dart';
import 'package:CodeGenius/Online_Course/pages/course/paywebview/paywebview.dart';
import 'package:CodeGenius/Online_Course/pages/home/bloc/home_page_blocs.dart';
import 'package:CodeGenius/Online_Course/pages/profile/buy_courses/bloc/buy_courses_blocs.dart';
import 'package:CodeGenius/Online_Course/pages/profile/buy_courses/buy_courses.dart';
import 'package:CodeGenius/Online_Course/pages/profile/payment_details/cubit/payment_detail_cubits.dart';
import 'package:CodeGenius/Online_Course/pages/profile/payment_details/payment_details.dart';
import 'package:CodeGenius/Online_Course/pages/profile/profile.dart';
import 'package:CodeGenius/Online_Course/pages/profile/settings/bloc/settings_blocs.dart';
import 'package:CodeGenius/Online_Course/pages/profile/settings/setting_page.dart';
import 'package:CodeGenius/Online_Course/pages/register/bloc/register_blocs.dart';
import 'package:CodeGenius/Online_Course/pages/register/register.dart';
import 'package:CodeGenius/Online_Course/pages/welcome/bloc/welcome_blocs.dart';
import 'package:CodeGenius/Online_Course/pages/welcome/welcome.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../global.dart';
import '../../pages/course/course_details/bloc/course_detail_blocs.dart';

import '../../pages/home/home_page.dart';
import '../../pages/profile/bloc/profile_blocs.dart';
import '../../pages/profile/my_courses/bloc/my_courses_blocs.dart';
import '../../pages/profile/my_courses/my_courses.dart';
import '../../pages/sign_in/bloc/signin_blocs.dart';
import '../../pages/sign_in/sign_in.dart';
import 'names.dart';

class AppPages {
  static List<PageEntity> routes() {
    return [
      PageEntity(
          route: AppRoutes.INITIAL,
          page: const Welcome(),
          bloc: BlocProvider(
            create: (_) => WelcomeBloc(),
          )),
      PageEntity(
          route: AppRoutes.SIGN_IN,
          page: const SignIn(),
          bloc: BlocProvider(
            create: (_) => SignInBloc(),
          )),
      PageEntity(
          route: AppRoutes.REGISTER,
          page: const Register(),
          bloc: BlocProvider(
            create: (_) => RegisterBlocs(),
          )),
      PageEntity(
          route: AppRoutes.APPLICATION,
          page: const ApplicationPage(),
          bloc: BlocProvider(
            create: (_) => AppBlocs(),
          )),
      PageEntity(
          route: AppRoutes.HOME_PAGE,
          page: const HomePage(),
          bloc: BlocProvider(
            create: (_) => HomePageBlocs(),
          )),
      PageEntity(
          route: AppRoutes.SETTING_PAGE,
          page: const SettingsPage(),
          bloc: BlocProvider(
            create: (_) => SettingsBlocs(),
          )),
      PageEntity(
          route: AppRoutes.COURSE_DETAIL,
          page: const CourseDetail(),
          bloc: BlocProvider(
            create: (_) => CourseDetailBlocs(),
          )),
      PageEntity(
          route: AppRoutes.PAY_WEB_VIEW,
          page: const PayWebView(),
          bloc: BlocProvider(
            create: (_) => PayWebViewBlocs(),
          )),
      PageEntity(
          route: AppRoutes.LESSON_DETAIL,
          page: const LessonDetail(),
          bloc: BlocProvider(
            create: (_) => LessonBlocs(),
          )),
      PageEntity(
          route: AppRoutes.PROFILE,
          page: const ProfilePage(),
          bloc: BlocProvider(
            create: (_) => ProfileBlocs(),
          )),
      PageEntity(
          route: AppRoutes.MY_COURSES,
          page: const MyCourses(),
          bloc: BlocProvider(
            create: (_) => MyCoursesBlocs(),
          )),
      PageEntity(
          route: AppRoutes.BUY_COURSES,
          page: const BuyCourses(),
          bloc: BlocProvider(
            create: (_) => BuyCoursesBlocs(),
          )),
      PageEntity(
          route: AppRoutes.PAYMENT_DETAILS,
          page: const PaymentDetails(),
          bloc: BlocProvider(
            create: (_) => PaymentDetailCubits(),
          )),
      PageEntity(
          route: AppRoutes.CONTRIBUTOR,
          page: const Contributor(),
          bloc: BlocProvider(
            create: (_) => ContributorCubits(),
          )),
    ];
  }

  static List<dynamic> allBlocProvider(BuildContext context) {
    List<dynamic> blocProviders = <dynamic>[];
    for (var bloc in routes()) {
      blocProviders.add(bloc.bloc);
    }
    return blocProviders;
  }

  static MaterialPageRoute GenerateRouteSettings(RouteSettings settings) {
    if (settings.name != null) {
      var result = routes().where((element) => element.route == settings.name);
      if (result.isNotEmpty) {
        print(result.first.route);
        bool deviceFirstOpen = Global.storageService.getDeviceFirstOpen();
        if (result.first.route == AppRoutes.INITIAL && deviceFirstOpen) {
          bool isLoggedin = Global.storageService.getIsLoggedIn();
          if (isLoggedin) {
            return MaterialPageRoute(
                builder: (_) => const ApplicationPage(), settings: settings);
          }

          return MaterialPageRoute(
              builder: (_) => const SignIn(), settings: settings);
        }
        return MaterialPageRoute(
            builder: (_) => result.first.page, settings: settings);
      }
    }

    return MaterialPageRoute(
        builder: (_) => const SignIn(), settings: settings);
  }
}

class PageEntity {
  String route;
  Widget page;
  dynamic bloc;
  PageEntity({
    required this.route,
    required this.page,
    this.bloc,
  });
}
