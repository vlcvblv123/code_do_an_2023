import 'package:CodeGenius/Online_Course/pages/profile/buy_courses/bloc/buy_courses_events.dart';
import 'package:CodeGenius/Online_Course/pages/profile/buy_courses/bloc/buy_courses_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BuyCoursesBlocs extends Bloc<BuyCoursesEvents, BuyCoursesStates> {
  BuyCoursesBlocs() : super(const InitialBuyCoursesStates()) {
    on<TriggerInitialBuyCoursesEvents>(_triggerInitailBuyCoursesEvents);
    on<TriggerLoadingBuyCoursesEvents>(_triggerLoadingBuyCoursesEvents);
    on<TriggerLoadedBuyCoursesEvents>(_triggerLoadedBuyCoursesEvents);
    on<TriggerDoneLoadingBuyCoursesEvents>(_triggerDoneLoadingBuyCoursesEvents);
  }
  _triggerInitailBuyCoursesEvents(
      TriggerInitialBuyCoursesEvents event, Emitter<BuyCoursesStates> emit) {
    print("initial...");
    emit(const InitialBuyCoursesStates());
  }

  _triggerLoadedBuyCoursesEvents(
      TriggerLoadedBuyCoursesEvents event, Emitter<BuyCoursesStates> emit) {
    print('loaded....');
    emit(LoadedBuyCoursesStates(event.courseItem));
  }

  _triggerLoadingBuyCoursesEvents(
      TriggerLoadingBuyCoursesEvents event, Emitter<BuyCoursesStates> emit) {
    print('loading....');
    // we are calling state classes directly. State class are similar to state properties,
    // we have seen with state.copyWith method previously
    emit(const LoadingBuyCoursesStates());
  }

  _triggerDoneLoadingBuyCoursesEvents(TriggerDoneLoadingBuyCoursesEvents event,
      Emitter<BuyCoursesStates> emit) {
    print('Done Loading....');
    emit(const DoneLoadingBuyCoursesStates());
  }
}
