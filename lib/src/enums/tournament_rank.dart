import 'dart:math';

import 'package:bridge_game/src/enums/scoring_and_tournament_type.dart';

enum TournamentRank {
  otx_4x('OTX****', 25, 200, 100, 40, 300, 100),
  otx_3x('OTX***', 15, 150, 100, 25, 200, 100),
  otx_2x('OTX**', 10, 75, 50, 15, 100, 100),
  otx_x('OTX*', 7, 50, 50, 10, 70, 50),
  otx('OTX', 5, 0, 0, 7, 0, 0),
  rtx('RTX', 4, 0, 0, 5, 0, 0),
  okrTx('Okr. TX', 2, 0, 0, 3, 0, 0),
  clubTx('Klub. TX', 1, 0, 0, 2, 0, 0);

  final String fullName;
  // ignore: non_constant_identifier_names
  final int RT, RTu40;
  // ignore: non_constant_identifier_names
  final int PZ, PZu40;
  final int aPKL, aPKLu40;

  const TournamentRank(this.fullName, this.RTu40, this.PZu40, this.aPKLu40,
      this.RT, this.PZ, this.aPKL);

  int getRT(int boards) {
    return (boards >= 40) ? RT : RTu40;
  }

  int getPZ(int boards) {
    return (boards >= 40) ? PZ : PZu40;
  }

  int getaPKL(int boards) {
    return (boards >= 40) ? aPKL : aPKLu40;
  }

  @override
  String toString() {
    return fullName;
  }
}

List<int> calculatePKL(int numOfParticipants, int nofPlayers,
    TournamentRank rank, double sumaWK, TournamentType type, int nofBoards) {
  List<int> res = [];
  // ignore: non_constant_identifier_names
  int PZ = (max(
              max((sumaWK / nofPlayers), 0.15) * rank.getRT(nofBoards) +
                  0.05 * nofPlayers,
              rank.getPZ(nofBoards).toDouble()) *
          ((type == TournamentType.teams) ? 1.25 : 1))
      .ceil();

  double twoPercentIndex = 0.02 * numOfParticipants;
  double twentyPercentIndex = 0.2 * numOfParticipants;
  double fiftyPercentIndex = 0.5 * numOfParticipants;

  res.add(PZ);

  for (int place = 2; place <= numOfParticipants; place++) {
    double factor = (place - 1);
    if (factor < twoPercentIndex) {
      res.add(((PZ * (twoPercentIndex - factor) + 0.9 * PZ * factor) /
              twoPercentIndex)
          .ceil());
    } else if (factor < twentyPercentIndex) {
      res.add(((0.9 * PZ * (twentyPercentIndex - factor) +
                  0.2 * PZ * (factor - twoPercentIndex)) /
              (twentyPercentIndex - twoPercentIndex))
          .ceil());
    } else if (factor < fiftyPercentIndex) {
      res.add(((0.2 * PZ * (fiftyPercentIndex - factor)) /
              (fiftyPercentIndex - twentyPercentIndex))
          .ceil());
    } else {
      res.add(1);
    }
  }

  return res;
}

List<int> calculateCP(int numOfParticipants, TournamentType type) {
  List<int> res = [];
  double tournamentTypeFactor = (type == TournamentType.teams) ? 4 : 2;
  for (int place = 1; place <= numOfParticipants; place++) {
    res.add(((numOfParticipants - place + 1) * tournamentTypeFactor +
            max(0, 5 - (place - 1) * 2))
        .ceil());
  }
  return res;
}