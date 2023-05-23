//
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'date_range_picker_event.dart';
// import 'date_range_picker_state.dart';
//
// class DateRangePickerBloc extends Bloc<DateRangePickerEvent, DateRangePickerState> {
//   DateRangePickerBloc() : super(DateRangePickerInitial()) {
//     on<SelectFromDate>((event, emit) {
//       _fromDate = event.date;
//       if (_fromDate != null && _toDate != null) {
//         emit(DateRangePickerSelected(fromDate: _fromDate, toDate: _toDate));
//       }
//     });
//     on<SelectToDate>((event, emit) {
//       _toDate = event.date;
//       if (_fromDate != null && _toDate != null) {
//         emit(DateRangePickerSelected(fromDate: _fromDate, toDate: _toDate));
//       }
//     });
//   }
//
//   DateTime? _fromDate;
//   DateTime? _toDate;
//
//   DateTime? get fromDate => _fromDate;
//
//   DateTime? get toDate => _toDate;
// }


import 'package:flutter_bloc/flutter_bloc.dart';

import 'date_range_picker_event.dart';
import 'date_range_picker_state.dart';

class DateRangePickerBloc extends Bloc<DateRangePickerEvent, DateRangePickerState> {
  DateRangePickerBloc() : super(DateRangePickerInitial()) {
    on<SelectFromDate>((event, emit) {
      _fromDate = event.date;
      if (_fromDate != null && _toDate != null) {
        if (_fromDate!.isAfter(_toDate!)) {
          _fromDate = _toDate;
        }
        emit(DateRangePickerSelected(fromDate: _fromDate!, toDate: _toDate!));
      }
    });
    on<SelectToDate>((event, emit) {
      _toDate = event.date;
      if (_fromDate != null && _toDate != null) {
        if (_toDate!.isBefore(_fromDate!)) {
          _toDate = _fromDate;
        }
        emit(DateRangePickerSelected(fromDate: _fromDate!, toDate: _toDate!));
      }
    });
  }

  DateTime? _fromDate;
  DateTime? _toDate;

  DateTime? get fromDate => _fromDate;

  DateTime? get toDate => _toDate;
}
