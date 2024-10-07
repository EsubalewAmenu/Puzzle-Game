import 'package:flutter/material.dart';

class Boat extends StatelessWidget {
  final bool boatOnLeft;
  final Function(String) onItemTapped;

  Boat(this.boatOnLeft, this.onItemTapped);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onItemTapped('Boat'), // Optionally handle boat taps
      child: Container(
        padding: EdgeInsets.all(8.0),
        child: Image.asset(
          'assets/images/boat.png', // Replace with your boat image asset
          width: 100,
          alignment: boatOnLeft ? Alignment.centerLeft : Alignment.centerRight,
        ),
      ),
    );
  }
}
