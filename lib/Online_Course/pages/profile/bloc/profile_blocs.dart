import 'package:CodeGenius/Online_Course/pages/profile/bloc/profile_events.dart';
import 'package:CodeGenius/Online_Course/pages/profile/bloc/profile_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProfileBlocs extends Bloc<ProfileEvents, ProfileStates>{
  ProfileBlocs():super(const ProfileStates()){
    on<TriggerProfileName>(_triggerProfileName);
  }
  _triggerProfileName(TriggerProfileName event, Emitter<ProfileStates> emit){
    emit(state.copyWith(userProfile: event.userProfile));
  }
}