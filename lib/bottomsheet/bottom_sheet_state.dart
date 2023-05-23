abstract class BottomSheetState {}

class BottomSheetHidden extends BottomSheetState {
  final String selectedItem;

  BottomSheetHidden({this.selectedItem = ''});
}

class BottomSheetVisible extends BottomSheetState {
  final List<String> items;

  BottomSheetVisible({required this.items});
}
