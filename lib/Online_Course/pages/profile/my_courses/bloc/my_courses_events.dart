import '../../../../common/entities/course.dart';

// for each state i'm using a different class
// so the we can check our state type
abstract class MyCoursesEvents {
  const MyCoursesEvents();
}
class TriggerLoadedMyCoursesEvents extends MyCoursesEvents {
  const TriggerLoadedMyCoursesEvents(this.courseItem);
  final List<CourseItem> courseItem;
}

class TriggerInitialMyCoursesEvents extends MyCoursesEvents{
  const TriggerInitialMyCoursesEvents();
}
class TriggerLoadingMyCoursesEvents extends MyCoursesEvents {
  const TriggerLoadingMyCoursesEvents();
}

class TriggerDoneLoadingMyCoursesEvents extends MyCoursesEvents {
  const TriggerDoneLoadingMyCoursesEvents();
}

