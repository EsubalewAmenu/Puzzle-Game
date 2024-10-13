import 'package:flutter/material.dart';
import 'home_page.dart'; // Import HomePage

void main() => runApp(RiverCrossingGame());

class RiverCrossingGame extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'River Crossing Puzzle',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(), // Load HomePage initially
    );
  }
}
