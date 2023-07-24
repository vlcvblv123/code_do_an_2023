import 'package:CodeGenius/Online_Course/pages/search/search_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../values/colors.dart';

Widget reusableText(String text,
    {Color color = AppColors.primaryText,
    int fontSize = 16,
    FontWeight fontWeight = FontWeight.bold}) {
  return Text(
    text,
    style:
        TextStyle(color: color, fontWeight: fontWeight, fontSize: fontSize.sp),
  );
}

AppBar buildAppBar(String url) {
  return AppBar(
    title: reusableText(url),
  );
}

Widget listItemContainer(String name,
    {double fontSize = 13,
    Color color = AppColors.primaryText,
    fontWeight = FontWeight.bold}) {
  return Container(
    width: 180.w,
    margin: EdgeInsets.only(left: 6.w),
    child: Text(
      name,
      overflow: TextOverflow.clip,
      maxLines: 1,
      style: TextStyle(
          color: color, fontSize: fontSize.sp, fontWeight: fontWeight),
    ),
  );
}

Widget searchView(BuildContext context, String hintTexts, {bool home = true}) {
  return Row(
    children: [
      Container(
        width: 280.w,
        height: 40.h,
        decoration: BoxDecoration(
            color: AppColors.primaryBackground,
            borderRadius: BorderRadius.circular(15.h),
            border: Border.all(color: AppColors.primaryFourElementText)),
        child: Row(
          children: [
            Container(
              margin: EdgeInsets.only(left: 17.w),
              height: 16.w,
              width: 16.w,
              child: Image.asset("assets/icons/search.png"),
            ),
            SizedBox(
              width: 240.w,
              height: 40.h,
              child: TextField(
                keyboardType: TextInputType.multiline,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.fromLTRB(5, 5, 0, 5),
                  hintText: hintTexts,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.transparent),
                  ),
                  disabledBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.transparent)),
                  hintStyle: const TextStyle(
                      color: AppColors.primarySecondaryElementText),
                ),
                style: TextStyle(
                    color: AppColors.primaryText,
                    fontFamily: "Poppins",
                    fontSize: 14.sp,
                    fontWeight: FontWeight.normal),
                textInputAction: TextInputAction.search,
                onChanged: (value) {},
                onSubmitted: (value) {
                  if (value.isNotEmpty) {
                    // we don't make a call from homepage
                    if (home == false){
                      SearchController(context: context)
                          .asyncLoadSearchData(value);
                    }

                  }
                },
                autocorrect: false,
                obscureText: false,
              ),
            )
          ],
        ),
      ),
      GestureDetector(
        child: Container(
          width: 40.w,
          height: 40.h,
          decoration: BoxDecoration(
            color: AppColors.primaryElement,
            borderRadius: BorderRadius.all(Radius.circular(13.w)),
            border: Border.all(color: AppColors.primaryElement),
          ),
          child: Image.asset("assets/icons/options.png"),
        ),
      )
    ],
  );
}
