import 'dart:math';

class VPTable {
  static double countVP(int margin, int numberOfBoards) {
    double tau = (sqrt(5) - 1) / 2;
    double B = 15 * sqrt(numberOfBoards);
    double res = 10 + 10 * ((1 - pow(tau, 3 * margin / B)) / (1 - pow(tau, 3)));
    return min(double.parse(res.toStringAsFixed(2)), 20);
  }

  static List<double> createVPTable(int numberOfBoards) {
    List<double> vpTable = [];
    int margin = 0;
    while (true) {
      vpTable.add(countVP(margin++, numberOfBoards));
      if (vpTable.last == 20) break;
    }

    bool needsAdjustment = true;
    while (needsAdjustment) {
      needsAdjustment = false;
      for (int i = 1; i < vpTable.length - 1; i++) {
        if (double.parse((vpTable[i + 1] + vpTable[i - 1] - 2 * vpTable[i])
                .toStringAsFixed(2)) >
            0) {
          vpTable[i] = double.parse((vpTable[i] + 0.01).toStringAsFixed(2));
          needsAdjustment = true;
        }
      }
    }
    return vpTable;
  }

  static List<Map<String, String>> toList(int numberOfBoards) {
    List<Map<String, String>> list = [];
    List<double> vpTable = createVPTable(numberOfBoards);
    for (int i = 0; i < vpTable.length; i++) {
      list.add({
        'imps': i.toString(),
        'vp':
            '${vpTable[i].toStringAsFixed(2)} : ${(20 - vpTable[i]).toStringAsFixed(2)}',
      });
    }
    list.last['imps'] = '${list.last['imps']}+';
    return list;
  }
}
