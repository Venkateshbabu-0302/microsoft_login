import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RangeSliderState extends Equatable {
  const RangeSliderState();

  @override
  List<Object> get props => [];
}

class RangeSliderInitial extends RangeSliderState {}

class RangeSliderChangedSuccess extends RangeSliderState {
  final RangeValues values;

  const RangeSliderChangedSuccess(this.values);

  @override
  List<Object> get props => [values];
}
