import 'package:flutter/material.dart';

abstract class TimeSelectionState {}

class TimeUnselectedState extends TimeSelectionState {}

class TimeSelectedState extends TimeSelectionState {
  final TimeOfDay time;

  TimeSelectedState({required this.time});
}
