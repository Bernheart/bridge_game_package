// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'match_game_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MatchGameRecord _$MatchGameRecordFromJson(Map<String, dynamic> json) =>
    MatchGameRecord(
      isEmpty: json['isEmpty'] as bool,
      boardNumber: (json['boardNumber'] as num).toInt(),
      level: (json['level'] as num?)?.toInt(),
      suit: $enumDecodeNullable(_$SuitEnumMap, json['suit']),
      contractType:
          $enumDecodeNullable(_$ContractTypeEnumMap, json['contractType']),
      declarer: $enumDecodeNullable(_$DirectionEnumMap, json['declarer']),
      tricksTaken: (json['tricksTaken'] as num?)?.toInt(),
      lead: json['lead'] == null
          ? null
          : Card.fromJson(json['lead'] as Map<String, dynamic>),
    )
      ..score = (json['score'] as num).toInt()
      ..vul = $enumDecode(_$VulnerabilityEnumMap, json['vul'])
      ..tableNumber = (json['tableNumber'] as num).toInt();

Map<String, dynamic> _$MatchGameRecordToJson(MatchGameRecord instance) =>
    <String, dynamic>{
      'boardNumber': instance.boardNumber,
      'level': instance.level,
      'suit': _$SuitEnumMap[instance.suit]!,
      'contractType': _$ContractTypeEnumMap[instance.contractType]!,
      'declarer': _$DirectionEnumMap[instance.declarer]!,
      'tricksTaken': instance.tricksTaken,
      'score': instance.score,
      'vul': _$VulnerabilityEnumMap[instance.vul]!,
      'isEmpty': instance.isEmpty,
      'lead': instance.lead,
      'tableNumber': instance.tableNumber,
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
