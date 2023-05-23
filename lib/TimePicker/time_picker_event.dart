import 'package:flutter/material.dart';

abstract class TimeSelectionEvent {}

class TimeSelectedEvent extends TimeSelectionEvent {
  final TimeOfDay time;

  TimeSelectedEvent({required this.time});
}