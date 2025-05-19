import 'package:expenses_tracker/models/expense.dart';
import 'package:expenses_tracker/screen/new_item.dart';
import 'package:expenses_tracker/widgets/expenses_list.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<Expenses> createState() => _ExpensesState();
}

class _ExpensesState extends State<Expenses> {
  void showNewItemOverLay() {
    showModalBottomSheet(
      context: context,
      builder: (context) {
        return NewItem();
      },
    );
  }

  List<Expense> expenses = [
    Expense(Category.houses, DateTime.now(), 20, "banana"),
    Expense(Category.travel, DateTime.now(), 20, "USA"),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Expenses"),
        actions: [
          IconButton.outlined(
            onPressed: showNewItemOverLay,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: ExpensesList(expensesList: expenses),
    );
  }
}
