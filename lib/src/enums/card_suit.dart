enum CardSuit {
  clubs('♣', 'C'),
  diamonds('♦', 'D'),
  hearts('♥', 'H'),
  spades('♠', 'S');

  // Define a field to hold the value
  final String symbol;
  final String acronym;

  // Constructor to initialize the symbol
  const CardSuit(this.symbol, this.acronym);

  @override
  String toString() {
    return symbol;
  }
}
