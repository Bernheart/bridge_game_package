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
}
