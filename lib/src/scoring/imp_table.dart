import 'package:bridge_game/src/utils/range.dart';

class ImpTable {
  // list index is the number of imps
  static const List<Range> pointsRanges = [
    Range(0, 10), // 0 IMP
    Range(20, 40), // 1
    Range(50, 80), // 2
    Range(90, 120), // 3
    Range(130, 160), // 4
    Range(170, 210), // 5
    Range(220, 260), // 6
    Range(270, 310), // 7
    Range(320, 360), // 8
    Range(370, 420), // 9
    Range(430, 490), // 10
    Range(500, 590), // 11
    Range(600, 740), // 12
    Range(750, 890), // 13
    Range(900, 1090), // 14
    Range(1100, 1290), // 15
    Range(1300, 1490), // 16
    Range(1500, 1740), // 17
    Range(1750, 1990), // 18
    Range(2000, 2240), // 19
    Range(2250, 2490), // 20
    Range(2500, 2990), // 21
    Range(3000, 3490), // 22
    Range(3500, 3990), // 23
    Range(4000, 20000), // 24
  ];

  // Method to get the index based on points using binary search
  static getIMPs(int score) {
    // bc points can be negative
    int scorePositive = score.abs();

    int low = 0;
    int high = pointsRanges.length - 1;

    // binsearch on pointsRange
    while (low <= high) {
      int mid = low + ((high - low) >> 1); // Avoids overflow

      // Check if points is within the range of mid
      if (pointsRanges[mid].contains(scorePositive)) {
        return score < 0
            ? -mid
            : mid; // Found the index (~change back to negative)
      } else if (scorePositive < pointsRanges[mid].start) {
        high = mid - 1; // Search the left half
      } else {
        low = mid + 1; // Search the right half
      }
    }
    return -1; // Return -1 if no interval contains the points
  }

  static List<Map<String, String>> toList() {
    List<Map<String, String>> list = [];
    for (int i = 0; i < 25; i++) {
      list.add({
        'range': '${pointsRanges[i].start} - ${pointsRanges[i].end}',
        'imps': i.toString(),
      });
    }
    list.last['range'] = '4000+';
    return list;
  }
}
