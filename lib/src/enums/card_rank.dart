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

  factory CardRank.fromString(String rank) {
    switch (rank.toUpperCase()) {
      case '2':
        return CardRank.two;
      case '3':
        return CardRank.three;
      case '4':
        return CardRank.four;
      case '5':
        return CardRank.five;
      case '6':
        return CardRank.six;
      case '7':
        return CardRank.seven;
      case '8':
        return CardRank.eight;
      case '9':
        return CardRank.nine;
      case 'T':
      case '10':
        return CardRank.ten;
      case 'J':
        return CardRank.jack;
      case 'Q':
        return CardRank.queen;
      case 'K':
        return CardRank.king;
      case 'A':
        return CardRank.ace;
      default:
        throw ArgumentError('Unknown card rank: $rank');
    }
  }
  int compareTo(CardRank other) {
    return value.compareTo(other.value);
  }

  bool operator <(CardRank other) => value < other.value;
  bool operator >(CardRank other) => value > other.value;
  bool operator <=(CardRank other) => value <= other.value;
  bool operator >=(CardRank other) => value >= other.value;

  @override
  String toString() => symbol;
}
