import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewItem extends StatefulWidget {
  NewItem({super.key, required this.onAddNewItem});

  void Function(Expense expense) onAddNewItem;

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _inputTextController = TextEditingController();
  final _inputAmountController = TextEditingController();
  Category _categoryValue = Category.houses;
  DateTime? _dateValue;

  _presentDatePicker() async {
    final now = DateTime.now();
    final firstDate = DateTime(now.year - 1);
    DateTime? pickedDate = await showDatePicker(
      context: context,
      firstDate: firstDate,
      lastDate: now,
    );
    if (pickedDate == null) {
      return;
    }

    setState(() {
      _dateValue = pickedDate;
    });
  }

  _submitInputs() {
    final parsedAmount = double.tryParse(_inputAmountController.text);
    final isValidAmount = parsedAmount != null && parsedAmount > 0;
    if (!isValidAmount ||
        _inputTextController.text.trim().isEmpty ||
        _dateValue == null) {
      return showDialog(
        context: context,
        builder:
            (ctx) => AlertDialog(
              title: Text("Invalid Input"),
              content: Text("Some inputs are invalid"),
              actions: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("OK"),
                ),
              ],
            ),
      );
    }

    widget.onAddNewItem(
      Expense(
        _categoryValue,
        _dateValue!,
        double.parse(_inputAmountController.text),
        _inputTextController.text,
      ),
    );
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _inputTextController.dispose();
    _inputAmountController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          TextField(
            decoration: InputDecoration(label: Text("Title")),
            controller: _inputTextController,
            maxLength: 50,
            keyboardType: TextInputType.text,
          ),

          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: TextField(
                  decoration: InputDecoration(
                    label: Text("Amount"),
                    prefix: Text("\$ "),
                  ),
                  controller: _inputAmountController,
                  keyboardType: TextInputType.number,
                ),
              ),
              SizedBox(width: 30),
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    _dateValue != null
                        ? Text(formatter.format(_dateValue!))
                        : Text("selected Date"),
                    IconButton(
                      onPressed: () {
                        _presentDatePicker();
                      },
                      icon: Icon(Icons.date_range),
                    ),
                  ],
                ),
              ),
            ],
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            child: Row(
              children: [
                DropdownButton(
                  value: _categoryValue,
                  items:
                      Category.values
                          .map(
                            (category) => DropdownMenuItem(
                              value: category,
                              child: Text(category.name),
                            ),
                          )
                          .toList(),
                  onChanged: (value) {
                    if (value == null) return;
                    setState(() {
                      _categoryValue = value!;
                    });
                  },
                ),
                Spacer(),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"),
                ),
                SizedBox(width: 6),
                ElevatedButton(onPressed: _submitInputs, child: Text("Save")),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
