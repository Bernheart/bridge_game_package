import 'package:bridge_game/bridge_game.dart';

enum GameType {
  single('ST'),
  match('M'),
  tournament('T');

  final String acronym;

  const GameType(this.acronym);

  @override
  String toString() {
    return acronym;
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
