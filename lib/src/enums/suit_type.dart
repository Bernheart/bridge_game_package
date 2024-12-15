enum SuitType {
  minor(20),
  major(30),
  noTrump(30),
  pass(0);

  final int pointsForTrick;

  const SuitType(this.pointsForTrick);
}
