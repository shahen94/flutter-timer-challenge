import 'package:flutter/material.dart';
import 'package:timer/widgets/timer_actions.dart';
import 'package:timer/widgets/timer_circle.dart';
import 'package:timer/widgets/timer_text.dart';

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> with SingleTickerProviderStateMixin {
  AnimationController _controller;

  String get timerString {
    Duration duration = _controller.duration * _controller.value;
    return '${duration.inMinutes}:${(duration.inSeconds % 60).toString().padLeft(2, '0')}';
  }

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 20)
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            TimerCircle(
              animation: _controller,
              child: TimerText(
                animation: _controller,
                text: () => timerString,
              ),
            ),
            TimerActions(controller: _controller)
          ],
        ),
      ),
    );
  }
}