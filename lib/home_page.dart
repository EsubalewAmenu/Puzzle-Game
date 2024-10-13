import 'package:flutter/material.dart';
import 'river_crossing_game.dart'; // Import your game level

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentLevel = 1; // Tracks the user's progress, starts at level 1

  List<String> _levels = ["Level 1", "Level 2", "Level 3", "Level 4", "Level 5", "Level 6", "Level 7", "Level 8", "Level 9", "Level 10"]; // List of levels
  List<bool> _unlockedLevels = [true, true, false, false, false, false, false, false, false, false]; // Lock status of levels

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('River Crossing Puzzle', style: TextStyle(fontSize: 24)),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [Colors.lightBlueAccent, Colors.blue], // Background gradient
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: SingleChildScrollView( // Wrap the entire Column in a SingleChildScrollView
          child: Column(
            children: [
              // Title Section
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  'Choose Your Level',
                  style: TextStyle(fontSize: 28, fontWeight: FontWeight.bold, color: Colors.white),
                ),
              ),
              // Horizontal Scrolling for the levels
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: List.generate(_levels.length, (index) {
                    return Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: GestureDetector(
                        onTap: () {
                          if (_unlockedLevels[index]) {
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => RiverCrossing()), // Load the corresponding game level
                            );
                          }
                        },
                        child: Container(
                          width: 150,
                          decoration: BoxDecoration(
                            color: _unlockedLevels[index] ? Colors.green[400] : Colors.grey,
                            borderRadius: BorderRadius.circular(15),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.black26,
                                offset: Offset(0, 4),
                                blurRadius: 8,
                              ),
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(10),
                                child: Icon(
                                  _unlockedLevels[index] ? Icons.check : Icons.lock,
                                  color: Colors.white,
                                  size: 50,
                                ),
                              ),
                              Text(
                                _levels[index],
                                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
                                textAlign: TextAlign.center,
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              // Settings and other buttons
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    _buildIconButton(Icons.settings, () {
                      // Navigate to settings
                    }),
                    _buildIconButton(Icons.emoji_events, () {
                      // Navigate to achievements
                    }),
                    _buildIconButton(Icons.info, () {
                      // Navigate to other info or pages
                    }),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  // Helper function to build icon buttons
  Widget _buildIconButton(IconData icon, VoidCallback onPressed) {
    return IconButton(
      icon: Icon(icon, size: 30, color: Colors.white),
      onPressed: onPressed,
    );
  }
}
