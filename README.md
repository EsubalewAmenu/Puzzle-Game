# Play-to-Earn ADA Puzzle Game

## Overview

This repository contains the logic puzzle game integrating a **Play-to-Earn ADA** feature. The concept is designed to showcase how players can be rewarded with ADA cryptocurrency for completing in-game puzzles. The first level, based on the classic **"Man, Lion, Goat, and Grass" river crossing riddle**, is already implemented. Our P2E system rewards players with ADA after they complete a level and view ad content that generates revenue above the 1 ADA threshold.

## Key Features

- **Logic Puzzle Gameplay**: Players solve classic puzzles, beginning with the "Man, Lion, Goat, and Grass" river crossing riddle.
- **Play-to-Earn ADA**: Players earn ADA cryptocurrency by completing levels.
- **Ad-based Revenue**: Upon completing a level, an ad is displayed to the player, generating revenue.
    - Ads are designed to generate revenue greater than or equal to 1 ADA.
    - After viewing the ad, players are rewarded 1 ADA for each level completed.
- **Free-to-Play**: No entry cost; users can play for free and earn ADA.

## Game Concept: "Man, Lion, Goat, and Grass" Riddle

The player must help a man cross a river with a lion, a goat, and some grass. The boat can only carry the man and one other item at a time, and the player must solve how to cross the river without the lion eating the goat or the goat eating the grass.

## Gameplay

1. The user selects a level to play.
2. After solving the puzzle, the player is shown an ad.
3. Once the ad completes, the player earns 1 ADA as a reward for completing the level.

## Monetization Model

- The P2E feature is powered by ad revenue. Each ad displayed after a completed level generates income greater than or equal to 1 ADA.
- Players are only rewarded with ADA when ad revenue is generated above 1 ADA.
- This concept can be applied to other games globally, and we aim to develop a standard Play-to-Earn ADA system for different genres and platforms.

## Roadmap

- [x] Develop the **"Man, Lion, Goat, and Grass"** riddle level.
- [ ] Add more logic puzzles and levels.
- [ ] Refine the Play-to-Earn ADA system.
- [ ] Expand Play-to-Earn ADA integration to multiple game genres and platforms.

Here's an improved **Installation & Setup** section tailored for a Flutter project:

## Installation & Setup

### Prerequisites

Before you begin, ensure you have the following installed on your development environment:

- [Flutter SDK](https://flutter.dev/docs/get-started/install)
- [Dart SDK](https://dart.dev/get-dart)
- [Android Studio](https://developer.android.com/studio) (for Android development) or Xcode (for iOS development)
- An IDE with Flutter support (e.g., [Visual Studio Code](https://code.visualstudio.com/) or Android Studio)

### Steps

1. **Clone the repository**:
   ```bash
   git clone https://github.com/EsubalewAmenu/Puzzle-Game
   ```

2. **Navigate to the project directory**:
   ```bash
   cd Puzzle-Game
   ```

3. **Install Flutter dependencies**:
   Run the following command to install the necessary dependencies for the project:
   ```bash
   flutter pub get
   ```

4. **Set up your development environment**:

    - **For Android**: Ensure you have an Android emulator set up in Android Studio or a physical Android device connected.
    - **For iOS**: Make sure you have Xcode installed and configured. Also, connect a physical iOS device or use an iOS simulator.

5. **Run the project**:
   To launch the project on a connected device or simulator, use the following command:
   ```bash
   flutter run
   ```

   This will build and run the app on your selected platform (Android or iOS).

### Troubleshooting

- If you encounter any issues, make sure your Flutter environment is correctly set up by running:
  ```bash
  flutter doctor
  ```
  This command will highlight any missing dependencies or configuration issues.


## How to Play

1. Start the game by selecting a puzzle.
2. Solve the puzzle by making the right moves.
3. After completion, watch an ad.
4. Receive 1 ADA as a reward.

## Contributing

We welcome contributions from the community! If you'd like to help improve the game or integrate new Play-to-Earn features, please feel free to open a pull request or an issue.

## License

This project is licensed under the MIT License.