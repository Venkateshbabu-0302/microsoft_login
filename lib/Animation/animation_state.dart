import 'package:equatable/equatable.dart';

abstract class AnimationState extends Equatable {
  const AnimationState();

  @override
  List<Object> get props => [];
}

class AnimationInitial extends AnimationState {}

class AnimationInProgress extends AnimationState {}

class AnimationComplete extends AnimationState {}