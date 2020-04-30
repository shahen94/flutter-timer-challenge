import 'package:flutter/material.dart';
import 'package:timer/timer_painter.dart';

class TimerCircle extends StatelessWidget {
  const TimerCircle({Key key, this.animation, this.child}) : super(key: key);

  final Animation animation;
  final Widget child;

  Widget _builder(BuildContext context, Widget child) {
    ThemeData theme = Theme.of(context);
    return CustomPaint(
      painter: TimerPainter(
        animation: animation,
        backgroundColor: Colors.white,
        color: theme.indicatorColor
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Align(
        alignment: FractionalOffset.center,
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Stack(
            children: <Widget>[
              Positioned.fill(
                child: AnimatedBuilder(
                  animation: animation,
                  builder: _builder,
                )
              ),
              child,
            ],
          ),
        ),
      ),
    );
  }
}
