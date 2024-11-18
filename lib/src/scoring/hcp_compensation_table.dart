import 'dart:math';

import 'package:bridge_game/src/enums/vulnerability.dart';
import 'package:bridge_game/src/scoring/imp_table.dart';

class HcpCompensationTable {
  static int index = 1;
  static const List<Map<Vulnerability, List<int>>> pointsCompensationMap = [
    {
      Vulnerability.notVulnerable: [
        0, // 0 HCP Diffrence
        50, // 1
        70, // 2
        110, // 3
        200, // 4
        300, // 5
        350, // 6
        400, // 7
        430, // 8
        460, // 9
        490, // 10
        600, // 11
        700, // 12
        900, // 13
        1000, // 14
        1100, // 15
        1200, // 16
        1300, // 17+
      ],
      Vulnerability.vulnerable: [
        0, // 0 HCP Diffrence
        50, // 1
        70, // 2
        110, // 3
        290, // 4
        440, // 5
        520, // 6
        610, // 7
        630, // 8
        660, // 9
        690, // 10
        900, // 11
        1050, // 12
        1330, // 13
        1500, // 14
        1650, // 15
        1800, // 16
        1950, // 17+
      ]
    },
    {
      Vulnerability.notVulnerable: [
        0, // 0 HCP Diffrence
        50, // 1
        70, // 2
        110, // 3
        200, // 4
        300, // 5
        350, // 6
        400, // 7
        430, // 8
        460, // 9
        490, // 10
        600, // 11
        700, // 12
        900, // 13
        1000, // 14
        1100, // 15
        1200, // 16
        1400, // 17+
      ],
      Vulnerability.vulnerable: [
        0, // 0 HCP Diffrence
        50, // 1
        70, // 2
        110, // 3
        290, // 4
        440, // 5
        520, // 6
        600, // 7
        630, // 8
        660, // 9
        690, // 10
        800, // 11
        1050, // 12
        1350, // 13
        1500, // 14
        1650, // 15
        1800, // 16
        2100, // 17+
      ]
    }
  ];

  // getiing compensation in single game from hcp
  static int getCompensation(int hcpNS, Vulnerability vul) {
    // getting hcp diff
    final int hcpDiff = min(17, (hcpNS - 20).abs());

    // getting commpensation
    int compensation = pointsCompensationMap[index][vul]?[hcpDiff] ?? 0;

    // changing to - for EW
    if (hcpNS < 20) compensation *= -1;

    return compensation;
  }

  static int getIMPs(int score, int hcpNS, Vulnerability vul) {
    return ImpTable.getIMPs(score - getCompensation(hcpNS, vul));
  }

  static List<Map<String, String>> toList() {
    List<Map<String, String>> list = [];
    for (int i = 0; i < 18; i++) {
      list.add({
        'hcp': (i + 20).toString(),
        'unvulnerable': pointsCompensationMap[index]
                    [Vulnerability.notVulnerable]?[i]
                .toString() ??
            "0",
        'vulnerable': pointsCompensationMap[index][Vulnerability.vulnerable]?[i]
                .toString() ??
            "0",
      });
    }
    list.last['hcp'] = '37+';
    return list;
  }
}
