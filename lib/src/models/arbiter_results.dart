// ignore_for_file: constant_identifier_names, non_constant_identifier_names

import 'package:bridge_game/src/enums/index.dart';
import 'package:json_annotation/json_annotation.dart';

part 'arbiter_results.g.dart';

enum ArbiterResultType {
  AA('averege'),
  AP('aveerage plus'),
  AM('average minus'),
  AC('arbiter custom');

  final String name;

  const ArbiterResultType(this.name);

  double getValue(ScoringType scoringType) {
    switch (scoringType) {
      case ScoringType.MPPercentage:
      case ScoringType.MPScore:
        return (this == AA)
            ? 50
            : (this == AP)
                ? 60
                : 40;
      case ScoringType.IMP_VP:
      case ScoringType.averageCrossIMP:
      case ScoringType.butler:
        return (this == AA)
            ? 0
            : (this == AP)
                ? 3
                : -3;
      case ScoringType.crossIMP:
      case ScoringType.totalIMP:
        return (this == AA)
            ? 0
            : (this == AP)
                ? 3
                : -3;
    }
  }
}

@JsonSerializable()
class ArbiterResult {
  Map<PairDirection, ArbiterResultType> resultType;
  double? NS;
  double? EW;

  ArbiterResult(this.resultType, {this.NS = 0.5, this.EW = 0.5});

  double? getNS(ScoringType scoringType) {
    if (resultType[PairDirection.NS] == ArbiterResultType.AC) {
      return NS!;
    } else {
      return resultType[PairDirection.NS]!.getValue(scoringType);
    }
  }

  double? getEW(ScoringType scoringType) {
    if (resultType[PairDirection.EW] == ArbiterResultType.AC) {
      return EW!;
    } else {
      return resultType[PairDirection.EW]!.getValue(scoringType);
    }
  }

  factory ArbiterResult.fromJson(Map<String, dynamic> json) =>
      _$ArbiterResultFromJson(json);
  Map<String, dynamic> toJson() => _$ArbiterResultToJson(this);
}
