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

  @override
  String toString() {
    return symbol;
  }
}
