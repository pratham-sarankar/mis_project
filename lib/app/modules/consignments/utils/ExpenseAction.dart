enum ExpenseAction {
  add,
  subtract,
}

extension ExpenseActionExtension on ExpenseAction {
  String get name {
    switch (this) {
      case ExpenseAction.add:
        return "Add";
      case ExpenseAction.subtract:
        return "Subtract";
    }
  }
}
