import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  ExpenseItem({super.key, required this.expenseItem});

  Expense expenseItem;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(expenseItem.title),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
          child: Row(
            children: [
              Text('\$${expenseItem.amount}'),
              Spacer(),
              Icon(categoryIcons[expenseItem.category]),
              SizedBox(width: 8),
              Text(expenseItem.formattedDate),
            ],
          ),
        ),
      ],
    );
  }
}
