// abstract class DateRangePickerEvent {}
//
// class SelectFromDate extends DateRangePickerEvent {
//   final DateTime date;
//
//   SelectFromDate({required this.date});
// }
//
// class SelectToDate extends DateRangePickerEvent {
//   final DateTime date;
//
//   SelectToDate({required this.date});
// }

abstract class DateRangePickerEvent {}

class SelectFromDate extends DateRangePickerEvent {
  final DateTime date;

  SelectFromDate({required this.date});
}

class SelectToDate extends DateRangePickerEvent {
  final DateTime date;

  SelectToDate({required this.date});
}
