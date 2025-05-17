import 'package:bridge_game/src/enums/index.dart';
import 'package:bridge_game/src/scoring/score_table.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game_record.g.dart';

@JsonSerializable()
class GameRecord {
  int boardNumber; // %1-16
  int level; // 1-7
  Suit suit; // NT/S/H/D/C
  ContractType contractType =
      ContractType.notDoubled; // notDoubled, doubled, redoubled
  Direction declarer; // N/S/E/W
  int tricksTaken; // 1-13
  int score = 0; // for NS
  Vulnerability vul =
      Vulnerability.notVulnerable; // vulnerable or notVulnerable

  GameRecord({
    required this.boardNumber,
    required this.level,
    required this.suit,
    required this.contractType,
    required this.declarer,
    required this.tricksTaken,
  })  : vul = Vulnerability.getVulnerability(boardNumber, declarer),
        score = (contractType == ContractType.pass)
            ? 0
            : ScoreTable.getScore(
                    Vulnerability.getVulnerability(boardNumber, declarer),
                    suit,
                    contractType,
                    level,
                    tricksTaken - (level + 6)) *
                declarer.pairDirection.sideSign;

  int tricksNeeded() {
    return level + 6;
  }

  int trickDiffrence() {
    return tricksTaken - tricksNeeded();
  }

  String display() {
    return '$boardNumber: ${contractDisplay()} ${tricksDisplay()} $declarer ${scoreDisplay()}';
  }

  String contractDisplay() {
    if (contractType == ContractType.pass) return contractType.toString();
    return '$level$suit$contractType';
  }

  List<dynamic> contractElements() {
    if (contractType == ContractType.pass) return [contractType];
    return [level, suit, contractType];
  }

  String tricksDisplay() {
    if (contractType == ContractType.pass) return '';
    if (tricksTaken == tricksNeeded()) {
      return '=';
    } else {
      return addPlusBefore(trickDiffrence());
    }
  }

  String scoreDisplay() {
    return addPlusBefore(score);
  }

  String addPlusBefore(int x) {
    return (x >= 0 ? '+' : '') + x.toString();
  }

  Map<String, String> toMap() {
    return {
      'board': boardNumber.toString(),
      'contract': (contractType == ContractType.pass)
          ? 'PASS'
          : '${contractDisplay()}${tricksDisplay()} $declarer',
      'score': scoreDisplay(),
    };
  }

  factory GameRecord.fromJson(Map<String, dynamic> json) =>
      _$GameRecordFromJson(json);

  Map<String, dynamic> toJson() => _$GameRecordToJson(this);
}
