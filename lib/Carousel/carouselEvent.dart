import 'package:equatable/equatable.dart';

abstract class CarouselEvent extends Equatable {
  const CarouselEvent();

  @override
  List<Object> get props => [];
}

class LoadCarouselImages extends CarouselEvent {}