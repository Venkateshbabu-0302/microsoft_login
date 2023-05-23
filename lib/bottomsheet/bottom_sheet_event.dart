abstract class BottomSheetEvent {}

class ShowBottomSheet extends BottomSheetEvent {}

class HideBottomSheet extends BottomSheetEvent {}

class ItemSelected extends BottomSheetEvent {
  final String item;

  ItemSelected(this.item);
}