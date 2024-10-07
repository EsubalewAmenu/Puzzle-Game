import 'package:flutter/material.dart';
import 'riverbank.dart';
import 'boat.dart';
import 'restart_button.dart';
import 'game_rules_button.dart';
import 'hint_button.dart';

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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/river_background.jpg'), // River background
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(message, style: TextStyle(fontSize: 18, color: Colors.white)),
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
                  onItemTapped: move,
                ),
                Boat(boatOnLeft, move),
                Riverbank(
                  side: 'right',
                  lion: !lionOnLeft,
                  goat: !goatOnLeft,
                  grass: !grassOnLeft,
                  man: !manOnLeft,
                  onItemTapped: move,
                ),
              ],
            ),
            SizedBox(height: 20),
            RestartButton(onRestart: restartGame),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GameRulesButton(),
                HintButton(
                  lionOnLeft: lionOnLeft,
                  goatOnLeft: goatOnLeft,
                  grassOnLeft: grassOnLeft,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
