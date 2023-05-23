import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter_microsoft_login/RatingBar/rating_bar_event.dart';
import 'package:meta/meta.dart';

part 'rating_bar_state.dart';

class RatingBloc extends Bloc<RatingEvent, RatingState> {
  RatingBloc() : super(InitialRatingState()) {
    on<SetRatingEvent>((event, emit) {
      emit(UpdatedRatingState(event.rating));
    });
  }

  @override
  Stream<RatingState> mapEventToState(
      RatingEvent event,
      ) async* {
    // No need to implement mapEventToState anymore since we're using onEvent for SetRatingEvent
  }

  @override
  void onEvent(RatingEvent event) {
    super.onEvent(event);
    print(event); // Optional: Log all events
  }

  @override
  void onTransition(Transition<RatingEvent, RatingState> transition) {
    super.onTransition(transition);
    print(transition); // Optional: Log all state transitions
  }

  @override
  void onError(Object error, StackTrace stackTrace) {
    super.onError(error, stackTrace);
    print(error); // Optional: Log all errors
  }
}
