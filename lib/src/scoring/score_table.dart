import 'dart:math';

import 'package:bridge_game/src/enums/contract_type.dart';
import 'package:bridge_game/src/enums/suit.dart';
import 'package:bridge_game/src/enums/suit_type.dart';
import 'package:bridge_game/src/enums/vulnerability.dart';

class ScoreTable {
  static const Map<Vulnerability,
      Map<SuitType, Map<ContractType, Map<int, int>>>> scoreMap = {
    Vulnerability.notVulnerable: {
      SuitType.minor: {
        ContractType.notDoubled: {
          1: 70,
          2: 90,
          3: 110,
          4: 130,
          5: 400,
          6: 920,
          7: 1440
        },
        ContractType.doubled: {
          1: 140,
          2: 180,
          3: 470,
          4: 510,
          5: 550,
          6: 1090,
          7: 1630
        },
        ContractType.redoubled: {
          1: 230,
          2: 560,
          3: 640,
          4: 720,
          5: 800,
          6: 1380,
          7: 1960
        },
      },
      SuitType.major: {
        ContractType.notDoubled: {
          1: 80,
          2: 110,
          3: 140,
          4: 420,
          5: 450,
          6: 980,
          7: 1510
        },
        ContractType.doubled: {
          1: 160,
          2: 470,
          3: 530,
          4: 590,
          5: 650,
          6: 1210,
          7: 1770
        },
        ContractType.redoubled: {
          1: 520,
          2: 640,
          3: 760,
          4: 880,
          5: 1000,
          6: 1620,
          7: 2240
        },
      },
      SuitType.noTrump: {
        ContractType.notDoubled: {
          1: 90,
          2: 120,
          3: 400,
          4: 430,
          5: 460,
          6: 990,
          7: 1520
        },
        ContractType.doubled: {
          1: 180,
          2: 490,
          3: 550,
          4: 610,
          5: 670,
          6: 1230,
          7: 1790
        },
        ContractType.redoubled: {
          1: 560,
          2: 680,
          3: 800,
          4: 920,
          5: 1040,
          6: 1660,
          7: 2280
        },
      }
    },
    Vulnerability.vulnerable: {
      SuitType.minor: {
        ContractType.notDoubled: {
          1: 70,
          2: 90,
          3: 110,
          4: 130,
          5: 600,
          6: 1370,
          7: 2140
        },
        ContractType.doubled: {
          1: 140,
          2: 180,
          3: 670,
          4: 710,
          5: 750,
          6: 1540,
          7: 2330
        },
        ContractType.redoubled: {
          1: 230,
          2: 760,
          3: 840,
          4: 920,
          5: 1000,
          6: 1880,
          7: 2660
        },
      },
      SuitType.major: {
        ContractType.notDoubled: {
          1: 80,
          2: 110,
          3: 140,
          4: 620,
          5: 650,
          6: 1430,
          7: 2210
        },
        ContractType.doubled: {
          1: 160,
          2: 670,
          3: 730,
          4: 790,
          5: 850,
          6: 1660,
          7: 2470
        },
        ContractType.redoubled: {
          1: 720,
          2: 840,
          3: 960,
          4: 1080,
          5: 1200,
          6: 2070,
          7: 2940
        },
      },
      SuitType.noTrump: {
        ContractType.notDoubled: {
          1: 90,
          2: 120,
          3: 600,
          4: 630,
          5: 660,
          6: 1440,
          7: 2220
        },
        ContractType.doubled: {
          1: 180,
          2: 690,
          3: 750,
          4: 810,
          5: 870,
          6: 1680,
          7: 2490
        },
        ContractType.redoubled: {
          1: 760,
          2: 880,
          3: 1000,
          4: 1120,
          5: 1240,
          6: 2110,
          7: 2980
        },
      }
    }
  };

  static int getScore(Vulnerability vul, Suit suit, ContractType contractType,
      int level, int trickDiffrence) {
    return trickDiffrence >= 0
        ? findScore(vul, suit.type, contractType, level, trickDiffrence)
        : calculateScorePenalty(vul, contractType, trickDiffrence);
  }

  static int findScore(Vulnerability vul, SuitType suitType,
      ContractType contractType, int level, int trickDiffrence) {
    return (scoreMap[vul]?[suitType]?[contractType]?[level] ?? 0) +
        contractType.pointsPerOvertrick(suitType, vul) * trickDiffrence;
  }

  static int calculateScorePenalty(
      Vulnerability vul, ContractType contractType, int trickDiffrence) {
    if (!contractType.isNotDoubled()) {
      if (vul.isVulnerable()) {
        return (contractType == ContractType.redoubled)
            ? -400 - 600 * (-trickDiffrence - 1)
            : -200 - 300 * (-trickDiffrence - 1);
      } else {
        return (contractType == ContractType.redoubled)
            ? -200 -
                400 * (-trickDiffrence - 1) -
                200 * (max(0, -trickDiffrence - 3))
            : -100 -
                200 * (-trickDiffrence - 1) -
                100 * (max(0, -trickDiffrence - 3));
      }
    }
    return contractType.pointsPerUndertrick(vul) * trickDiffrence;
  }
}
