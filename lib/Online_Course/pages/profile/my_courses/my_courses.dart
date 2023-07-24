
import 'package:CodeGenius/Online_Course/pages/common_widgets.dart';
import 'package:CodeGenius/Online_Course/pages/profile/buy_courses/widgets/buy_courses_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'bloc/my_courses_blocs.dart';
import 'bloc/my_courses_states.dart';
import 'my_courses_controller.dart';

class MyCourses extends StatefulWidget {
  const MyCourses({super.key});

  @override
  State<MyCourses> createState() => _MyCoursesState();
}

class _MyCoursesState extends State<MyCourses> {
  late MyCoursesController _myCoursesController;
  @override
  void didChangeDependencies() {
    _myCoursesController = MyCoursesController(context: context);
    _myCoursesController.init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MyCoursesBlocs, MyCoursesStates>(
        builder: (context, state) {
      if (state is DoneLoadingMyCoursesStates) {
        print("Done loading the data");
        return Scaffold(
          appBar: buildAppBars("My Courses"),
          body: SingleChildScrollView(
            child: Column(children: [
              menuViews(),

            ],),
          )
        );
      } else if (state is LoadedMyCoursesStates) {
        print("Just  loading the data....");
        return Container();
      } else if(state is LoadingMyCoursesStates){
        print('Loading the data ....');
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Container();
    });
  }
}
