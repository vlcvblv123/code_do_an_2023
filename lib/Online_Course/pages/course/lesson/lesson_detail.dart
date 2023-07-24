import 'package:CodeGenius/Online_Course/common/widgets/base_text_widget.dart';
import 'package:CodeGenius/Online_Course/pages/course/lesson/bloc/lesson_blocs.dart';
import 'package:CodeGenius/Online_Course/pages/course/lesson/bloc/lesson_events.dart';
import 'package:CodeGenius/Online_Course/pages/course/lesson/lesson_controller.dart';
import 'package:CodeGenius/Online_Course/pages/course/lesson/widgets/lesson_detail_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

import 'bloc/lesson_states.dart';

class LessonDetail extends StatefulWidget {
  const LessonDetail({Key? key}) : super(key: key);

  @override
  State<LessonDetail> createState() => _LessonDetailState();
}

class _LessonDetailState extends State<LessonDetail> {
  late LessonController _lessonController;
  int videoIndex = 0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    _lessonController = LessonController(context: context);
    context.read<LessonBlocs>().add(const TriggerUrlItem(null));

    _lessonController.init();
  }

  @override
  void dispose() {
    _lessonController.videoPlayerController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<LessonBlocs, LessonStates>(builder: (context, state) {
      return SafeArea(
          child: Container(
            color: Colors.white,
            child: Scaffold(
              backgroundColor: Colors.white,
              appBar: buildAppBar("Lesson details"),
              body: CustomScrollView(
                slivers: [
                  SliverPadding(
                    padding: EdgeInsets.symmetric(
                        vertical: 20.h, horizontal: 25.w),
                    sliver: SliverToBoxAdapter(
                      child: Column(
                        children: [
                          videoPlayer(state, _lessonController),
                          videoControls(state, _lessonController, context)
                        ],
                      ),
                    ),
                  ),
                  videoList(state,_lessonController)
                ],
              ),
            ),
          ));
    });
  }


}
