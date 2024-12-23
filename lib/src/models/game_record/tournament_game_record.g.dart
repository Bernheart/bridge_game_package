// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_game_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TournamentGameRecord _$TournamentGameRecordFromJson(
        Map<String, dynamic> json) =>
    TournamentGameRecord(
      isEmpty: json['isEmpty'] as bool,
      boardNumber: (json['boardNumber'] as num).toInt(),
      level: (json['level'] as num?)?.toInt(),
      suit: $enumDecodeNullable(_$SuitEnumMap, json['suit']),
      contractType:
          $enumDecodeNullable(_$ContractTypeEnumMap, json['contractType']),
      declarer: $enumDecodeNullable(_$DirectionEnumMap, json['declarer']),
      lead: json['lead'] == null
          ? null
          : Card.fromJson(json['lead'] as Map<String, dynamic>),
      tricksTaken: (json['tricksTaken'] as num?)?.toInt(),
    )
      ..score = (json['score'] as num).toInt()
      ..vul = $enumDecode(_$VulnerabilityEnumMap, json['vul'])
      ..scoreIMP = (json['scoreIMP'] as num).toDouble()
      ..scoreMP = (json['scoreMP'] as num).toDouble();

Map<String, dynamic> _$TournamentGameRecordToJson(
        TournamentGameRecord instance) =>
    <String, dynamic>{
      'boardNumber': instance.boardNumber,
      'level': instance.level,
      'suit': _$SuitEnumMap[instance.suit]!,
      'contractType': _$ContractTypeEnumMap[instance.contractType]!,
      'declarer': _$DirectionEnumMap[instance.declarer]!,
      'tricksTaken': instance.tricksTaken,
      'score': instance.score,
      'vul': _$VulnerabilityEnumMap[instance.vul]!,
      'lead': instance.lead,
      'scoreIMP': instance.scoreIMP,
      'scoreMP': instance.scoreMP,
      'isEmpty': instance.isEmpty,
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
  Direction.south: 'south',
  Direction.east: 'east',
  Direction.west: 'west',
};

const _$VulnerabilityEnumMap = {
  Vulnerability.vulnerable: 'vulnerable',
  Vulnerability.notVulnerable: 'notVulnerable',
};
