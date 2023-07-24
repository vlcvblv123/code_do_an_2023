import 'package:CodeGenius/Online_Course/common/apis/course_api.dart';
import 'package:CodeGenius/Online_Course/pages/profile/buy_courses/bloc/buy_courses_blocs.dart';
import 'package:CodeGenius/Online_Course/pages/profile/buy_courses/bloc/buy_courses_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyCoursesController {
  late BuildContext context;
  BuyCoursesController({required this.context});

  // after the context is ready this init() method gets called
  void init() {
    aysncLoadBuyCourseData();
  }

  aysncLoadBuyCourseData() async {
    context.read<BuyCoursesBlocs>().add(const TriggerLoadingBuyCoursesEvents());
    var result = await CourseAPI.coursesBought();
    if (result.code == 200) {
      if (context.mounted) {
        // save data to shared storage
        context
            .read<BuyCoursesBlocs>()
            .add(const TriggerDoneLoadingBuyCoursesEvents());
        Future.delayed(const Duration(milliseconds: 10), () {
          {
            context
                .read<BuyCoursesBlocs>()
                .add(TriggerLoadedBuyCoursesEvents(result.data!));
          }
        });
      }
    }
  }
}
