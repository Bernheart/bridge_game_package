import 'dart:math';

import 'package:bridge_game/src/enums/scoring_and_tournament_type.dart';
import 'package:math_expressions/math_expressions.dart';

enum TournamentRank {
  otx_4x('OTX****', 25, 200, 100, 40, 300, 100),
  otx_3x('OTX***', 15, 150, 100, 25, 200, 100),
  otx_2x('OTX**', 10, 75, 50, 15, 100, 100),
  otx_x('OTX*', 7, 50, 50, 10, 70, 50),
  otx('OTX', 5, 0, 0, 7, 0, 0),
  rtx('RTX', 4, 0, 0, 5, 0, 0),
  okrTx('Okr. TX', 2, 0, 0, 3, 0, 0),
  clubTx('Klub. TX', 1, 0, 0, 2, 0, 0);

  final String fullName;
  // ignore: non_constant_identifier_names
  final int RT, RTu40;
  // ignore: non_constant_identifier_names
  final int PZ, PZu40;
  final int aPKL, aPKLu40;

  const TournamentRank(this.fullName, this.RTu40, this.PZu40, this.aPKLu40,
      this.RT, this.PZ, this.aPKL);

  int getRT(int boards) {
    return (boards >= 40) ? RT : RTu40;
  }

  int getPZ(int boards) {
    return (boards >= 40) ? PZ : PZu40;
  }

  int getaPKL(int boards) {
    return (boards >= 40) ? aPKL : aPKLu40;
  }

  @override
  String toString() {
    return fullName;
  }
}

List<int> calculatePKL(int numOfParticipants, int nofPlayers,
    TournamentRank rank, double sumaWK, TournamentType type, int nofBoards) {
  List<int> res = [];
  // ignore: non_constant_identifier_names
  int PZ = (max(
              max((sumaWK / nofPlayers), 0.15) * rank.getRT(nofBoards) +
                  0.05 * nofPlayers,
              rank.getPZ(nofBoards).toDouble()) *
          ((type == TournamentType.teams) ? 1.25 : 1))
      .ceil();

  double twoPercentIndex = 0.02 * numOfParticipants;
  double twentyPercentIndex = 0.2 * numOfParticipants;
  double fiftyPercentIndex = 0.5 * numOfParticipants;

  res.add(PZ);

  for (int place = 2; place <= numOfParticipants; place++) {
    double factor = (place - 1);
    if (factor < twoPercentIndex) {
      res.add(((PZ * (twoPercentIndex - factor) + 0.9 * PZ * factor) /
              twoPercentIndex)
          .ceil());
    } else if (factor < twentyPercentIndex) {
      res.add(((0.9 * PZ * (twentyPercentIndex - factor) +
                  0.2 * PZ * (factor - twoPercentIndex)) /
              (twentyPercentIndex - twoPercentIndex))
          .ceil());
    } else if (factor < fiftyPercentIndex) {
      res.add(((0.2 * PZ * (fiftyPercentIndex - factor)) /
              (fiftyPercentIndex - twentyPercentIndex))
          .ceil());
    } else {
      res.add(1);
    }
  }

  return res;
}

List<int> calculateCP(int numOfParticipants, TournamentType type,
    {String formula =
        '(participants - place + 1) * typeFactor + max(0, 5 - (place - 1) * 2)'}) {
  List<int> res = [];
  int tournamentTypeFactor = (type == TournamentType.teams) ? 4 : 2;

  for (int place = 1; place <= numOfParticipants; place++) {
    /*res.add(((numOfParticipants - place + 1) * tournamentTypeFactor +
            max(0, 5 - (place - 1) * 2))
        .ceil());*/

    res.add(calculateValue(
        numOfParticipants, tournamentTypeFactor, place, formula));
  }
  return res;
}

int calculateValue(
    int participants, int typeFactor, int place, String formula) {
  formula = formula
      .replaceAll('participants', participants.toString())
      .replaceAll('typeFactor', typeFactor.toString())
      .replaceAll('place', place.toString());

  if (_hasMismatchedParentheses(formula)) {
    throw Exception('Mismatched parentheses in formula: $formula');
  }

  formula = _processMaxFunctions(formula);
  formula = _processMinFunctions(formula);

  return _evaluateExpression(formula).round();
}

bool _hasMismatchedParentheses(String formula) {
  int count = 0;
  for (int i = 0; i < formula.length; i++) {
    if (formula[i] == '(') count++;
    if (formula[i] == ')') count--;
    if (count < 0) return true;
  }
  return count != 0;
}

String _processMinFunctions(String formula) {
  //Najbardziej zajebisty regex jaki widziałem
  final minRegex = RegExp(
      r'min\(((?:[^)(]+|\((?:[^)(]+|\([^)(]*\))*\))*)\s*,\s*((?:[^)(]+|\((?:[^)(]+|\([^)(]*\))*\))*)\)');

  while (minRegex.hasMatch(formula)) {
    formula = formula.replaceAllMapped(minRegex, (match) {
      final firstValue = _evaluateExpression(match[1]!.trim());
      final secondValue = _evaluateExpression(match[2]!.trim());

      return '(${min(firstValue, secondValue)})';
    });
  }

  return formula;
}

String _processMaxFunctions(String formula) {
  //Najbardziej zajebisty regex jaki widziałem
  final maxRegex = RegExp(
      r'max\(((?:[^)(]+|\((?:[^)(]+|\([^)(]*\))*\))*)\s*,\s*((?:[^)(]+|\((?:[^)(]+|\([^)(]*\))*\))*)\)');

  while (maxRegex.hasMatch(formula)) {
    formula = formula.replaceAllMapped(maxRegex, (match) {
      final firstValue = _evaluateExpression(match[1]!.trim());
      final secondValue = _evaluateExpression(match[2]!.trim());

      return '(${max(firstValue, secondValue)})';
    });
  }

  return formula;
}

double _evaluateExpression(String expression) {
  try {
    // Use the math_expressions library to evaluate the expression
    final parser = Parser();
    final exp = parser.parse(expression);
    final context = ContextModel();
    final result = exp.evaluate(EvaluationType.REAL, context);

    return result;
  } catch (e) {
    throw Exception('Error evaluating expression: $expression\n$e');
  }
}
