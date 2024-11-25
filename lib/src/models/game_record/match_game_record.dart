import 'package:bridge_game/src/models/game_record/game_record.dart';
import 'package:bridge_game/src/enums/index.dart';

class MatchGameRecord extends GameRecord {
  final bool isEmpty;
  late final int tableNumber;

  MatchGameRecord({
    required this.isEmpty,
    required super.boardNumber,
    int? level,
    Suit? suit,
    ContractType? contractType,
    Direction? declarer,
    int? tricksTaken,
  }) : super(
          level: isEmpty ? -1 : level!,
          suit: isEmpty ? Suit.pass : suit!,
          contractType: isEmpty ? ContractType.pass : contractType!,
          declarer: isEmpty ? Direction.north : declarer!,
          tricksTaken: isEmpty ? 0 : tricksTaken!,
        );

  MatchGameRecord.fromGameRecord(GameRecord gameRecord)
      : isEmpty = false,
        super(
            boardNumber: gameRecord.boardNumber,
            level: gameRecord.level,
            suit: gameRecord.suit,
            contractType: gameRecord.contractType,
            declarer: gameRecord.declarer,
            tricksTaken: gameRecord.tricksTaken);

  @override
  Map<String, String> toMap() {
    if (!isEmpty) {
      return super.toMap();
    } else {
      return {
        'board': (boardNumber > 0) ? boardNumber.toString() : '?',
        'contract': '',
        'score': '',
      };
    }
  }
}
