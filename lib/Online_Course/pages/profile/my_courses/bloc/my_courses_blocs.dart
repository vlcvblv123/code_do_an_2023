
import 'package:CodeGenius/Online_Course/pages/profile/my_courses/bloc/my_courses_events.dart';
import 'package:CodeGenius/Online_Course/pages/profile/my_courses/bloc/my_courses_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MyCoursesBlocs extends Bloc<MyCoursesEvents, MyCoursesStates> {
  MyCoursesBlocs() : super(const InitialMyCoursesStates()) {
    on<TriggerInitialMyCoursesEvents>(_triggerInitailMyCoursesEvents);
    on<TriggerLoadingMyCoursesEvents>(_triggerLoadingMyCoursesEvents);
    on<TriggerLoadedMyCoursesEvents>(_triggerLoadedMyCoursesEvents);
    on<TriggerDoneLoadingMyCoursesEvents>(_triggerDoneLoadingMyCoursesEvents);
  }
  _triggerInitailMyCoursesEvents(
      TriggerInitialMyCoursesEvents event, Emitter<MyCoursesStates> emit) {
    print("initial...");
    emit(const InitialMyCoursesStates());
  }

  _triggerLoadedMyCoursesEvents(
      TriggerLoadedMyCoursesEvents event, Emitter<MyCoursesStates> emit) {
    print('loaded....');
    emit(LoadedMyCoursesStates(event.courseItem));
  }

  _triggerLoadingMyCoursesEvents(
      TriggerLoadingMyCoursesEvents event, Emitter<MyCoursesStates> emit) {
    print('loading....');
    // we are calling state classes directly. State class are similar to state properties,
    // we have seen with state.copyWith method previously
    emit(const LoadingMyCoursesStates());
  }

  _triggerDoneLoadingMyCoursesEvents(
      TriggerDoneLoadingMyCoursesEvents event, Emitter<MyCoursesStates> emit) {
    print('Done Loading....');
    emit(const DoneLoadingMyCoursesStates());
  }
}
