import 'package:flutter/material.dart';

class Boat extends StatelessWidget {
  final bool onLeft;
  final Function moveCallback;

  Boat(this.onLeft, this.moveCallback);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset('assets/images/boat.png', width: 50, height: 50),
        Text(onLeft ? 'On Left Bank' : 'On Right Bank', style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
