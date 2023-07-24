import 'package:CodeGenius/Online_Course/common/entities/entities.dart';
import 'package:CodeGenius/Online_Course/global.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../common/apis/course_api.dart';
import 'bloc/home_page_blocs.dart';
import 'bloc/home_page_events.dart';

class HomeController {
  late BuildContext context;
  UserItem get userProfile => Global.storageService.getUserProfile();
  static final HomeController _singleton = HomeController._external();
  HomeController._external();
  factory HomeController({required BuildContext context}) {
    _singleton.context = context;
    return _singleton;
  }
  Future<void> init() async {
    if (Global.storageService.getUserToken().isNotEmpty) {
      var result = await CourseAPI.courseList();
      print("the result is ${result.data![0].thumbnail!}");
      if (result.code == 200) {
        if (context.mounted) {
          context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
          return;
        }
      } else {
        print(result.code);
        return;
      }
    } else {
      print("User has already logged out");
      return;
    }
  }
}
