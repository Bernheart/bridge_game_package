import 'package:bridge_game/src/enums/suit_type.dart';

enum Suit {
  clubs('♣', 'C', SuitType.minor),
  diamonds('♦', 'D', SuitType.minor),
  hearts('♥', 'H', SuitType.major),
  spades('♠', 'S', SuitType.major),
  noTrump('NT', 'NT', SuitType.noTrump);

  // Define a field to hold the value
  final String symbol;
  final String acronym;
  final SuitType type;

  // Constructor to initialize the symbol
  const Suit(this.symbol, this.acronym, this.type);

  factory Suit.fromString(String suit) {
    switch (suit.toLowerCase()) {
      case 'clubs':
      case 'c':
      case '♣':
        return Suit.clubs;
      case 'diamonds':
      case 'd':
      case '♦':
        return Suit.diamonds;
      case 'hearts':
      case 'h':
      case '♥':
        return Suit.hearts;
      case 'spades':
      case 's':
      case '♠':
        return Suit.spades;
      case 'no trump':
      case 'nt':
      case 'n':
        return Suit.noTrump;
      default:
        throw ArgumentError('Unknown suit: $suit');
    }
  }

  @override
  String toString() {
    return symbol;
  }
}
