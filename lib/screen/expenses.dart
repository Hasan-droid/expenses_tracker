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
      isScrollControlled: true,
      context: context,
      builder: (context) {
        return NewItem(onAddNewItem: addNewItem);
      },
    );
  }

  void addNewItem(Expense expense) {
    setState(() {
      expenses.add(expense);
    });
  }

  void removeItem(Expense expense) {
    final expenseIndex = expenses.indexOf(expense);

    setState(() {
      expenses.remove(expense);
    });
    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("Expense Delete"),
        action: SnackBarAction(
          label: "undo",
          onPressed: () {
            insertItem(expense, expenseIndex);
          },
        ),
      ),
    );
  }

  void insertItem(Expense expense, int index) {
    setState(() {
      expenses.insert(index, expense);
    });
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
      body: ExpensesList(expensesList: expenses, onRemoveItem: removeItem),
    );
  }
}
