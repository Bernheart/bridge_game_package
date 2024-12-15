import 'package:bridge_game/src/enums/suit_type.dart';
import 'package:bridge_game/src/enums/vulnerability.dart';

enum ContractType {
  pass('PASS', 0, 0),
  notDoubled('', -1, 50),
  doubled('x', 100, 300),
  redoubled('xx', 200, 600);

  final String string;
  final int overtrickPoints;
  final int undertrickPoints;

  const ContractType(this.string, this.overtrickPoints, this.undertrickPoints);

  @override
  String toString() {
    return string;
  }

  bool isNotDoubled() {
    return this == ContractType.notDoubled;
  }

  factory ContractType.fromString(String s) {
    switch (s.toLowerCase()) {
      case 'x':
        return doubled;
      case 'xx':
        return redoubled;
      default:
        return notDoubled;
    }
  }

  // int pointsPerOvertrick(SuitType suitType, Vulnerability vul) {
  //   switch (this) {
  //     case pass:
  //       return 0;
  //     case notDoubled:
  //       return suitType.pointsForTrick;
  //     case doubled:
  //       return vul.ifVulnerable(200, 100);
  //     case redoubled:
  //       return vul.ifVulnerable(400, 200);
  //   }
  // }

  int pointsPerOvertrick(SuitType suitType, Vulnerability vulnerability) {
    if (this == ContractType.notDoubled) return suitType.pointsForTrick;
    if (vulnerability == Vulnerability.vulnerable) return overtrickPoints * 2;
    return overtrickPoints;
  }

  int pointsPerUndertrick(Vulnerability vulnerability) {
    if (this == ContractType.notDoubled &&
        vulnerability == Vulnerability.vulnerable) {
      return undertrickPoints * 2; // Apply vulnerability logic
    }
    return undertrickPoints; // For other cases, no vulnerability logic needed
  }
}
