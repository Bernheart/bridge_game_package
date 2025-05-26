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

  factory ScoringType.fromString(String type) {
    switch (type.toLowerCase()) {
      case 'mp - percentage':
      case 'mpp':
        return ScoringType.MPPercentage;
      case 'mp - scoring':
      case 'mps':
      case 'mp':
        return ScoringType.MPScore;
      case 'imp - total':
      case 'timp':
      case 'total_imp':
        return ScoringType.totalIMP;
      case 'imp - cross':
      case 'cimp':
      case 'cross_imp':
        return ScoringType.crossIMP;
      case 'imp - average':
      case 'aimp':
      case 'acimp':
      case 'average_cross_imp':
        return ScoringType.averageCrossIMP;
      case 'butler':
      case 'but':
        return ScoringType.butler;
      case 'imp':
        return ScoringType.IMP;
      case 'imp - vp':
      case 'imp_vp':
      case 'imp-vp':
        return ScoringType.IMP_VP;
      case 'bam':
        return ScoringType.BAM;
      case 'patton':
      case 'pat':
        return ScoringType.Patton;
      default:
        throw ArgumentError('Unknown scoring type: $type');
    }
  }

  @override
  String toString() => type;
  List<TournamentType> getTournamentTypes() => tournamentTypes;
}
