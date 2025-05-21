import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/widgets/expense_item.dart';
import 'package:flutter/material.dart';

class ExpensesList extends StatelessWidget {
  const ExpensesList({
    super.key,
    required this.expensesList,
    required this.onRemoveItem,
  });
  final void Function(Expense expense) onRemoveItem;
  final List<Expense> expensesList;

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: expensesList.length,
      itemBuilder: (context, index) {
        return Dismissible(
          background: Container(
            margin: Theme.of(context).cardTheme.margin,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Theme.of(context).colorScheme.error,
            ),
          ),

          onDismissed: (direction) => onRemoveItem(expensesList[index]),
          key: ValueKey(expensesList[index]),
          child: Card(child: ExpenseItem(expenseItem: expensesList[index])),
        );
      },
    );
  }
}
