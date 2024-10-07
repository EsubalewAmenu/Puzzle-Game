import 'package:flutter/material.dart';

class Riverbank extends StatelessWidget {
  final String side;
  final bool lion;
  final bool goat;
  final bool grass;
  final bool man;

  Riverbank({required this.side, required this.lion, required this.goat, required this.grass, required this.man});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Man
        Visibility(
          visible: man,
          child: Image.asset('assets/images/man.png', width: 50, height: 50),
        ),
        // Lion
        Visibility(
          visible: lion,
          child: Image.asset('assets/images/lion.png', width: 50, height: 50),
        ),
        // Goat
        Visibility(
          visible: goat,
          child: Image.asset('assets/images/goat.png', width: 50, height: 50),
        ),
        // Grass
        Visibility(
          visible: grass,
          child: Image.asset('assets/images/grass.png', width: 50, height: 50),
        ),
        Text(side == 'left' ? 'Left Bank' : 'Right Bank', style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
