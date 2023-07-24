import 'package:CodeGenius/Online_Course/pages/course/lesson/bloc/lesson_events.dart';
import 'package:CodeGenius/Online_Course/pages/course/lesson/bloc/lesson_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LessonBlocs extends Bloc<LessonEvents,LessonStates>{
  LessonBlocs():super(const LessonStates()){
    on<TriggerLessonVideo>(_triggerLessonVideo);
    on<TriggerUrlItem>(_triggerUrlVideo);
    on<TriggerPlay>(_triggerPlay);
    on<TriggerVideoIndex>(_triggerVideoIndex);
  }
  void _triggerLessonVideo(TriggerLessonVideo event, Emitter<LessonStates>emit){
    emit(state.copyWith(lessonVideoItem: event.lessonVideoItem));
  }
  void _triggerUrlVideo(TriggerUrlItem event, Emitter<LessonStates>emit){
    emit(state.copyWith(initializeVideoPlayerFuture: event.initVideoPlayerFuture));
  }
  void _triggerPlay(TriggerPlay event, Emitter<LessonStates>emit){
    emit(state.copyWith(isPlay: event.isPlay));
  }
  void _triggerVideoIndex(TriggerVideoIndex event, Emitter<LessonStates>emit){
    emit(state.copyWith(videoIndex: event.videoIndex));
  }
}