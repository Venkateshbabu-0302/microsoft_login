import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_microsoft_login/TimePicker/time_picker_event.dart';
import 'package:flutter_microsoft_login/TimePicker/time_picker_state.dart';

class TimeSelectionBloc extends Bloc<TimeSelectionEvent, TimeSelectionState> {
  TimeSelectionBloc() : super(TimeUnselectedState()) {
    on<TimeSelectedEvent>((event, emit) {
      emit(TimeSelectedState(time: event.time));
    });
  }
//...
}
