import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

abstract class RangeSliderEvent extends Equatable {
  const RangeSliderEvent();

  @override
  List<Object> get props => [];
}

class RangeSliderChanged extends RangeSliderEvent {
  final RangeValues values;

  const RangeSliderChanged(this.values);

  @override
  List<Object> get props => [values];
}
