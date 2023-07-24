import 'dart:convert';

import 'package:CodeGenius/Online_Course/common/apis/course_api.dart';
import 'package:CodeGenius/Online_Course/common/entities/course.dart';
import 'package:CodeGenius/Online_Course/common/widgets/flutter_toast.dart';
import 'package:CodeGenius/Online_Course/pages/search/bloc/search_blocs.dart';
import 'package:CodeGenius/Online_Course/pages/search/bloc/search_events.dart';
import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';

class SearchController {
  late BuildContext context;
  SearchController({required this.context});
  void init() {
    asyncLoadRecommendedData();
  }

  Future<void> asyncLoadRecommendedData() async {
    var result = await CourseAPI.recommendedCourseList();
    if (result.code == 200) {
      if (context.mounted) {
        context.read<SearchBlocs>().add(TriggerSearchEvents(result.data!));
        print("load data");
      } else {
        toastInfo(msg: "Internet Error");
      }
    }
  }

  Future<void> asyncLoadSearchData(String item) async {
    SearchRequestEntity searchRequestEntity = SearchRequestEntity();
    searchRequestEntity.search = item;
    var result = await CourseAPI.search(params: searchRequestEntity);
    if (result.code == 200) {
      if (context.mounted) {
        context.read<SearchBlocs>().add(TriggerSearchEvents(result.data!));

        print("${jsonEncode(result.data!)}");
      } else {
        toastInfo(msg: "Internet Error");
      }
    }
  }
}
