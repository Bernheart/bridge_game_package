enum TournamentType { individual, pairs, teams }

// ignore: constant_identifier_names
enum ScoringType {
  // ignore: constant_identifier_names
  MPPercentage('MP - Percentage'),
  // ignore: constant_identifier_names
  MPScore('MP - Scoring'),
  totalIMP('IMP - total'),
  crossIMP('IMP - Cross'),
  averageCrossIMP('IMP - average'),
  butler('Butler'),
  // ignore: constant_identifier_names
  IMP_VP('IMP - VP');

  final String type;

  const ScoringType(this.type);

  @override
  String toString() => type;
}
