import 'package:expense_tracker/widget/expanses/Modals/AddExpanse/expanseModal.dart';
import 'package:expense_tracker/widget/expanses/expanses_list/expanses_list.dart';
import 'package:flutter/material.dart';

import '../../models/expanses.dart';

class Expanses extends StatefulWidget {
  const Expanses({super.key});

  @override
  State<StatefulWidget> createState() => _ExpansesState();
}

class _ExpansesState extends State<Expanses> {
  final List<ExpansesDto> Epanses = ExpansesDto.GetDummy();

  void addExpanse(ExpansesDto dto) {
    setState(() {
      Epanses.add(dto);
    });
  }

  void _openAddExpansesOverlay() {
    showModalBottomSheet(
      isScrollControlled: true,
      context: context,
      builder: (ctx) => NewExpanseModal(addExpanse: addExpanse),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('Expanses Tracker'),
      actions: [
        IconButton(onPressed: _openAddExpansesOverlay, icon: Icon(Icons.add)),
      ],
    ),
    body: Column(
      children: [
        Text('data'),
        Expanded(child: ExpansesList(expanses: Epanses)),
      ],
    ),
  );
}
