import 'package:equatable/equatable.dart';

abstract class RatingEvent extends Equatable {
  const RatingEvent();

  @override
  List<Object> get props => [];
}

class SetRatingEvent extends RatingEvent {
  final double rating;

  const SetRatingEvent(this.rating);

  @override
  List<Object> get props => [rating];
}
