import 'package:CodeGenius/Online_Course/common/entities/course.dart';

class CourseStates {
  const CourseStates({this.courseItem});
  final CourseItem? courseItem;
  CourseStates copyWith({CourseItem? courseItem}) {
    return CourseStates(courseItem: courseItem ?? this.courseItem);
  }
}
