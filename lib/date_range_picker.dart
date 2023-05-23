// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import 'DatePicker/date_range_picker_bloc.dart';
// import 'DatePicker/date_range_picker_event.dart';
// import 'package:intl/intl.dart';
//
// class DateRangePickerWidget extends StatefulWidget {
//   @override
//   _DateRangePickerWidgetState createState() => _DateRangePickerWidgetState();
// }
//
// class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {
//   final _fromDateController = TextEditingController();
//   final _toDateController = TextEditingController();
//   final _dateFormat = DateFormat('yyyy-MM-dd'); // Initialize a date format
//
//   @override
//   void dispose() {
//     _fromDateController.dispose();
//     _toDateController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => DateRangePickerBloc(),
//       child: Builder(
//         builder: (context) {
//           final dateRangePickerBloc = context.read<DateRangePickerBloc>();
//           return Column(
//             children: [
//               TextFormField(
//                 readOnly: true,
//                 decoration: InputDecoration(
//                   labelText: 'From Date',
//                 ),
//                 onTap: () async {
//                   final DateTime? selectedDate = await showDatePicker(
//                     context: context,
//                     initialDate: dateRangePickerBloc.fromDate ?? DateTime.now(),
//                     firstDate: DateTime(1900),
//                     lastDate: DateTime.now(),
//                   );
//                   if (selectedDate != null) {
//                     dateRangePickerBloc.add(SelectFromDate(date: selectedDate));
//                     _fromDateController.text = _dateFormat.format(selectedDate); // Format the selected date
//                   }
//                 },
//                 controller: _fromDateController,
//               ),
//               TextFormField(
//                 readOnly: true,
//                 decoration: InputDecoration(
//                   labelText: 'To Date',
//                 ),
//                 onTap: () async {
//                   final DateTime? selectedDate = await showDatePicker(
//                     context: context,
//                     initialDate: dateRangePickerBloc.toDate ?? DateTime.now(),
//                     firstDate: DateTime(1900),
//                     lastDate: DateTime.now(),
//                   );
//                   if (selectedDate != null) {
//                     dateRangePickerBloc.add(SelectToDate(date: selectedDate));
//                     _toDateController.text = _dateFormat.format(selectedDate); // Format the selected date
//                   }
//                 },
//                 controller: _toDateController,
//               ),
//             ],
//           );
//         },
//       ),
//     );
//   }
// }

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import 'DatePicker/date_range_picker_bloc.dart';
import 'DatePicker/date_range_picker_event.dart';
import 'DatePicker/date_range_picker_state.dart';

class DateRangePickerWidget extends StatefulWidget {
  @override
  _DateRangePickerWidgetState createState() => _DateRangePickerWidgetState();
}

class _DateRangePickerWidgetState extends State<DateRangePickerWidget> {
  final _fromDateController = TextEditingController();
  final _toDateController = TextEditingController();
  final _dateFormat = DateFormat('yyyy-MM-dd');

  @override
  void dispose() {
    _fromDateController.dispose();
    _toDateController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DateRangePickerBloc(),
      child: Builder(
        builder: (context) {
          final dateRangePickerBloc = context.read<DateRangePickerBloc>();
          return Column(
            children: [
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'From Date',
                ),
                onTap: () async {
                  final DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: dateRangePickerBloc.fromDate ?? DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (selectedDate != null) {
                    if (dateRangePickerBloc.toDate != null &&
                        selectedDate.isAfter(dateRangePickerBloc.toDate!)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('From Date cannot be greater than To Date'),
                        ),
                      );
                      return;
                    }
                    dateRangePickerBloc.add(SelectFromDate(date: selectedDate));
                    _fromDateController.text = _dateFormat.format(selectedDate);
                  }
                },
                controller: _fromDateController,
              ),
              TextFormField(
                readOnly: true,
                decoration: InputDecoration(
                  labelText: 'To Date',
                ),
                onTap: () async {
                  final DateTime? selectedDate = await showDatePicker(
                    context: context,
                    initialDate: dateRangePickerBloc.toDate ?? DateTime.now(),
                    firstDate: DateTime(1900),
                    lastDate: DateTime.now(),
                  );
                  if (selectedDate != null) {
                    if (dateRangePickerBloc.fromDate != null &&
                        selectedDate.isBefore(dateRangePickerBloc.fromDate!)) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          content: Text('To Date cannot be less than From Date'),
                        ),
                      );
                      return;
                    }
                    dateRangePickerBloc.add(SelectToDate(date: selectedDate));
                    _toDateController.text = _dateFormat.format(selectedDate);
                  }
                },
                controller: _toDateController,
              ),
            ],
          );
        },
      ),
    );
  }
}
