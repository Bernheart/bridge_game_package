// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'tournament_game_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TournamentGameRecord _$TournamentGameRecordFromJson(
  Map<String, dynamic> json,
) =>
    TournamentGameRecord(
        boardNumber: (json['boardNumber'] as num).toInt(),
        level: (json['level'] as num).toInt(),
        suit: $enumDecode(_$SuitEnumMap, json['suit']),
        contractType: $enumDecode(_$ContractTypeEnumMap, json['contractType']),
        declarer: $enumDecode(_$DirectionEnumMap, json['declarer']),
        tricksTaken: (json['tricksTaken'] as num).toInt(),
        lead: json['lead'] == null
            ? null
            : Card.fromJson(json['lead'] as Map<String, dynamic>),
        scoreIMP: (json['scoreIMP'] as num?)?.toDouble() ?? 0,
        scoreMP: (json['scoreMP'] as num?)?.toDouble() ?? 0,
      )
      ..score = (json['score'] as num).toInt()
      ..vul = $enumDecode(_$VulnerabilityEnumMap, json['vul'])
      ..isEmpty = json['isEmpty'] as bool
      ..arbiterResult = json['arbiterResult'] == null
          ? null
          : ArbiterResult.fromJson(
              json['arbiterResult'] as Map<String, dynamic>,
            );

Map<String, dynamic> _$TournamentGameRecordToJson(
  TournamentGameRecord instance,
) => <String, dynamic>{
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
  'arbiterResult': instance.arbiterResult,
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
