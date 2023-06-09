import 'package:CodeGenius/Online_Course/pages/application/bloc/app_events.dart';
import 'package:CodeGenius/Online_Course/pages/application/bloc/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvent, AppState> {
  AppBlocs() : super(const AppState()) {
    on<TriggerAppEvent>((event, emit) {
      // print("my tapped index${event.index}");
      emit(AppState(index: event.index));
    });
  }
}
