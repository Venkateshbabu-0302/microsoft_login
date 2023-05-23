// abstract class PageViewState {}
//
// class PageChangedState extends PageViewState {
//   final int currentPage;
//
//   PageChangedState(this.currentPage);
// }

abstract class PageViewState {}

class PageLoadingState extends PageViewState {}

class PageLoadedState extends PageViewState {
  final List<List<String>> dataList;

  PageLoadedState(this.dataList);
}