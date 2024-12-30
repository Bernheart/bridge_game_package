import 'dart:math';

enum TournamentRank {
  otx_4x('OTX****', 15, 300),
  otx_3x('OTX***', 12, 200),
  otx_2x('OTX**', 10, 100),
  otx('OTX', 7, 50),
  otxUnder40('OTX <40 boards', 5, 0),
  rtx_1x('RTX*', 5, 50),
  rtx('RTX', 5, 0),
  rtxUnder40('RTX <40 boards', 3, 0),
  okrTx('Okr. TX', 2, 0),
  clubTx('Klub. TX', 1, 0);

  final String fullName;
  // ignore: non_constant_identifier_names
  final int RT;
  // ignore: non_constant_identifier_names
  final int PZ;

  const TournamentRank(this.fullName, this.RT, this.PZ);

  @override
  String toString() {
    return fullName;
  }
}

List<int> calculatePKL(int nofPairticipants, TournamentRank rank, double sumaWK,
    {bool disjoinedClassification = false}) {
  List<int> res = [];
  double PZ = max(
      (sumaWK / nofPairticipants) * rank.RT + 0.05 * nofPairticipants,
      rank.PZ.toDouble());

  int twoPercentIndex = (0.02 * nofPairticipants).ceil();
  int eighteenPercentIndex = (0.2 * nofPairticipants).ceil();
  int fiftyPercentIndex = (0.5 * nofPairticipants).ceil();

  res.add(PZ.ceil());
  for (int place = 1; place < nofPairticipants; place++) {
    if (place <= twoPercentIndex) {
      res.add((0.9 * PZ).ceil());
    } else if (place <= eighteenPercentIndex) {
      double factor = (0.9 -
          0.7 *
              ((place - twoPercentIndex) /
                  (eighteenPercentIndex - twoPercentIndex)));
      res.add((factor * PZ).ceil());
    } else if (place <= fiftyPercentIndex) {
      double factor = (0.2 -
          0.2 *
              ((place - eighteenPercentIndex) /
                  (fiftyPercentIndex - eighteenPercentIndex)));
      res.add(max((factor * PZ).ceil(), 1));
    } else {
      res.add(1);
    }
  }
  return res;
}
