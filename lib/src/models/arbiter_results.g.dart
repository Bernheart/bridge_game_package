// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'arbiter_results.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ArbiterResult _$ArbiterResultFromJson(Map<String, dynamic> json) =>
    ArbiterResult(
      (json['resultType'] as Map<String, dynamic>).map(
        (k, e) => MapEntry($enumDecode(_$PairDirectionEnumMap, k),
            $enumDecode(_$ArbiterResultTypeEnumMap, e)),
      ),
      NS: (json['NS'] as num?)?.toDouble() ?? 0.5,
      EW: (json['EW'] as num?)?.toDouble() ?? 0.5,
    );

Map<String, dynamic> _$ArbiterResultToJson(ArbiterResult instance) =>
    <String, dynamic>{
      'resultType': instance.resultType.map((k, e) =>
          MapEntry(_$PairDirectionEnumMap[k]!, _$ArbiterResultTypeEnumMap[e]!)),
      'NS': instance.NS,
      'EW': instance.EW,
    };

const _$ArbiterResultTypeEnumMap = {
  ArbiterResultType.AA: 'AA',
  ArbiterResultType.AP: 'AP',
  ArbiterResultType.AM: 'AM',
  ArbiterResultType.AC: 'AC',
};

const _$PairDirectionEnumMap = {
  PairDirection.NS: 'NS',
  PairDirection.EW: 'EW',
};
