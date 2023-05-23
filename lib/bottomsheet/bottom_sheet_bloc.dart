import 'package:flutter_bloc/flutter_bloc.dart';

import 'bottom_sheet_event.dart';
import 'bottom_sheet_state.dart';

class BottomSheetBloc extends Bloc<BottomSheetEvent, BottomSheetState> {
  BottomSheetBloc() : super(BottomSheetHidden()) {
    on<ShowBottomSheet>((event, emit) {
      emit(BottomSheetVisible(
        items: ['Chennai', 'Madurai', 'Coimbatore'],
      ));
    });

    on<HideBottomSheet>((event, emit) {
      emit(BottomSheetHidden());
    });

    on<ItemSelected>((event, emit) {
      final state = this.state;
      if (state is BottomSheetVisible) {
        emit(BottomSheetHidden(selectedItem: event.item));
      }
    });
  }
}