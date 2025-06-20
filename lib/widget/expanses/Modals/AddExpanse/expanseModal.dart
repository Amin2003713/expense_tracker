import 'package:flutter/material.dart';

import '../../../../models/expanses.dart';

class NewExpanseModal extends StatefulWidget {
  NewExpanseModal({required this.addExpanse, super.key});

  void Function(ExpansesDto dto) addExpanse;

  @override
  State<StatefulWidget> createState() => _NewExpanseModal();
}

class _NewExpanseModal extends State<NewExpanseModal> {
  final _titleController = TextEditingController();
  final _amountController = TextEditingController();

  DateTime? _selectedDate;
  Categories _selectedCategory = Categories.work;
  final _date = DateTime.now();

  void _showDatePicker() async {
    var pickedDate = await showDatePicker(
      context: context,
      firstDate: DateTime(_date.year - 1, _date.month, _date.day),
      lastDate: _date,
      initialDate: _date,
    );

    setState(() {
      _selectedDate = pickedDate;
    });
  }

  void _submit() {
    var amount = double.tryParse(_amountController.text.trim());
    if (_titleController.value.text.trim().isEmpty ||
        amount == null ||
        amount <= 0 ||
        _selectedDate == null) {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: Text('invalid inputs!'),
          icon: Icon(Icons.error),
          content: Text('insure u have entered all write'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('Ok'),
            ),
          ],
        ),
      );
      return;
    }
    //
    var expanse = ExpansesDto(
      title: _titleController.text.trim(),
      amount: amount,
      date: _selectedDate!,
      category: _selectedCategory,
    );
    setState(() {
      widget.addExpanse(expanse);
    });
    Navigator.pop(context);
  }

  @override
  void dispose() {
    _titleController.dispose();
    _amountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Padding(
    padding: EdgeInsets.fromLTRB(16, 40, 16, 16),
    child: Column(
      children: [
        TextField(
          controller: _titleController,
          maxLength: 25,
          keyboardType: TextInputType.text,
          decoration: InputDecoration(label: Text('title')),
        ),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: TextField(
                controller: _amountController,
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  label: Text('amount'),
                  prefixText: '\$ ',
                ),
              ),
            ),
            SizedBox(width: 8),
            DropdownButton(
              value: _selectedCategory,
              items: [
                ...Categories.values.map(
                  (category) => DropdownMenuItem(
                    value: category,
                    child: Text(category.name.toUpperCase()),
                  ),
                ),
              ],
              onChanged: (value) {
                if (value == null) return;
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),
            SizedBox(width: 8),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    (_selectedDate == null
                        ? 'select data'
                        : formatter.format(_selectedDate!)),
                  ),
                  IconButton(
                    onPressed: _showDatePicker,
                    icon: const Icon(Icons.calendar_month),
                  ),
                ],
              ),
            ),
          ],
        ),

        Spacer(),
        Row(
          children: [
            ElevatedButton(onPressed: _submit, child: Text('Submit')),
            Spacer(),
            ElevatedButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
          ],
        ),
      ],
    ),
  );
}
