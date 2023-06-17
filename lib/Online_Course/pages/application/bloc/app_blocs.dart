

import 'package:CodeGenius/Online_Course/pages/application/bloc/app_events.dart';
import 'package:CodeGenius/Online_Course/pages/application/bloc/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvent, AppState> {
  AppBlocs() : super(const AppState()) {
    on<TriggerAppEvent>((event, emit) {
      emit(AppState(index: event.index));
    });
  }
  // @override
  // Future<void> close() {
  //   emit(const AppState(index: 0));
  //   return super.close();
  // }
}
