// ignore_for_file: constant_identifier_names

enum TournamentType { individual, pairs, teams }

enum ScoringType {
  MPPercentage(
      'MP - Percentage', [TournamentType.individual, TournamentType.pairs]),
  MPScore('MP - Scoring', [TournamentType.individual, TournamentType.pairs]),
  totalIMP('IMP - total', [TournamentType.individual, TournamentType.pairs]),
  crossIMP('IMP - Cross', [TournamentType.individual, TournamentType.pairs]),
  averageCrossIMP(
      'IMP - average', [TournamentType.individual, TournamentType.pairs]),
  butler('Butler', [TournamentType.individual, TournamentType.pairs]),
  IMP('IMP', [TournamentType.teams]),
  IMP_VP('IMP - VP', [TournamentType.pairs, TournamentType.teams]),
  BAM('BAM', [TournamentType.teams]),
  Patton('Patton', [TournamentType.teams]);

  final String type;
  final List<TournamentType> tournamentTypes;

  const ScoringType(this.type, this.tournamentTypes);

  @override
  String toString() => type;
  List<TournamentType> getTournamentTypes() => tournamentTypes;
}
