import 'package:bridge_game/src/utils/displayable_interface.dart';

enum Direction implements Displayable {
  north,
  south,
  east,
  west;

  int sideSign() {
    switch (this) {
      case north:
      case south:
        return 1;
      case east:
      case west:
        return -1;
    }
  }

  @override
  String display() {
    switch (this) {
      case north:
        return 'N';
      case south:
        return 'S';
      case east:
        return 'E';
      case west:
        return 'W';
    }
  }

  static Direction fromString(String direction) {
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

  static Direction fromBoardNumber(int boardNumber) {
    boardNumber = (boardNumber - 1) % 4 + 1;
    switch (boardNumber) {
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
