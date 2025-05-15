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

  // To JSON
  Map<String, dynamic> toJson() => _$CardToJson(this);
}
