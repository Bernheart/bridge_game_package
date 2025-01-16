bool formulaValidator(String formula) {
  // Check if parentheses match
  if (!_areParenthesesBalanced(formula)) return false;

  // Ensure only allowed characters are present
  final validCharacters =
      RegExp(r'^[\d\s\+\-\*/\(\),a-zA-Z]+$'); // Allowed characters
  if (!validCharacters.hasMatch(formula)) return false;

  // Check for invalid variable names
  final variableRegex = RegExp(r'\b[a-zA-Z]+\b');
  final variables =
      variableRegex.allMatches(formula).map((m) => m.group(0)).toSet();
  const allowedVariables = {
    'participants',
    'place',
    'typeFactor',
    'min',
    'max'
  };
  if (!variables.every((variable) => allowedVariables.contains(variable))) {
    return false;
  }

  // Validate math functions (min and max)
  final functionRegex = RegExp(r'\b(min|max)\s*\(([^,]+),([^,]+)\)');
  final functionMatches = functionRegex.allMatches(formula);

  // Check if all functions follow the correct syntax
  for (final match in functionMatches) {
    final arg1 = match.group(2)!.trim();
    final arg2 = match.group(3)!.trim();

    // Ensure arguments are valid sub-expressions
    if (!_isValidSubExpression(arg1) || !_isValidSubExpression(arg2)) {
      return false;
    }
  }

  // Ensure there are no invalid uses of min/max
  if (formula.contains(RegExp(r'\b(min|max)\b')) &&
      !functionRegex.hasMatch(formula)) {
    return false;
  }

  // If all checks pass, the formula is valid
  return true;
}

bool _areParenthesesBalanced(String formula) {
  int balance = 0;
  for (var char in formula.split('')) {
    if (char == '(') balance++;
    if (char == ')') balance--;
    if (balance < 0) return false; // Unmatched closing parenthesis
  }
  return balance == 0;
}

bool _isValidSubExpression(String expression) {
  // Check if the sub-expression is a valid number, variable, or a mathematical expression
  final validSubExpression =
      RegExp(r'^[\d\+\-\*/\s\(\)participantsplacetypeFactor]+$');
  return validSubExpression.hasMatch(expression);
}
