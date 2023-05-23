import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:equatable/equatable.dart';

abstract class AnimationEvent extends Equatable {
  const AnimationEvent();

  @override
  List<Object> get props => [];
}

class StartAnimation extends AnimationEvent {}

class StopAnimation extends AnimationEvent {}