import 'package:CodeGenius/Online_Course/pages/profile/settings/bloc/settings_events.dart';
import 'package:CodeGenius/Online_Course/pages/profile/settings/bloc/settings_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsBlocs extends Bloc<SettingsEvents, SettingsStates>{
  SettingsBlocs():super(const SettingsStates()){
    on<TriggerSettings>(_triggerSettings);
  }
  _triggerSettings(SettingsEvents events, Emitter<SettingsStates> emit){
    emit(const SettingsStates());
  }
}