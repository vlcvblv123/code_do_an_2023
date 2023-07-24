import 'package:CodeGenius/Online_Course/pages/common_widgets.dart';
import 'package:CodeGenius/Online_Course/pages/profile/buy_courses/bloc/buy_courses_blocs.dart';
import 'package:CodeGenius/Online_Course/pages/profile/buy_courses/bloc/buy_courses_states.dart';
import 'package:CodeGenius/Online_Course/pages/profile/buy_courses/buy_courses_controller.dart';
import 'package:CodeGenius/Online_Course/pages/profile/buy_courses/widgets/buy_courses_widgets.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BuyCourses extends StatefulWidget {
  const BuyCourses({super.key});

  @override
  State<BuyCourses> createState() => _BuyCoursesState();
}

class _BuyCoursesState extends State<BuyCourses> {
  late BuyCoursesController _buyCoursesController;
  @override
  void didChangeDependencies() {
    _buyCoursesController = BuyCoursesController(context: context);
    _buyCoursesController.init();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BuyCoursesBlocs, BuyCoursesStates>(
        builder: (context, state) {
      if (state is DoneLoadingBuyCoursesStates) {
        print("Done loading the data");
        return Container();
      } else if (state is LoadedBuyCoursesStates) {
        if (state.courseItem.isEmpty) {
          print("bang...");
        }
        print("Just  loading the data....");
        return Scaffold(
            appBar: buildAppBars("Buy Courses"),
            body: Padding(
              padding: EdgeInsets.symmetric(horizontal: 25.sp),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    menuViews(),
                    buildBoughtListItems(state),
                  ],
                ),
              ),
            ));
      } else if (state is LoadingBuyCoursesStates) {
        print('Loading the data ....');
        return const Center(
          child: CircularProgressIndicator(),
        );
      }
      return Container();
    });
  }
}
