import 'package:CodeGenius/Online_Course/common/entities/entities.dart';
import 'package:CodeGenius/Online_Course/global.dart';
import 'package:CodeGenius/Online_Course/pages/home/bloc/home_page_blocs.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';



// class HomeController{
//   final BuildContext context;
//   UserItem uerProfile = Global.storageService.getUserProfle();
//   HomeController({required this.context});
//   Future<void> init() async {
//     if(Global.storageService.getUserToken().isNotEmpty){
//       var result = await CourseAPI.courseList();
//       if(result.code == 200){
//         context.read<HomePageBlocs>().add(HomePageCourseItem(result.data!));
//       }
//       else{
//         print(result.code);
//       }
//
//     }
//     else{
//       print("User has already logged out");
//     }
//
//   }
// }