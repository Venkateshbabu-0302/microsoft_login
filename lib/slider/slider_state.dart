abstract class SliderState {}

class SliderInitial extends SliderState {}

class SliderValueChangedSuccess extends SliderState {
  final double value;

  SliderValueChangedSuccess(this.value);
}