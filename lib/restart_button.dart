import 'package:flutter/material.dart';

class RestartButton extends StatelessWidget {
  final VoidCallback onRestart;

  RestartButton({required this.onRestart});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onRestart,
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.red,
      ),
      child: Text('Restart Game'),
    );
  }
}
