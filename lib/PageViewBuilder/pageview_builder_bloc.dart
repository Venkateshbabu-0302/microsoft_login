// import 'dart:async';
// import 'package:bloc/bloc.dart';
// import 'package:flutter_microsoft_login/PageViewBuilder/pageview_builder_event.dart';
// import 'package:flutter_microsoft_login/PageViewBuilder/pageview_builder_state.dart';
//
// class PageViewBloc extends Bloc<PageViewEvent, PageViewState> {
//   PageViewBloc() : super(PageChangedState(0));
//
//   @override
//   Stream<PageViewState> mapEventToState(PageViewEvent event) async* {
//     if (event is PageChangedEvent) {
//       yield PageChangedState(event.currentPage);
//     }
//   }
// }


import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_microsoft_login/PageViewBuilder/pageview_builder_event.dart';
import 'package:flutter_microsoft_login/PageViewBuilder/pageview_builder_state.dart';

class PageViewBloc extends Bloc<PageViewEvent, PageViewState> {
  List<List<String>> _dataList = [
    ["Data 1-1", "Data 1-2", "Data 1-3"],
    ["Data 2-1", "Data 2-2", "Data 2-3"],
    ["Data 3-1", "Data 3-2", "Data 3-3"]
  ];

  PageViewBloc() : super(PageLoadingState());

  @override
  Stream<PageViewState> mapEventToState(PageViewEvent event) async* {
    if (event is PageChangedEvent) {
      yield PageLoadedState(_dataList[event.page].cast<List<String>>());
    }
  }
}