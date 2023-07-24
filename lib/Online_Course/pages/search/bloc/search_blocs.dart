import 'package:CodeGenius/Online_Course/pages/search/bloc/search_events.dart';
import 'package:CodeGenius/Online_Course/pages/search/bloc/search_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchBlocs extends Bloc<SearchEvents,SearchStates>{
  SearchBlocs():super(const SearchStates()){
    on<TriggerSearchEvents>(_triggerSearchEvents);
  }
  _triggerSearchEvents(TriggerSearchEvents events, Emitter<SearchStates> emitter){
    emitter(state.copyWith(courseItem: events.courseItem));
  }
}