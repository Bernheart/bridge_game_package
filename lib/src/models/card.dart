import 'package:bridge_game/bridge_game.dart';
import 'dart:math';

class Card {
  CardRank rank;
  Suit suit;

  Card({required this.rank, required this.suit});

  @override
  String toString() => '$suit$rank';

  int get points => max(rank.value - 10, 0);
  bool operator <(Card other) => rank.value < other.rank.value;
  bool operator >(Card other) => rank.value > other.rank.value;
  @override
  // ignore: hash_and_equals
  bool operator ==(Object other) =>
      rank == (other as Card).rank && suit == other.suit;
}
