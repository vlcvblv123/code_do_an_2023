import 'package:CodeGenius/Online_Course/common/entities/course.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'contributor_states.dart';

class ContributorCubits extends Cubit<ContributorStates> {
  ContributorCubits() : super(const ContributorStates());
  triggerContributor(AuthorItem event) {
    emit(state.copyWith(authorItem: event));
  }

  triggerCourseItemChange(List<CourseItem> event) {
    emit(state.copyWith(courseItem: event));
  }
}
