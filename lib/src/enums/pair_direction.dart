import 'package:bridge_game/bridge_game.dart';

enum PairDirection {
  // ignore: constant_identifier_names
  NS('NS', [Direction.north, Direction.south], 1),
  // ignore: constant_identifier_names
  EW('EW', [Direction.east, Direction.west], -1);

  final String acronym;
  final List<Direction> directions;
  final int sideSign;

  const PairDirection(this.acronym, this.directions, this.sideSign);

  @override
  String toString() {
    return acronym;
  }
}
