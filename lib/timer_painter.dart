import 'dart:math' as math;
import 'package:flutter/material.dart';

class TimerPainter extends CustomPainter {
  const TimerPainter({
    this.animation,
    this.backgroundColor,
    this.color
  }): super(repaint: animation);

  final Animation<double> animation;
  final Color backgroundColor;
  final Color color;


  @override
  void paint(Canvas canvas, Size size) {
    final radius = size.width / 2.0;
    final offset = size.center(Offset.zero);

    Paint paint = Paint()
      ..color = backgroundColor
      ..strokeWidth = 5.0
      ..strokeCap = StrokeCap.round
      ..style = PaintingStyle.stroke;
    canvas.drawCircle(offset, radius, paint);

    paint.color = color;
    double progress = (1.0 - animation.value) * 2 * math.pi;
    canvas.drawArc(Offset.zero & size, math.pi * 1.5, -progress, false, paint);
  }

  @override
  bool shouldRepaint(TimerPainter oldDelegate) {
    return animation.value != oldDelegate.animation.value;
  }

}