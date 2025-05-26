import 'package:bridge_game/bridge_game.dart';
import 'dart:math';
import 'package:json_annotation/json_annotation.dart';

part 'card.g.dart';

@JsonSerializable()
class Card {
  CardRank rank;
  CardSuit suit;

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

  // From JSON
  factory Card.fromJson(Map<String, dynamic> json) => _$CardFromJson(json);

  factory Card.fromString(String card) {
    if (card.length == 3) {
      if (card[0] == '1' && card[1] == '0') {
        card = 'T${card[2]}';
      } else if (card[1] == '1' && card[2] == '0') {
        card = '${card[0]}T';
      }
    }
    if (card.length != 2) {
      throw ArgumentError('Invalid card string: $card');
    }
    card = card.toUpperCase();
    CardSuit suit;
    CardRank rank;
    try {
      suit = CardSuit.fromString(card[0]);
      rank = CardRank.fromString(card[1]);
    } catch (e) {
      try {
        suit = CardSuit.fromString(card[1]);
        rank = CardRank.fromString(card[0]);
      } catch (e) {
        throw ArgumentError('Invalid card string: $card');
      }
    }
    return Card(rank: rank, suit: suit);
  }

  // To JSON
  Map<String, dynamic> toJson() => _$CardToJson(this);
}
