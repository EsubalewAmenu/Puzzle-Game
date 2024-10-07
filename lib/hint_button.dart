import 'package:flutter/material.dart';

class HintButton extends StatelessWidget {
  final bool lionOnLeft;
  final bool goatOnLeft;
  final bool grassOnLeft;

  HintButton({
    required this.lionOnLeft,
    required this.goatOnLeft,
    required this.grassOnLeft,
  });

  void _showHint(BuildContext context) {
    String hint;
    if (lionOnLeft && goatOnLeft && grassOnLeft) {
      hint = 'Take the goat across first.';
    } else if (!goatOnLeft && lionOnLeft && grassOnLeft) {
      hint = 'Go back alone and take the lion next.';
    } else if (!lionOnLeft && goatOnLeft && grassOnLeft) {
      hint = 'Take the goat back, then take the grass across.';
    } else {
      hint = 'Try different combinations, but avoid leaving the lion with the goat or the goat with the grass.';
    }

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Hint'),
          content: Text(hint),
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
      onPressed: () => _showHint(context),
      child: Text('Hint'),
    );
  }
}
