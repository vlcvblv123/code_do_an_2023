import 'package:CodeGenius/Chatgpt/screens/chatgpt_screen.dart';
import 'package:CodeGenius/Online_Course/pages/home/home_page.dart';
import 'package:CodeGenius/Online_Course/pages/profile/profile.dart';
import 'package:CodeGenius/Online_Course/pages/search/bloc/search_blocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../common/values/colors.dart';
import '../search/search.dart';

Widget buildPage(int index) {
  List<Widget> _widget = [
    const HomePage(),
    BlocProvider<SearchBlocs>(
      create: (context) => SearchBlocs(),
      child: const Search(),
    ),
    const Center(child: Text("Course Comming Soon")),
    const ChatGPTScreen(),
    // ChatgptScreen(),
    const ProfilePage(),
  ];
  return _widget[index];
}

var bottomTabs = [
  BottomNavigationBarItem(
    label: "home",
    icon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset("assets/icons/home.png"),
    ),
    activeIcon: SizedBox(
      width: 15.w,
      height: 15.h,
      child: Image.asset(
        "assets/icons/home.png",
        color: AppColors.primaryElement,
      ),
    ),
  ),
  BottomNavigationBarItem(
      label: "search",
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/search2.png"),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/search2.png",
          color: AppColors.primaryElement,
        ),
      )),
  BottomNavigationBarItem(
      label: "course",
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/play-circle1.png"),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/play-circle1.png",
          color: AppColors.primaryElement,
        ),
      )),
  BottomNavigationBarItem(
      label: "chat",
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/message-circle.png"),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/message-circle.png",
          color: AppColors.primaryElement,
        ),
      )),
  BottomNavigationBarItem(
      label: "profile",
      icon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset("assets/icons/person2.png"),
      ),
      activeIcon: SizedBox(
        width: 15.w,
        height: 15.h,
        child: Image.asset(
          "assets/icons/person2.png",
          color: AppColors.primaryElement,
        ),
      )),
];
