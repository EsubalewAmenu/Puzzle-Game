import 'package:flutter/material.dart';

class Riverbank extends StatelessWidget {
  final String side;
  final bool lion;
  final bool goat;
  final bool grass;
  final bool man;
  final Function(String) onItemTapped;

  Riverbank({
    required this.side,
    required this.lion,
    required this.goat,
    required this.grass,
    required this.man,
    required this.onItemTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        if (man)
          GestureDetector(
            onTap: () => onItemTapped('Man'),
            child: Image.asset('assets/images/man.png', width: 50),
          ),
        if (lion)
          GestureDetector(
            onTap: () => onItemTapped('Lion'),
            child: Image.asset('assets/images/lion.png', width: 50),
          ),
        if (goat)
          GestureDetector(
            onTap: () => onItemTapped('Goat'),
            child: Image.asset('assets/images/goat.png', width: 50),
          ),
        if (grass)
          GestureDetector(
            onTap: () => onItemTapped('Grass'),
            child: Image.asset('assets/images/grass.png', width: 50),
          ),
        Text(side, style: TextStyle(color: Colors.white)),
      ],
    );
  }
}
