import 'package:CodeGenius/Online_Course/pages/course/course_details/bloc/course_detail_blocs.dart';
import 'package:CodeGenius/Online_Course/pages/course/course_details/bloc/course_detail_states.dart';
import 'package:CodeGenius/Online_Course/pages/course/course_details/widgets/course_detail_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../common/widgets/base_text_widget.dart';
import 'course_detail_controller.dart';

class CourseDetail extends StatefulWidget {
  const CourseDetail({Key? key}) : super(key: key);

  @override
  State<CourseDetail> createState() => _CourseDetailState();
}

class _CourseDetailState extends State<CourseDetail> {
  late CourseDetailController _courseDetailController;
  @override
  void initState() {
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    Future.delayed(const Duration(seconds: 0), () {
      _courseDetailController = CourseDetailController(context: context);
      _courseDetailController.init();
    });
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return BlocBuilder<CourseDetailBlocs, CourseDetailStates>(
        builder: (context, state) {
      print("state is called  ${++i} time");
      return state.courseItem == null
          ? const Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.blue,
              ),
            )
          : Container(
              color: Colors.white,
              child: SafeArea(
                child: Scaffold(
                  backgroundColor: Colors.white,
                  appBar: buildAppBar("Course detail"),
                  body: SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 15.h, horizontal: 25.w),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              thumbNail(state.courseItem!.thumbnail.toString()),
                              SizedBox(
                                height: 15.h,
                              ),
                              menuView(context, state),
                              SizedBox(
                                height: 15.h,
                              ),
                              reusableText(state.courseItem!.name.toString()),
                              SizedBox(
                                height: 15.h,
                              ),
                              descriptionText(
                                  state.courseItem!.description.toString()),
                              SizedBox(
                                height: 20.h,
                              ),
                              state.checkBuy == false
                                  ? GestureDetector(
                                      onTap: () {
                                        _courseDetailController
                                            .goBuy(state.courseItem!.id);
                                      },
                                      child: goBuyButton("Go Buy"),
                                    )
                                  : Container(),
                              SizedBox(
                                height: 20.h,
                              ),
                              courseSummary(),
                              buildListViewCourseDetails(context, state),
                              SizedBox(
                                height: 20.h,
                              ),
                              reusableText("Lesson List"),
                              SizedBox(
                                height: 20.h,
                              ),
                              //Course lesson list
                              courseLessonList(state)
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
    });
  }
}
