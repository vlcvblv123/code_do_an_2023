import 'package:CodeGenius/Online_Course/common/entities/course.dart';

abstract class BuyCoursesEvents{
  const BuyCoursesEvents();
}

class TriggerBuyCourses extends BuyCoursesEvents{
  const TriggerBuyCourses();
}
class TriggerInitialBuyCoursesEvents extends BuyCoursesEvents{
  const TriggerInitialBuyCoursesEvents();
}
class TriggerLoadingBuyCoursesEvents extends BuyCoursesEvents {
  const TriggerLoadingBuyCoursesEvents();
}

class TriggerDoneLoadingBuyCoursesEvents extends BuyCoursesEvents {
  const TriggerDoneLoadingBuyCoursesEvents();
}
class TriggerLoadedBuyCoursesEvents extends BuyCoursesEvents {
  const TriggerLoadedBuyCoursesEvents(this.courseItem);
  final List<CourseItem> courseItem;
}