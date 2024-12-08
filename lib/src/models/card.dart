import 'package:bridge_game/bridge_game.dart';
import 'dart:math';

Map<dynamic, int> cardToInt = {
  2: 2,
  3: 3,
  4: 4,
  5: 5,
  6: 6,
  7: 7,
  8: 8,
  9: 9,
  10: 10,
  'T': 10,
  'J': 11,
  'Q': 12,
  'K': 13,
  'A': 14,
};

class Card extends Displayable {
  dynamic value;
  Suit suit;

  Card({required this.value, required this.suit});

  @override
  String display() => '${suit.display()}$value';
  @override
  String toString() => value.toString();
  int points() => max(cardToInt[value]! - 10, 0);
  bool operator <(Card other) => cardToInt[value]! < cardToInt[other.value]!;
  bool operator >(Card other) => cardToInt[value]! > cardToInt[other.value]!;
  @override
  // ignore: hash_and_equals
  bool operator ==(Object other) =>
      cardToInt[value]! == cardToInt[(other as Card).value]! &&
      suit == other.suit;
}
