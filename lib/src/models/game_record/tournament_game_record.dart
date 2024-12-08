import 'package:bridge_game/src/models/game_record/game_record.dart';
import 'package:bridge_game/src/enums/index.dart';
import 'package:bridge_game/src/models/card.dart';

class TournamentGameRecord extends GameRecord {
  final Card? lead;
  final bool isEmpty;

  TournamentGameRecord({
    required this.isEmpty,
    required super.boardNumber,
    int? level,
    Suit? suit,
    ContractType? contractType,
    Direction? declarer,
    this.lead,
    int? tricksTaken,
  }) : super(
          level: isEmpty ? -1 : level!,
          suit: isEmpty ? Suit.clubs : suit!,
          contractType: isEmpty ? ContractType.pass : contractType!,
          declarer: isEmpty ? Direction.north : declarer!,
          tricksTaken: isEmpty ? 0 : tricksTaken!,
        );

  TournamentGameRecord.fromGameRecord(
      GameRecord gameRecord, int givenTableNumber)
      : isEmpty = false,
        lead = null,
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
      if (contractType == ContractType.pass) {
        return {
          'contract': 'PASS',
          'declarer': '\u2014',
          'lead': '\u2014',
          'tricksTaken': '\u2014',
          'scoreNS': '0',
          'scoreEW': '0',
        };
      } else {
        return {
          'contract': contractDisplay(),
          'declarer': declarer.display(),
          'lead': (lead == null) ? '\u2014' : lead!.display(),
          'tricksTaken': tricksDisplay(),
          'scoreNS': (score > 0) ? score.abs().toString() : '',
          'scoreEW': (score < 0) ? score.abs().toString() : '',
        };
      }
    } else {
      return {
        'contract': '',
        'declarer': '',
        'lead': '',
        'tricksTaken': '',
        'scoreNS': '',
        'scoreEW': '',
      };
    }
  }
}
