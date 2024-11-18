enum SuitType {
  minor,
  major,
  noTrump,
  pass;

  int pointsForTrick() {
    switch (this) {
      case minor:
        return 20;
      default:
        return 30;
    }
  }
}
