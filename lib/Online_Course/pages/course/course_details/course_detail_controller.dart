import 'package:CodeGenius/Online_Course/common/apis/course_api.dart';
import 'package:CodeGenius/Online_Course/common/apis/lesson_api.dart';
import 'package:CodeGenius/Online_Course/common/entities/entities.dart';
import 'package:CodeGenius/Online_Course/common/routers/names.dart';
import 'package:CodeGenius/Online_Course/common/widgets/flutter_toast.dart';
import 'package:CodeGenius/Online_Course/pages/course/course_details/bloc/course_detail_blocs.dart';
import 'package:CodeGenius/Online_Course/pages/course/course_details/bloc/course_detail_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

class CourseDetailController {
  final BuildContext context;
  CourseDetailController({required this.context});
  void init() async {
    final args = ModalRoute.of(context)!.settings.arguments as Map;
    asyncLoadCourseData(args["id"]);
    asyncLoadLessonData(args["id"]);
    asyncLoadCourseBought(args["id"]);
  }

  asyncLoadCourseData(int? id) async {
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseAPI.courseDetail(params: courseRequestEntity);
    if (result.code == 200) {
      if (context.mounted) {
        print('-----------context is ready-----------');
        context
            .read<CourseDetailBlocs>()
            .add(TriggerCourseDetail(result.data!));
      } else {
        print('context is not available');
      }
    } else {
      toastInfo(
          msg: "Something went wrong and check the log in the laravel.log");
    }
  }

  asyncLoadLessonData(int? id) async {
    LessonRequestEntity lessonRequestEntity = LessonRequestEntity();
    lessonRequestEntity.id = id;
    var result = await LessonAPI.lessonList(params: lessonRequestEntity);
    // print('---------my lesson data ${result.data?.length.toString()}------------');
    if (result.code == 200) {
      if (context.mounted) {
        context.read<CourseDetailBlocs>().add(TriggerLessonList(result.data!));
        // print('my lesson data is ${result.data![0].name}');
      } else {
        print('---------context is not read ----------');
      }
    } else {
      toastInfo(msg: "Something went wrong check the log");
    }
  }

  Future<void> goBuy(int? id) async {
    print('------course id ${id}------');
    EasyLoading.show(
        indicator: const CircularProgressIndicator(),
        maskType: EasyLoadingMaskType.clear,
        dismissOnTap: true);
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseAPI.coursePay(params: courseRequestEntity);
    print(result.toString());
    EasyLoading.dismiss();

    if (result.code == 200) {
      var url = Uri.decodeFull(result.data!);

      var res = await Navigator.of(context)
          .pushNamed(AppRoutes.PAY_WEB_VIEW, arguments: {'url': url});
      if (res == "success") {
        toastInfo(msg: result.msg!);
      }
    } else {
      toastInfo(msg: result.msg!);
    }
  }

  Future<void> asyncLoadCourseBought(int? id) async {
    CourseRequestEntity courseRequestEntity = CourseRequestEntity();
    courseRequestEntity.id = id;
    var result = await CourseAPI.courseBought(params: courseRequestEntity);

    if (result.code == 200) {
      if (result.msg == "success") {
        if (context.mounted) {
          context.read<CourseDetailBlocs>().add(const TriggerCheckBuy(true));
        }
        print("it is bought by your");
      } else {
        if (context.mounted) {
          context.read<CourseDetailBlocs>().add(const TriggerCheckBuy(false));
        }
      }
    }
  }
}
