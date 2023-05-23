import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bottom_sheet_bloc.dart';
import '../bottom_sheet_event.dart';
import '../bottom_sheet_state.dart';

class BottomSheetWidget extends StatelessWidget {
  const BottomSheetWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final BottomSheetBloc bottomSheetBloc =
    BlocProvider.of<BottomSheetBloc>(context);

    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Sheet'),
      ),
      body: Center(
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                bottomSheetBloc.add(ShowBottomSheet());
              },
              child: Text('Show Bottom Sheet'),
            ),
            SizedBox(height: 16),
            BlocBuilder<BottomSheetBloc, BottomSheetState>(
              builder: (context, state) {
                print('state.selectedItem');
                print(state);
                if (state is BottomSheetHidden &&
                    state.selectedItem.isNotEmpty) {
                  return Text(
                   state.selectedItem,
                    style: TextStyle(fontSize: 18, color: Colors.black87),
                  );
                } else{
                  return Container();
                }
              },
            ),
          ],
        ),
      ),
      bottomSheet: BlocBuilder<BottomSheetBloc, BottomSheetState>(
        builder: (context, state) {
          if (state is BottomSheetVisible) {
            return Container(
              width: double.infinity,
              height:300,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20.0),
                  topRight: Radius.circular(20.0),
                ),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.9),
                    spreadRadius: 10,
                    blurRadius: 7,
                    offset: Offset(0, 3), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Select the Location',
                          style: TextStyle(fontSize: 22, color: Colors.black,fontWeight: FontWeight.bold),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.grey.withOpacity(0.5),
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          child: IconButton(
                            icon: Icon(Icons.close),
                            color: Colors.black,
                            onPressed: () {
                              bottomSheetBloc.add(HideBottomSheet());
                            },
                          ),
                        ),

                      ],
                    ),
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: state.items.length,
                      itemBuilder: (context, index) {
                        return ListTile(
                          leading: Icon(Icons.location_on),
                          title: Text(state.items[index]),
                          onTap: () {
                            bottomSheetBloc.add(
                              ItemSelected(state.items[index]),
                            );
                          },
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          } else if (state is BottomSheetHidden) {
            return SizedBox.shrink();
          }
          return SizedBox.shrink();
        },
      ),

    );
  }
}
