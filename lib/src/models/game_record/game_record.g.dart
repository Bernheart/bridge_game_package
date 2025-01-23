// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GameRecord _$GameRecordFromJson(Map<String, dynamic> json) => GameRecord(
      boardNumber: (json['boardNumber'] as num).toInt(),
      level: (json['level'] as num).toInt(),
      suit: $enumDecode(_$SuitEnumMap, json['suit']),
      contractType: $enumDecode(_$ContractTypeEnumMap, json['contractType']),
      declarer: $enumDecode(_$DirectionEnumMap, json['declarer']),
      tricksTaken: (json['tricksTaken'] as num).toInt(),
    )
      ..score = (json['score'] as num).toInt()
      ..vul = $enumDecode(_$VulnerabilityEnumMap, json['vul']);

Map<String, dynamic> _$GameRecordToJson(GameRecord instance) =>
    <String, dynamic>{
      'boardNumber': instance.boardNumber,
      'level': instance.level,
      'suit': _$SuitEnumMap[instance.suit]!,
      'contractType': _$ContractTypeEnumMap[instance.contractType]!,
      'declarer': _$DirectionEnumMap[instance.declarer]!,
      'tricksTaken': instance.tricksTaken,
      'score': instance.score,
      'vul': _$VulnerabilityEnumMap[instance.vul]!,
    };

const _$SuitEnumMap = {
  Suit.clubs: 'clubs',
  Suit.diamonds: 'diamonds',
  Suit.hearts: 'hearts',
  Suit.spades: 'spades',
  Suit.noTrump: 'noTrump',
};

const _$ContractTypeEnumMap = {
  ContractType.pass: 'pass',
  ContractType.notDoubled: 'notDoubled',
  ContractType.doubled: 'doubled',
  ContractType.redoubled: 'redoubled',
};

const _$DirectionEnumMap = {
  Direction.north: 'north',
  Direction.east: 'east',
  Direction.south: 'south',
  Direction.west: 'west',
};

const _$VulnerabilityEnumMap = {
  Vulnerability.vulnerable: 'vulnerable',
  Vulnerability.notVulnerable: 'notVulnerable',
};
