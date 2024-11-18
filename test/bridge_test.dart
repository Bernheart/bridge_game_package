import 'package:flutter_test/flutter_test.dart';
import 'package:bridge_game/bridge_game.dart'; // Import your package here

void main() {
  group('GameRecord tests', () {
    test('calculates tricksNeeded correctly', () {
      // Create an instance of GameRecord
      final record = GameRecord(
        boardNumber: 1,
        level: 3,
        suit: Suit.spades, // Assuming Suit is an enum
        contractType: ContractType.notDoubled,
        declarer: Direction.north,
        tricksTaken: 9,
      );

      // Check if tricksNeeded is calculated correctly
      expect(record.tricksNeeded(), 9); // 3 (level) + 6
    });

    test('calculates scoreDisplay correctly', () {
      final record = GameRecord(
        boardNumber: 1,
        level: 3,
        suit: Suit.spades,
        contractType: ContractType.doubled,
        declarer: Direction.north,
        tricksTaken: 9,
      );

      // Test score display (assuming the score logic is correct)
      expect(record.scoreDisplay(), '+530'); // Example based on your logic
    });
  });

  group('SingleTableGame tests', () {
    test('updates score correctly', () {
      final game = SingleTableGame(name: 'Game 1');
      final record = SingleTableGameRecord(
        boardNumber: 1,
        level: 3,
        suit: Suit.spades,
        contractType: ContractType.notDoubled,
        declarer: Direction.north,
        tricksTaken: 9,
        hcpNS: 15,
        hcpRegardingTo: "NS",
      );

      game.addRecord(record);

      // Expect the score to update correctly
      expect(game.scoreNS, greaterThan(0));
    });
  });
}
