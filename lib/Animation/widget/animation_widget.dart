import 'package:flutter/material.dart';

import '../animation_bloc.dart';
import '../animation_event.dart';
import '../animation_state.dart';

class AnimationWidget extends StatefulWidget {
  @override
  _AnimationWidgetState createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget>
    with TickerProviderStateMixin {
  late final AnimationBloc _animationBloc;
  late final Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animationBloc = AnimationBloc(this);
    _animation = _animationBloc.controller.drive(
      Tween<double>(
        begin: 0.0,
        end: 4.0,
      ).chain(
        CurveTween(curve: Curves.bounceInOut),
      ),
    );
    _animationBloc.stream.listen((state) {
      if (state is AnimationComplete) {
        _animationBloc.add(StopAnimation());
      }
    });
  }

  @override
  void dispose() {
    _animationBloc.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: AnimatedBuilder(
          animation: _animation,
          builder: (context, child) {
            return Transform.scale(
              scale: _animation.value,
              child: child,
            );
          },
          child: Container(
            width: 100.0,
            height: 100.0,
            color: Colors.blue,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          _animationBloc.add(StartAnimation());
        },
        child: Icon(Icons.play_arrow),
      ),
    );
  }
}
