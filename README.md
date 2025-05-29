<!--
This README describes the package. If you publish this package to pub.dev,
this README's contents appear on the landing page for your package.

For information about how to write a good package README, see the guide for
[writing package pages](https://dart.dev/tools/pub/writing-package-pages).

For general information about developing packages, see the Dart guide for
[creating packages](https://dart.dev/guides/libraries/create-packages)
and the Flutter guide for
[developing packages and plugins](https://flutter.dev/to/develop-packages).
-->

# Bridge Package

**Bridge** is a Dart package designed to help developers manage and calculate the logic behind the classic card game Bridge. It includes functionality for representing contracts, calculating scores, managing game records, handling vulnerability rules, and more. This package can be easily integrated into any Dart or Flutter project that involves Bridge game logic.

## Features

- **Game Records**: Keeps track of game records, including contract details, tricks taken, and scores.
- **Contract Calculation**: Computes scores based on contract type (e.g., doubled, redoubled), suit, and tricks taken.
- **Vulnerability Rules**: Implements vulnerability rules based on the board number and declarer position.
- **Score Calculation**: Includes functions for scoring, including the calculation of IMPs (International Match Points) for competitive bridge games.
- **Flexible Game Types**: Supports both single-table and match-style games, making it versatile for different formats.

## Getting Started

To get started with the `bridge` package, you need to add it to your `pubspec.yaml` file:

```yaml
dependencies:
  bridge_game: ^1.1.33
