import 'package:bridge_game/bridge_game.dart';

enum Direction {
  north('N'),
  east('E'),
  south('S'),
  west('W');

  final String acronym;

  const Direction(this.acronym);

  PairDirection get pairDirection {
    switch (this) {
      case Direction.north:
      case Direction.south:
        return PairDirection.NS;
      case Direction.east:
      case Direction.west:
        return PairDirection.EW;
    }
  }

  @override
  String toString() {
    return acronym;
  }

  factory Direction.fromString(String direction) {
    switch (direction) {
      case "N":
      case "n":
      case "North":
      case "north":
        return Direction.north;
      case "S":
      case "s":
      case "South":
      case "south":
        return Direction.south;
      case "E":
      case "e":
      case "East":
      case "east":
        return Direction.east;
      case "W":
      case "w":
      case "West":
      case "west":
        return Direction.west;
    }
    return Direction.north;
  }

  factory Direction.fromBoardNumber(int boardNumber) {
    int boardDirectionInt = (boardNumber - 1) % 4 + 1;
    switch (boardDirectionInt) {
      case 1:
        return Direction.north;
      case 2:
        return Direction.east;
      case 3:
        return Direction.south;
      default:
        return Direction.west;
    }
  }
}
