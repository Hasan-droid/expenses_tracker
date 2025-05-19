import 'package:expenses_tracker/models/expense.dart';
import 'package:flutter/material.dart';

class NewItem extends StatefulWidget {
  const NewItem({super.key});

  @override
  State<NewItem> createState() => _NewItemState();
}

class _NewItemState extends State<NewItem> {
  final _inputTextController = TextEditingController();
  final _inputNumberController = TextEditingController();
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

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _inputTextController.dispose();
    _inputNumberController.dispose();
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
                  controller: _inputNumberController,
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
                ElevatedButton(onPressed: () {}, child: Text("Save")),
                SizedBox(width: 6),
                OutlinedButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  child: Text("Cancel"),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
