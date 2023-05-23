import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../time_picker_bloc.dart';
import '../time_picker_event.dart';
import '../time_picker_state.dart';


class TimeSelectionWidget extends StatefulWidget {
  @override
  _TimeSelectionWidgetState createState() => _TimeSelectionWidgetState();
}

class _TimeSelectionWidgetState extends State<TimeSelectionWidget> {
  final _timeSelectionBloc = TimeSelectionBloc();
  late TimeOfDay _selectedTime;
  final _textController = TextEditingController();
  final _textController1 = TextEditingController();


  @override
  void initState() {
    super.initState();
    _selectedTime = TimeOfDay.now();
    _textController.text = '';
  }

  @override
  void dispose() {
    _timeSelectionBloc.close();
    _textController.dispose();
    super.dispose();
  }

  // 12 hours
  void _showTimePicker() async {
    final TimeOfDay? selectedTime = await showTimePicker(
        context: context, initialTime: _selectedTime);

    if (selectedTime != null) {
      _selectedTime = selectedTime;
      _timeSelectionBloc.add(TimeSelectedEvent(time: _selectedTime));
      _textController.text = _selectedTime.format(context);
    }
  }

  // 24 hours
  void _show24TimePicker() async {
    final TimeOfDay? selectedTime = await showTimePicker(
      context: context,
      initialTime: _selectedTime,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: child!,
        );
      },
    );

    if (selectedTime != null) {
      _selectedTime = selectedTime;
      _timeSelectionBloc.add(TimeSelectedEvent(time: _selectedTime));
      _textController1.text = DateFormat.Hm().format(DateTime(2000, 1, 1, _selectedTime.hour, _selectedTime.minute));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        TextFormField(
          readOnly: true,
          controller: _textController,
          onTap: _showTimePicker,
          decoration: InputDecoration(
            hintText: 'Select Time',
          ),
        ),
        TextFormField(
          readOnly: true,
          controller: _textController1,
          onTap: _show24TimePicker,
          decoration: InputDecoration(
            hintText: 'Select Time',
          ),
        ),
      ],
    );
  }
}
