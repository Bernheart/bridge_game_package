enum CardRank {
  two('2', 2),
  three('3', 3),
  four('4', 4),
  five('5', 5),
  six('6', 6),
  seven('7', 7),
  eight('8', 8),
  nine('9', 9),
  ten('T', 10),
  jack('J', 11),
  queen('Q', 12),
  king('K', 13),
  ace('A', 14);

  final String symbol; // Symbol representation (e.g., '2', 'J', 'A')
  final int value; // Numeric value (2 to 14)

  const CardRank(this.symbol, this.value);

  @override
  String toString() => symbol;
}
