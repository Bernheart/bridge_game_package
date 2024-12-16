// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'card.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Card _$CardFromJson(Map<String, dynamic> json) => Card(
      rank: $enumDecode(_$CardRankEnumMap, json['rank']),
      suit: $enumDecode(_$SuitEnumMap, json['suit']),
    );

Map<String, dynamic> _$CardToJson(Card instance) => <String, dynamic>{
      'rank': _$CardRankEnumMap[instance.rank]!,
      'suit': _$SuitEnumMap[instance.suit]!,
    };

const _$CardRankEnumMap = {
  CardRank.two: 'two',
  CardRank.three: 'three',
  CardRank.four: 'four',
  CardRank.five: 'five',
  CardRank.six: 'six',
  CardRank.seven: 'seven',
  CardRank.eight: 'eight',
  CardRank.nine: 'nine',
  CardRank.ten: 'ten',
  CardRank.jack: 'jack',
  CardRank.queen: 'queen',
  CardRank.king: 'king',
  CardRank.ace: 'ace',
};

const _$SuitEnumMap = {
  Suit.clubs: 'clubs',
  Suit.diamonds: 'diamonds',
  Suit.hearts: 'hearts',
  Suit.spades: 'spades',
  Suit.noTrump: 'noTrump',
};