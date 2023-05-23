import 'package:flutter/animation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'animation_event.dart';
import 'animation_state.dart';

class AnimationBloc extends Bloc<AnimationEvent, AnimationState> {
  late final AnimationController _controller;

  AnimationBloc(TickerProvider tickerProvider)
      : super(AnimationInitial()) {
    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: tickerProvider,
    );

    on<StartAnimation>((event, emit) {
      emit(AnimationInProgress());
      _controller.forward();
      Future.delayed(Duration(seconds: 2), () {
        emit(AnimationComplete());
      });
    });
  }

  AnimationController get controller => _controller;

  @override
  Future<void> close() {
    _controller.dispose();
    return super.close();
  }
}
