enum TeamSitting {
  home('HOME'),
  away('AWAY');

  final String acronym;

  const TeamSitting(this.acronym);

  TeamSitting get opposite =>
      this == TeamSitting.home ? TeamSitting.away : TeamSitting.home;

  @override
  String toString() {
    return acronym;
  }
}
