import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../CarouselEvent.dart';
import '../CarouselState.dart';
import '../carouselBloc.dart';



class CarouselPage extends StatefulWidget {
  @override
  _CarouselPageState createState() => _CarouselPageState();
}

class _CarouselPageState extends State<CarouselPage> {
  late CarouselBloc _carouselBloc;

  @override
  void initState() {
    super.initState();
    _carouselBloc = CarouselBloc();
    _carouselBloc.add(LoadCarouselImages());
  }

  @override
  void dispose() {
    _carouselBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carousel Slider Example'),
      ),
      body: BlocBuilder<CarouselBloc, CarouselState>(
          builder: (context, state) {
            if (state is CarouselLoading) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is CarouselLoaded) {
              return CarouselSlider(
                options: CarouselOptions(
                  autoPlay: true,
                  aspectRatio: 2.0,
                  enlargeCenterPage: true,
                ),
                items: state.images
                    .map(
                      (item) => Container(
                    child: Center(
                      child: Image.network(
                        item,
                        fit: BoxFit.cover,
                        width: 1000,
                      ),
                    ),
                  ),
                )
                    .toList(),
              );
            } else {
              return Container();
            }
          }
      ),
    );
  }
}
