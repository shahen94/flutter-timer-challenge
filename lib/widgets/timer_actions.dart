import 'package:flutter/material.dart';

class TimerActions extends StatelessWidget {
  const TimerActions({Key key, this.controller}) : super(key: key);

  final AnimationController controller;

  _onPlaybackAction() {
    if (controller.isAnimating) {
      controller.stop();
    } else {
      controller.reverse(
        from: controller.value == 0.0 ? 1.0 : controller.value
      );
    }
  }

  Widget _builder(BuildContext context, Widget child) {
    final IconData icon = controller.isAnimating
      ? Icons.pause
      : Icons.play_arrow;

    return new Icon(icon);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          FloatingActionButton(
            onPressed: _onPlaybackAction,
            child: AnimatedBuilder(
              animation: controller,
              builder: _builder,
            ),
          )
        ],
      ),
    );
  }
}
