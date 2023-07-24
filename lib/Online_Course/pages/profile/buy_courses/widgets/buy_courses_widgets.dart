import 'package:CodeGenius/Online_Course/common/values/constant.dart';
import 'package:CodeGenius/Online_Course/common/widgets/base_text_widget.dart';
import 'package:CodeGenius/Online_Course/pages/profile/buy_courses/bloc/buy_courses_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../common/routers/names.dart';
import '../../../../common/values/colors.dart';

Widget menuViews() {
  return Container(
    width: 325.w,
    margin: EdgeInsets.only(top: 15.h, bottom: 8.h),
    child: reusableText(
      "The courses you bought",
      fontSize: 14,
    ),
  );
}

Widget buildBoughtListItems(LoadedBuyCoursesStates state) {
  return SingleChildScrollView(
    padding: EdgeInsets.symmetric(horizontal: 15.w),
    child: ListView.builder(
        shrinkWrap: true,
        itemCount: state.courseItem.length, //state.courseItem.length,
        itemBuilder: (context, index) {
          return Container(
            width: 325.w,
            height: 80.h,
            margin: EdgeInsets.only(top: 10.h),
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            decoration: BoxDecoration(
                color: const Color.fromRGBO(255, 255, 255, 1),
                borderRadius: BorderRadius.circular(10.w),
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      spreadRadius: 2,
                      blurRadius: 3,
                      offset: const Offset(0, 1))
                ]),
            child: InkWell(
              onTap: () {
                Navigator.of(context).pushNamed(AppRoutes.COURSE_DETAIL,
                    arguments: {"id": state.courseItem[index].id});
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Container(
                        width: 60.w,
                        height: 60.h,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15.h),
                            image: DecorationImage(
                                fit: BoxFit.fitWidth,
                                image: NetworkImage("${AppConstants.SERVER_UPLOADS}${state.courseItem[index].thumbnail!}"))),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          listItemContainer(
                              state.courseItem[index].name.toString()),
                          listItemContainer(
                              "${state.courseItem[index].lesson_num.toString()} lesson",
                              fontSize: 10,
                              color: AppColors.primaryThreeElementText,
                              fontWeight: FontWeight.normal),
                        ],
                      )
                    ],
                  ),
                  Container(
                    width: 55.w,
                    child: Text(
                      "\$${state.courseItem[index].price??""}",
                      maxLines: 1,
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 13.sp,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  )
                ],
              ),
            ),
          );
        }),
  );
}


