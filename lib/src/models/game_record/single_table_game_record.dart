import 'package:bridge_game/src/models/game_record/game_record.dart';
import 'package:bridge_game/src/enums/index.dart';
import 'package:bridge_game/src/scoring/hcp_compensation_table.dart';

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
}
