import 'package:bridge_game/src/utils/displayable_interface.dart';
import 'package:bridge_game/src/enums/suit_type.dart';
import 'package:bridge_game/src/enums/vulnerability.dart';

enum ContractType implements Displayable {
  pass,
  notDoubled,
  doubled,
  redoubled;

  @override
  String display() {
    switch (this) {
      case pass:
        return 'PASS';
      case notDoubled:
        return '';
      case doubled:
        return 'x';
      case redoubled:
        return 'xx';
    }
  }

  bool isNotDoubled() {
    return this == ContractType.notDoubled;
  }

  static ContractType fromString(String s) {
    switch (s.toLowerCase()) {
      case 'x':
        return doubled;
      case 'xx':
        return redoubled;
      default:
        return notDoubled;
    }
  }

  int pointsPerOvertrick(SuitType suitType, Vulnerability vul) {
    switch (this) {
      case pass:
        return 0;
      case notDoubled:
        return suitType.pointsForTrick();
      case doubled:
        return vul.ifVulnerable(200, 100);
      case redoubled:
        return vul.ifVulnerable(400, 200);
    }
  }

  int pointsPerUndertrick(Vulnerability vul) {
    switch (this) {
      case pass:
        return 0;
      case notDoubled:
        return vul.ifVulnerable(100, 50);
      case doubled:
        return 300;
      case redoubled:
        return 600;
    }
  }
}
