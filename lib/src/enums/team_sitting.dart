enum TeamSitting {
  home('HOME'),
  away('AWAY');

  final String acronym;

  const TeamSitting(this.acronym);

  @override
  String toString() {
    return acronym;
  }
}
