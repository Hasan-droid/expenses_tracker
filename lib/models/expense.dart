import 'package:flutter/material.dart';
import "package:intl/intl.dart" as intl;

final formatter = intl.DateFormat.yMd();

enum Category { travel, houses }

const categoryIcons = {
  Category.houses: Icons.home,
  Category.travel: Icons.airplanemode_active_outlined,
};

class Expense {
  final Category category;
  final DateTime _date;
  final double amount;
  final String title;

  const Expense(this.category, this._date, this.amount, this.title);

  get formattedDate {
    return formatter.format(_date);
  }
}

class ExpenseBucket {
  final List<Expense> expenses;
  final Category category;

  ExpenseBucket(this.category, this.expenses);

  ExpenseBucket.forCategory(List<Expense> allExpenses, this.category)
    : expenses =
          allExpenses.where((exsp) => exsp.category == category).toList();

  double get totalExpenses {
    double sum = 0;

    for (final expense in expenses) {
      sum += expense.amount; // sum = sum + expense.amount
    }

    return sum;
  }
}
