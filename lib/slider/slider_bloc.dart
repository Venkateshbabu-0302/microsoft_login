import 'package:bloc/bloc.dart';
import './slider_event.dart';
import './slider_state.dart';

class SliderBloc extends Bloc<SliderEvent, SliderState> {
  SliderBloc() : super(SliderInitial()) {
    on<SliderValueChanged>((event, emit) {
      if (event is SliderValueChanged) {
        emit(SliderValueChangedSuccess(event.value));
      }
    });
  }

  @override
  Stream<SliderState> mapEventToState(SliderEvent event) async* {
    if (event is SliderValueChanged) {
      yield SliderValueChangedSuccess(event.value);
    }
  }
}