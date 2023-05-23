// abstract class PageViewEvent {}
//
// class PageChangedEvent extends PageViewEvent {
//   final int currentPage;
//
//   PageChangedEvent(this.currentPage);
// }


import 'package:flutter_bloc/flutter_bloc.dart';

// Define events
abstract class PageViewEvent {}

class PageChangedEvent extends PageViewEvent {
  final int page;

  PageChangedEvent(this.page);
}