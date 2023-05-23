import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../rating_bar_bloc.dart';
import '../rating_bar_event.dart';

class MyRatingBar extends StatelessWidget {
  final RatingBloc ratingBloc;
  final Key? key;

  const MyRatingBar({required this.ratingBloc, this.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<RatingBloc, RatingState>(
      bloc: ratingBloc,
      builder: (context, state) {
        double currentRating = 0.0;
        if (state is InitialRatingState) {
          currentRating = 0.0;
        } else if (state is UpdatedRatingState) {
          currentRating = state.rating;
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RatingBar.builder(
              initialRating: currentRating,
              minRating: 0,
              direction: Axis.horizontal,
              allowHalfRating: true,
              itemCount: 5,
              itemSize: 40,
              itemBuilder: (context, _) => Icon(
                Icons.star,
                color: Colors.amber,
              ),
              onRatingUpdate: (rating) {
                ratingBloc.add(SetRatingEvent(rating));
              },
            ),
            SizedBox(height: 10),
            Text(
              'Selected Rating: ${currentRating.toStringAsFixed(1)}',
              style: TextStyle(fontSize: 20),
            ),
          ],
        );
      },
    );
  }
}

