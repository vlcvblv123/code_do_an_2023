import 'package:CodeGenius/Online_Course/common/entities/entities.dart';
import 'package:CodeGenius/Online_Course/global.dart';
import 'package:CodeGenius/Online_Course/pages/home/bloc/home_page_blocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class HomeController {
  final BuildContext context;
  UserItem? userProfile = Global.storageService.getUserProfile();
  HomeController({required this.context});
  void init() {
    print("...Home controller init method");
  }
  // Future<void> init() async {
  //   if(Global.storageService.getUserToken().isNotEmpty){
  //     var result = await CourseAPI.courseList();
  //     if(result.code == 200){
  //       context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
  //     }
  //     else{
  //       print(result.code);
  //     }
  //
  //   }
  //   else{
  //     print("User has already logged out");
  //   }
  //
  // }
}
