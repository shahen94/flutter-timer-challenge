import 'package:flutter/material.dart';
import 'package:timer/app.dart';

void main() => runApp(MaterialApp(
  theme: ThemeData(
    canvasColor: Colors.blueGrey,
    brightness: Brightness.dark,
    iconTheme: IconThemeData(color: Colors.white),
    accentColor: Colors.pinkAccent,
  ),
  home: App(),
));
