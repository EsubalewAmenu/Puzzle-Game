import 'package:flutter/material.dart';

class GameRulesButton extends StatelessWidget {
  const GameRulesButton({Key? key}) : super(key: key);

  void _showGameRules(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Game Rules'),
          content: Text(
            '1. The boat can carry only the man and one item at a time.\n'
                '2. The lion will eat the goat if left alone together.\n'
                '3. The goat will eat the grass if left alone together.\n'
                '4. The man can prevent any eating if present.\n'
                'Objective: Safely get the lion, goat, and grass across the river.',
          ),
          actions: <Widget>[
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text('Close'),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => _showGameRules(context),
      child: Text('Game Rules'),
    );
  }
}
