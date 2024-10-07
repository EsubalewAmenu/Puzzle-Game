import 'package:flutter/material.dart';

class Riverbank extends StatelessWidget {
  final String side;
  final bool lion, goat, grass, man;

  Riverbank({required this.side, required this.lion, required this.goat, required this.grass, required this.man});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('$side side', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        SizedBox(height: 10),
        if (lion) Icon(Icons.pets, size: 50, color: Colors.orange),
        if (goat) Icon(Icons.pets, size: 50, color: Colors.grey),
        if (grass) Icon(Icons.grass, size: 50, color: Colors.green),
        if (man) Icon(Icons.person, size: 50, color: Colors.blue),
      ],
    );
  }
}
