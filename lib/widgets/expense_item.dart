import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class ExpenseItem extends StatelessWidget {
  ExpenseItem({super.key, required this.expenseItem});

  Expense expenseItem;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            expenseItem.title,
            style: Theme.of(context).textTheme.titleLarge,
          ),
          Row(
            children: [
              Text('\$${expenseItem.amount}'),
              Spacer(),
              Icon(categoryIcons[expenseItem.category]),
              SizedBox(width: 8),
              Text(expenseItem.formattedDate),
            ],
          ),
        ],
      ),
    );
  }
}
