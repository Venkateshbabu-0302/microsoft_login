abstract class SliderEvent {}

class SliderValueChanged extends SliderEvent {
  final double value;

  SliderValueChanged(this.value);
}