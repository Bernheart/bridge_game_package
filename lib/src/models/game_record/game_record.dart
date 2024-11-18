import 'package:bridge_game/src/enums/contract_type.dart';
import 'package:bridge_game/src/enums/direction.dart';
import 'package:bridge_game/src/enums/suit.dart';
import 'package:bridge_game/src/enums/vulnerability.dart';
import 'package:bridge_game/src/scoring/hcp_compensation_table.dart';
import 'package:bridge_game/src/scoring/score_table.dart';

class GameRecord {
  late final int id;
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
  })  : vul = Vulnerability.getBoardVulnerability(boardNumber, declarer),
        score = (contractType == ContractType.pass)
            ? 0
            : ScoreTable.getScore(
                    Vulnerability.getBoardVulnerability(boardNumber, declarer),
                    suit,
                    contractType,
                    level,
                    tricksTaken - (level + 6)) *
                declarer.sideSign();

  int tricksNeeded() {
    return level + 6;
  }

  int trickDiffrence() {
    return tricksTaken - tricksNeeded();
  }

  String display() {
    return '$boardNumber: ${contractDisplay()} ${tricksDisplay()} ${declarer.display()} ${scoreDisplay()}';
  }

  String contractDisplay() {
    return level.toString() + suit.display() + contractType.display();
  }

  String tricksDisplay() {
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
          : '${contractDisplay()}${tricksDisplay()} ${declarer.display()}',
      'score': scoreDisplay(),
    };
  }

  // // Factory to create from database record
  // factory GameRecord.fromData(GameRecordData data) {
  //   return GameRecord(
  //     boardNumber: data.boardNumber,
  //     level: data.level,
  //     suit: data.suit,
  //     contractType: data.contractType,
  //     declarer: data.declarer,
  //     tricksTaken: data.tricksTaken,
  //   );
  // }

  // GameRecordsCompanion toCompanion(int gameId) {
  //   return GameRecordsCompanion(
  //     gameId: Value(gameId),
  //     boardNumber: Value(boardNumber),
  //     level: Value(level),
  //     suit: Value(suit), // Use `index` if suit is an enum
  //     contractType: Value(contractType),
  //     declarer: Value(declarer),
  //     tricksTaken: Value(tricksTaken),
  //     hcpNS: Value.absent(),
  //   );
  // }
}

class SingleTableGameRecord extends GameRecord {
  int hcpNS; // 0-40
  int impNS = 0; // [-24, 24]
  String hcpRegardingTo = "NS";

  SingleTableGameRecord(
      {required super.boardNumber,
      required super.level,
      required super.suit,
      required super.contractType,
      required super.declarer,
      required super.tricksTaken,
      required this.hcpNS,
      required this.hcpRegardingTo}) {
    hcpNS = (hcpRegardingTo == "NS")
        ? hcpNS
        : ((hcpRegardingTo == "EW")
            ? 40 - hcpNS
            : ((declarer == Direction.north || declarer == Direction.south)
                ? hcpNS
                : 40 - hcpNS));
    impNS = HcpCompensationTable.getIMPs(score, hcpNS, vul);
  }

  SingleTableGameRecord.fromGameRecord(
      GameRecord gameRecord, this.hcpNS, this.hcpRegardingTo)
      : super(
            boardNumber: gameRecord.boardNumber,
            level: gameRecord.level,
            suit: gameRecord.suit,
            contractType: gameRecord.contractType,
            declarer: gameRecord.declarer,
            tricksTaken: gameRecord.tricksTaken) {
    hcpNS = (hcpRegardingTo == "NS")
        ? hcpNS
        : ((hcpRegardingTo == "EW")
            ? 40 - hcpNS
            : ((declarer == Direction.north || declarer == Direction.south)
                ? hcpNS
                : 40 - hcpNS));
    impNS = HcpCompensationTable.getIMPs(score, hcpNS, vul);
  }

  @override
  Map<String, String> toMap() {
    return {
      'board': boardNumber.toString(),
      'contract': (contractType == ContractType.pass)
          ? 'PASS'
          : '${contractDisplay()}${tricksDisplay()} ${declarer.display()}',
      'score': scoreDisplay(),
      'imps': addPlusBefore(impNS),
    };
  }

  @override
  String display() {
    return '${super.display()} ${impDisplay()}';
  }

  String impDisplay() {
    return "${addPlusBefore(impNS)}IMP";
  }

  // // Factory to create from database record
  // factory SingleTableGameRecord.fromData(GameRecordData data) {
  //   return SingleTableGameRecord.fromGameRecord(
  //       GameRecord.fromData(data), data.hcpNS, "NS");
  // }

  // @override
  // GameRecordsCompanion toCompanion(int gameId) {
  //   return super.toCompanion(gameId).copyWith(hcpNS: Value(hcpNS));
  // }
}

class MatchGameRecord extends GameRecord {
  MatchGameRecord(
      {required super.boardNumber,
      required super.level,
      required super.suit,
      required super.contractType,
      required super.declarer,
      required super.tricksTaken});

  MatchGameRecord.fromGameRecord(GameRecord gameRecord)
      : super(
            boardNumber: gameRecord.boardNumber,
            level: gameRecord.level,
            suit: gameRecord.suit,
            contractType: gameRecord.contractType,
            declarer: gameRecord.declarer,
            tricksTaken: gameRecord.tricksTaken);
}
