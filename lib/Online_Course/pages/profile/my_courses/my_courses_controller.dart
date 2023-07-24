import 'package:CodeGenius/Online_Course/common/apis/course_api.dart';
import 'package:CodeGenius/Online_Course/pages/profile/my_courses/bloc/my_courses_blocs.dart';
import 'package:CodeGenius/Online_Course/pages/profile/my_courses/bloc/my_courses_events.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCoursesController {
  late BuildContext context;
  MyCoursesController({required this.context});

  // after the context is ready this init() method gets called
  void init() {
    aysncLoadCourseData();
  }

  aysncLoadCourseData() async {
    context.read<MyCoursesBlocs>().add(const TriggerLoadingMyCoursesEvents());
    var result = await CourseAPI.courseList();
    if (result.code == 200) {
      if (context.mounted) {
        // save data to shared storage
        context
            .read<MyCoursesBlocs>()
            .add(const TriggerLoadedMyCoursesEvents([]));
        Future.delayed(const Duration(milliseconds: 10), () {
          {
            context
                .read<MyCoursesBlocs>()
                .add(const TriggerDoneLoadingMyCoursesEvents());
          }
        });
      }
    }
  }
}
