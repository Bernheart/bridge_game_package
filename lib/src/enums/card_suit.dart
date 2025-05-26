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

  factory CardSuit.fromString(String suit) {
    switch (suit.toLowerCase()) {
      case 'clubs':
      case 'c':
      case '♣':
        return CardSuit.clubs;
      case 'diamonds':
      case 'd':
      case '♦':
        return CardSuit.diamonds;
      case 'hearts':
      case 'h':
      case '♥':
        return CardSuit.hearts;
      case 'spades':
      case 's':
      case '♠':
        return CardSuit.spades;
      default:
        throw ArgumentError('Unknown card suit: $suit');
    }
  }

  @override
  String toString() {
    return symbol;
  }
}
