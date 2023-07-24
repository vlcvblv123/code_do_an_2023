import 'package:CodeGenius/Online_Course/pages/course/bloc/course_events.dart';
import 'package:CodeGenius/Online_Course/pages/course/bloc/course_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CourseBlocs extends Bloc<CourseEvents, CourseStates>{
  CourseBlocs():super(const CourseStates()){
    on<TriggerCourse>(_triggerCourse);
  }
  void _triggerCourse(TriggerCourse event, Emitter<CourseStates>emit){
    emit(state.copyWith(courseItem: event.courseItem));
  }
}