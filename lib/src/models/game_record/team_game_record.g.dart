// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'team_game_record.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

TeamGameRecord _$TeamGameRecordFromJson(Map<String, dynamic> json) =>
    TeamGameRecord()
      ..records = (json['records'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$RoomEnumMap, k),
            MatchGameRecord.fromJson(e as Map<String, dynamic>)),
      )
      ..scores = (json['scores'] as Map<String, dynamic>).map(
        (k, e) => MapEntry(
            $enumDecode(_$ScoringTypeEnumMap, k), (e as num).toDouble()),
      );

Map<String, dynamic> _$TeamGameRecordToJson(TeamGameRecord instance) =>
    <String, dynamic>{
      'records': instance.records.map((k, e) => MapEntry(_$RoomEnumMap[k]!, e)),
      'scores':
          instance.scores.map((k, e) => MapEntry(_$ScoringTypeEnumMap[k]!, e)),
    };

const _$RoomEnumMap = {
  Room.open: 'open',
  Room.closed: 'closed',
};

const _$ScoringTypeEnumMap = {
  ScoringType.MPPercentage: 'MPPercentage',
  ScoringType.MPScore: 'MPScore',
  ScoringType.totalIMP: 'totalIMP',
  ScoringType.crossIMP: 'crossIMP',
  ScoringType.averageCrossIMP: 'averageCrossIMP',
  ScoringType.butler: 'butler',
  ScoringType.IMP: 'IMP',
  ScoringType.IMP_VP: 'IMP_VP',
  ScoringType.BAM: 'BAM',
  ScoringType.Patton: 'Patton',
};
