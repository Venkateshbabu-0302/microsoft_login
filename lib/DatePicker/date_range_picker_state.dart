// abstract class DateRangePickerState {}
//
// class DateRangePickerInitial extends DateRangePickerState {}
//
// class DateRangePickerSelected extends DateRangePickerState {
//   final DateTime? fromDate;
//   final DateTime? toDate;
//
//   DateRangePickerSelected({required this.fromDate, required this.toDate});
// }

abstract class DateRangePickerState {}

class DateRangePickerInitial extends DateRangePickerState {}

class DateRangePickerSelected extends DateRangePickerState {
  final DateTime? fromDate;
  final DateTime? toDate;

  DateRangePickerSelected({this.fromDate, this.toDate});
}
