import 'package:flutter/material.dart';

class Boat extends StatelessWidget {
  final bool boatOnLeft;
  final Function(String) move;

  Boat(this.boatOnLeft, this.move);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(Icons.directions_boat, size: 100, color: boatOnLeft ? Colors.blue : Colors.grey),
        ElevatedButton(
          onPressed: () => move('Man'),
          child: Text('Move Boat'),
        ),
      ],
    );
  }
}
