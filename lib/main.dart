import 'package:flutter/material.dart';
import 'package:riddle2/river_crossing_game.dart';

void main() => runApp(RiverCrossingGame());

class RiverCrossingGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'River Crossing Puzzle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: RiverCrossing(),
    );
  }
}
