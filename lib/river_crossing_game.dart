import 'package:flutter/material.dart';
import 'riverbank.dart';
import 'boat.dart';

class RiverCrossing extends StatefulWidget {
  @override
  _RiverCrossingState createState() => _RiverCrossingState();
}

class _RiverCrossingState extends State<RiverCrossing> {
  bool lionOnLeft = true;
  bool goatOnLeft = true;
  bool grassOnLeft = true;
  bool manOnLeft = true;
  bool boatOnLeft = true;

  String message = 'Try to get everyone across the river!';
  bool gameFinished = false; // Flag to track game status

  void move(String item) {
    if (gameFinished) return; // Prevent moving if the game is finished

    setState(() {
      if (boatOnLeft == manOnLeft) {
        switch (item) {
          case 'Lion':
            if (lionOnLeft == manOnLeft) lionOnLeft = !lionOnLeft;
            break;
          case 'Goat':
            if (goatOnLeft == manOnLeft) goatOnLeft = !goatOnLeft;
            break;
          case 'Grass':
            if (grassOnLeft == manOnLeft) grassOnLeft = !grassOnLeft;
            break;
        }
        boatOnLeft = !boatOnLeft;
        manOnLeft = !manOnLeft;
        _checkGameState();
      }
    });
  }

  void _checkGameState() {
    if (!lionOnLeft && !goatOnLeft && !grassOnLeft && !manOnLeft) {
      setState(() {
        message = 'Congratulations! Everyone is safely across the river!';
        gameFinished = true; // Set the game as finished
      });
    } else if (lionOnLeft == goatOnLeft && manOnLeft != lionOnLeft) {
      setState(() {
        message = 'Game Over! The lion ate the goat!';
        gameFinished = true; // Set the game as finished
      });
    } else if (goatOnLeft == grassOnLeft && manOnLeft != goatOnLeft) {
      setState(() {
        message = 'Game Over! The goat ate the grass!';
        gameFinished = true; // Set the game as finished
      });
    } else {
      message = 'Keep going!';
    }
  }

  void restartGame() {
    setState(() {
      lionOnLeft = true;
      goatOnLeft = true;
      grassOnLeft = true;
      manOnLeft = true;
      boatOnLeft = true;
      message = 'Try to get everyone across the river!';
      gameFinished = false; // Reset the game status
    });
  }

  // Show Game Rules
  void _showGameRules() {
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

  // Show Hint
  void _showHint() {
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
    return Scaffold(
      appBar: AppBar(title: Text('River Crossing Puzzle')),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(message, style: TextStyle(fontSize: 18)),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Riverbank(
                side: 'left',
                lion: lionOnLeft,
                goat: goatOnLeft,
                grass: grassOnLeft,
                man: manOnLeft,
              ),
              Boat(boatOnLeft, move),
              Riverbank(
                side: 'right',
                lion: !lionOnLeft,
                goat: !goatOnLeft,
                grass: !grassOnLeft,
                man: !manOnLeft,
              ),
            ],
          ),
          SizedBox(height: 20),
          Text("Who will you move?"),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: gameFinished ? null : () => move('Lion'), // Disable if game is finished
                child: Text('Move Lion'),
              ),
              ElevatedButton(
                onPressed: gameFinished ? null : () => move('Goat'), // Disable if game is finished
                child: Text('Move Goat'),
              ),
              ElevatedButton(
                onPressed: gameFinished ? null : () => move('Grass'), // Disable if game is finished
                child: Text('Move Grass'),
              ),
            ],
          ),
          SizedBox(height: 20),
          ElevatedButton(
            onPressed: restartGame,
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.red,
            ),
            child: Text('Restart Game'),
          ),
          SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              ElevatedButton(
                onPressed: _showGameRules,
                child: Text('Game Rules'),
              ),
              ElevatedButton(
                onPressed: _showHint,
                child: Text('Hint'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
