import 'package:bridge_game/src/utils/displayable_interface.dart';
import 'package:bridge_game/src/enums/suit_type.dart';

enum Suit implements Displayable {
  clubs('C'),
  diamonds('D'),
  hearts('H'),
  spades('S'),
  noTrump('NT');

  // Define a field to hold the value
  final String symbol;

  // Constructor to initialize the symbol
  const Suit(this.symbol);

  @override
  String display() {
    switch (this) {
      case spades:
        return '♠';
      case hearts:
        return '♥';
      case diamonds:
        return '♦';
      case clubs:
        return '♣';
      case noTrump:
        return 'NT';
    }
  }

  SuitType getType() {
    switch (this) {
      case diamonds:
      case clubs:
        return SuitType.minor;
      case spades:
      case hearts:
        return SuitType.major;
      case noTrump:
        return SuitType.noTrump;
    }
  }
}
