import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../slider_bloc.dart';
import '../slider_event.dart';
import '../slider_state.dart';

class SliderWidget extends StatelessWidget {
  final SliderBloc _sliderBloc = SliderBloc();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SliderBloc, SliderState>(
      bloc: _sliderBloc,
      builder: (context, state) {
        double value = 0.0;
        if (state is SliderValueChangedSuccess) {
          value = state.value;
        }
        return Column(
          children: [
            Slider(
              min: 0,
              max: 100,
              value: value,
              onChanged: (newValue) {
                _sliderBloc.add(SliderValueChanged(newValue));
              },
            ),
            Text(
              'Value: ${value.toStringAsFixed(2)}',
              style: TextStyle(fontSize: 16),
            ),
          ],
        );
      },
    );
  }
}
