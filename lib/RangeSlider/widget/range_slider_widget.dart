import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../range_slider_bloc.dart';
import '../range_slider_event.dart';
import '../range_slider_state.dart';


class RangeSliderWidget extends StatelessWidget {
  final RangeSliderBloc _rangeSliderBloc = RangeSliderBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RangeSliderBloc, RangeSliderState>(
      bloc: _rangeSliderBloc,
      builder: (context, state) {
        RangeValues values = const RangeValues(0, 100);
        if (state is RangeSliderChangedSuccess) {
          values = state.values;
        }
        return Column(
          children: [
            RangeSlider(
              values: values,
              min: 0,
              max: 100,
              onChanged: (newValues) {
                _rangeSliderBloc.add(RangeSliderChanged(newValues));
              },
              labels: RangeLabels(
                '${values.start.toStringAsFixed(0)}',
                '${values.end.toStringAsFixed(0)}',
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('${values.start.toStringAsFixed(0)}'),
                Text('${values.end.toStringAsFixed(0)}'),
              ],
            ),
          ],
        );
      },
    );
  }
}
