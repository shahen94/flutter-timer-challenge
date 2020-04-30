import 'package:flutter/material.dart';

typedef String StringFetcher();

class TimerText extends StatelessWidget {
  const TimerText({Key key, this.text, this.animation}) : super(key: key);

  final StringFetcher text;
  final Animation<double> animation;

  Widget _builder(BuildContext context, Widget child) {
    ThemeData theme = Theme.of(context);
    return Text(
      text(),
      style: theme.textTheme.display4,      
    );
  }

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: FractionalOffset.center,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text(
            "Count down",
            style: Theme.of(context).textTheme.subhead,
          ),
          AnimatedBuilder(
            animation: animation,
            builder: _builder,
          )
        ],
      ),
    );
  }
}