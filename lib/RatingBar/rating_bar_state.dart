part of 'rating_bar_bloc.dart';

@immutable
abstract class RatingState {}

class InitialRatingState extends RatingState {}

class UpdatedRatingState extends RatingState {
  final double rating;

  UpdatedRatingState(this.rating);
}
