// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
//
// import '../pageview_builder_bloc.dart';
// import '../pageview_builder_event.dart';
// import '../pageview_builder_state.dart';
//
// class MyPageViewWidget extends StatefulWidget {
//   @override
//   _MyPageViewWidgetState createState() => _MyPageViewWidgetState();
// }
//
// class _MyPageViewWidgetState extends State<MyPageViewWidget> {
//   final _pageController = PageController();
//
//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<PageViewBloc, PageViewState>(
//       builder: (context, state) {
//         return PageView(
//           controller: _pageController,
//           onPageChanged: (page) {
//             BlocProvider.of<PageViewBloc>(context).add(PageChangedEvent(page));
//           },
//           children: [
//             Container(
//               color: Colors.red,
//             ),
//             Container(
//               color: Colors.green,
//             ),
//             Container(
//               color: Colors.blue,
//             ),
//           ],
//         );
//       },
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../pageview_builder_bloc.dart';
import '../pageview_builder_event.dart';
import '../pageview_builder_state.dart';

class MyPageViewWidget extends StatefulWidget {
  @override
  _MyPageViewWidgetState createState() => _MyPageViewWidgetState();
}

class _MyPageViewWidgetState extends State<MyPageViewWidget> {
  final _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PageViewBloc, PageViewState>(
      builder: (context, state) {
        if (state is PageLoadingState) {
          // Show loading indicator or placeholder
          return Container();
        } else if (state is PageLoadedState) {
          // Display data for current page
          return PageView(
            controller: _pageController,
            onPageChanged: (page) {
              BlocProvider.of<PageViewBloc>(context)
                  .add(PageChangedEvent(page));
            },
            children: state.dataList.map((data) {
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data[index]),
                  );
                },
              );
            }).toList(),
          );
        } else {
          // Handle other states
          return SizedBox.shrink();
        }
      },
    );
  }
}