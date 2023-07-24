import 'package:CodeGenius/Online_Course/common/routers/routes.dart';
import 'package:CodeGenius/Online_Course/common/values/colors.dart';
import 'package:CodeGenius/Online_Course/common/widgets/base_text_widget.dart';
import 'package:CodeGenius/Online_Course/pages/home/bloc/home_page_blocs.dart';
import 'package:CodeGenius/Online_Course/pages/home/bloc/home_page_states.dart';
import 'package:CodeGenius/Online_Course/pages/home/home_controller.dart';
import 'package:CodeGenius/Online_Course/pages/home/widgets/home_page_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/entities/user.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late UserItem userProfile;
  @override
  void initState() {
    super.initState();
    // _homeController = HomeController(context: context);
    // _homeController.init();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    userProfile = HomeController(context: context).userProfile;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        //userProfile!= null ?
        backgroundColor: Colors.white,
        appBar: buildAppBars(userProfile.avatar.toString()),
        body: RefreshIndicator(
          onRefresh: () {
            return HomeController(context: context).init();
          },
          child: BlocBuilder<HomePageBlocs, HomePageStates>(
            builder: (context, state) {
              if (state.courseItem.isEmpty) {
                HomeController(context: context).init();
                print("..............states.course is empty.........");
              }

              return Container(
                margin: EdgeInsets.symmetric(vertical: 0, horizontal: 25.w),
                child: CustomScrollView(
                  //crossAxisAlignment: CrossAxisAlignment.start,
                  slivers: [
                    SliverToBoxAdapter(
                      child: homePageText(
                        "hello",
                        color: AppColors.primaryThreeElementText,
                      ),
                    ),
                    SliverToBoxAdapter(
                      child: homePageText(
                        userProfile.name!,
                        top: 5,
                      ),
                    ),
                    SliverPadding(
                      padding: EdgeInsets.only(top: 20.h),
                    ),
                    SliverToBoxAdapter(child: searchView(context,"Search your course")),
                    SliverToBoxAdapter(child: sliderView(context, state)),
                    SliverToBoxAdapter(child: menuView()),
                    SliverPadding(
                      padding: EdgeInsets.symmetric(
                        vertical: 18.h,
                        horizontal: 0.w,
                      ),
                      sliver: SliverGrid(
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                mainAxisSpacing: 15,
                                crossAxisSpacing: 15,
                                childAspectRatio: 1.6),
                        delegate: SliverChildBuilderDelegate(
                            childCount: state.courseItem.length,
                            (BuildContext context, int index) {
                          return GestureDetector(
                            onTap: () {
                              Navigator.of(context).pushNamed(
                                  AppRoutes.COURSE_DETAIL,
                                  arguments: {
                                    "id": state.courseItem.elementAt(index).id
                                  });
                            },
                            child: courseGrid(state.courseItem[index]),
                          );
                        }),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ));
    // ):Container();
  }
}
