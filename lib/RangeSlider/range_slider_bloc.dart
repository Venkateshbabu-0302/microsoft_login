import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'range_slider_event.dart';
import 'range_slider_state.dart';

class RangeSliderBloc extends Bloc<RangeSliderEvent, RangeSliderState> {
  RangeSliderBloc() : super(RangeSliderInitial()) {
    on<RangeSliderChanged>((event, emit) {
      emit(RangeSliderChangedSuccess(event.values));
    });
  }

  @override
  Stream<RangeSliderState> mapEventToState(RangeSliderEvent event) async* {
    if (event is RangeSliderChanged) {
      yield RangeSliderChangedSuccess(event.values);
    }
  }
}
