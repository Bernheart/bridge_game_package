import 'package:bridge_game/src/models/arbiter_results.dart';
import 'package:bridge_game/src/models/game_record/game_record.dart';
import 'package:bridge_game/src/enums/index.dart';
import 'package:bridge_game/src/models/card.dart';
import 'package:bridge_game/src/models/game_record/match_game_record.dart';
import 'package:json_annotation/json_annotation.dart';

part 'tournament_game_record.g.dart';

@JsonSerializable()
class TournamentGameRecord extends GameRecord {
  Card? lead;
  double scoreIMP = 0;
  double scoreMP = 0;
  bool isEmpty;
  bool get isNotEmpty => !isEmpty;
  ArbiterResult? arbiterResult;

  TournamentGameRecord(
      {required this.isEmpty,
      required super.boardNumber,
      int? level,
      Suit? suit,
      ContractType? contractType,
      Direction? declarer,
      this.lead,
      int? tricksTaken,
      this.scoreIMP = 0,
      this.scoreMP = 0})
      : super(
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

  void update(TournamentGameRecord tg) {
    lead = tg.lead;
    score = tg.score;
    isEmpty = tg.isEmpty;
    level = tg.level;
    suit = tg.suit;
    contractType = tg.contractType;
    declarer = tg.declarer;
    tricksTaken = tg.tricksTaken;
    isEmpty = tg.isEmpty;
    arbiterResult = tg.arbiterResult;
  }

  @override
  Map<String, String> toMap({ScoringType scoringType = ScoringType.MPScore}) {
    if (!isEmpty) {
      if (contractType == ContractType.pass) {
        return {
          'contract': 'PASS',
          'declarer': '',
          'lead': '',
          'tricksTaken': '',
          'scoreNS': '',
          'scoreEW': '',
          'arbiterResultNS': (arbiterResult == null)
              ? ''
              : arbiterResult!.resultType[PairDirection.NS]!.shortName,
          'arbiterResultEW': (arbiterResult == null)
              ? ''
              : arbiterResult!.resultType[PairDirection.EW]!.shortName,
          'arbiterResultNSScore': (arbiterResult == null)
              ? ''
              : arbiterResult!.getNS(scoringType).toString(),
          'arbiterResultEWScore': (arbiterResult == null)
              ? ''
              : arbiterResult!.getEW(scoringType).toString(),
        };
      } else {
        return {
          'contract': contractDisplay(),
          'declarer': declarer.toString(),
          'lead': (lead == null) ? '' : lead.toString(),
          'tricksTaken': tricksDisplay(),
          'scoreNS': (score > 0) ? score.abs().toString() : '',
          'scoreEW': (score < 0) ? score.abs().toString() : '',
          'arbiterResultNS': (arbiterResult == null)
              ? ''
              : arbiterResult!.resultType[PairDirection.NS]!.shortName,
          'arbiterResultEW': (arbiterResult == null)
              ? ''
              : arbiterResult!.resultType[PairDirection.EW]!.shortName,
          'arbiterResultNSScore': (arbiterResult == null)
              ? ''
              : arbiterResult!.getNS(scoringType).toString(),
          'arbiterResultEWScore': (arbiterResult == null)
              ? ''
              : arbiterResult!.getEW(scoringType).toString(),
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
        'arbiterResultNS': (arbiterResult == null)
            ? ''
            : arbiterResult!.resultType[PairDirection.NS]!.shortName,
        'arbiterResultEW': (arbiterResult == null)
            ? ''
            : arbiterResult!.resultType[PairDirection.EW]!.shortName,
        'arbiterResultNSScore': (arbiterResult == null)
            ? ''
            : arbiterResult!.getNS(scoringType).toString(),
        'arbiterResultEWScore': (arbiterResult == null)
            ? ''
            : arbiterResult!.getEW(scoringType).toString(),
      };
    }
  }

  factory TournamentGameRecord.fromTournamentGameRecord(
      TournamentGameRecord tgr) {
    return TournamentGameRecord(
      isEmpty: tgr.isEmpty,
      boardNumber: tgr.boardNumber,
      level: tgr.level,
      suit: tgr.suit,
      contractType: tgr.contractType,
      declarer: tgr.declarer,
      tricksTaken: tgr.tricksTaken,
      lead: tgr.lead == null
          ? null
          : Card(rank: tgr.lead!.rank, suit: tgr.lead!.suit),
      scoreIMP: tgr.scoreIMP,
      scoreMP: tgr.scoreMP,
    )..arbiterResult = tgr.arbiterResult == null
        ? null
        : ArbiterResult.fromJson(tgr.arbiterResult!.toJson());
  }

  factory TournamentGameRecord.fromMatchGameRecord(MatchGameRecord mgr) {
    return TournamentGameRecord(
      isEmpty: mgr.isEmpty,
      boardNumber: mgr.boardNumber,
      level: mgr.level,
      suit: mgr.suit,
      contractType: mgr.contractType,
      declarer: mgr.declarer,
      tricksTaken: mgr.tricksTaken,
      lead: mgr.lead,
    );
  }

  // From JSON
  factory TournamentGameRecord.fromJson(Map<String, dynamic> json) =>
      _$TournamentGameRecordFromJson(json);

  // To JSON
  @override
  Map<String, dynamic> toJson() => _$TournamentGameRecordToJson(this);
}
