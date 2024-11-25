import 'package:bridge_game/bridge_game.dart';
import 'package:bridge_game/src/utils/displayable_interface.dart';

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
}
