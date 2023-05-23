import 'package:flutter_bloc/flutter_bloc.dart';

import 'CarouselEvent.dart';
import 'CarouselState.dart';

class CarouselBloc extends Bloc<CarouselEvent, CarouselState> {
  CarouselBloc() : super(CarouselLoading());

  final List<String> _imageUrls = [
    'https://picsum.photos/seed/1/600/400',
    'https://picsum.photos/seed/2/600/400',
    'https://picsum.photos/seed/3/600/400',
    'https://picsum.photos/seed/4/600/400',
    'https://picsum.photos/seed/5/600/400',
  ];

  @override
  Stream<CarouselState> mapEventToState(CarouselEvent event) async* {
    if (event is LoadCarouselImages) {
      yield* _mapLoadCarouselImagesToState();
    }
  }

  Stream<CarouselState> _mapLoadCarouselImagesToState() async* {
    yield CarouselLoading();

    try {
      // Simulate loading the images from an API
      await Future.delayed(Duration(seconds: 3));

      yield CarouselLoaded(_imageUrls);
    } catch (_) {
      yield CarouselError();
    }
  }
}