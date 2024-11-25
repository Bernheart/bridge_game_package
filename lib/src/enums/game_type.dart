import 'package:bridge_game/bridge_game.dart';

enum GameType implements Displayable {
  single,
  match,
  tournament;

  @override
  String display() {
    switch (this) {
      case single:
        return 'ST';
      case match:
        return 'M';
      case tournament:
        return 'T';
    }
  }

  factory GameType.fromGame(dynamic game) {
    if (game is SingleTableGame) {
      return single;
    } else if (game is MatchGame) {
      return match;
    } else {
      throw ArgumentError('Unknown game type: ${game.runtimeType}');
    }
  }
}
