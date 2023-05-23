import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';
import 'package:meta/meta.dart';

import 'location_event.dart';
import 'location_state.dart';

class LocationBloc extends Bloc<LocationEvent, LocationState> {
  LocationBloc() : super(LocationInitial()) {
    // Register event handler for GetCurrentLocation event
    on<GetCurrentLocation>((event, emit) => _mapGetCurrentLocationToState(event, emit));
  }

  void _mapGetCurrentLocationToState(GetCurrentLocation event, Emitter<LocationState> emit) async {
    emit(LocationLoading());

    try {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      emit(LocationLoaded(position, 0.0));
    } catch (e) {
      emit(LocationError(e.toString()));
    }
  }
}
