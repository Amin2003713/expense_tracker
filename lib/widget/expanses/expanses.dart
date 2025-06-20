import 'package:expense_tracker/widget/chart/chart.dart';
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

  Widget get mainContent {
    final isLand = MediaQuery.of(context).orientation == Orientation.landscape;

    var notEmptyCont = !isLand
        ? Column(
            children: [
              Expanded(child: Chart(expences: Epanses)),
              Expanded(
                child: ExpansesList(expanses: Epanses, remove: _removeExpanse),
              ),
            ],
          )
        : Row(
            children: [
              Expanded(child: Chart(expences: Epanses)),
              Expanded(
                child: ExpansesList(expanses: Epanses, remove: _removeExpanse),
              ),
            ],
          );

    var emptyCont = Center(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text('add one?'),
          IconButton(
            onPressed: _openAddExpansesOverlay,
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );

    return Column(
      children: [
        Expanded(child: Epanses.isNotEmpty ? notEmptyCont : emptyCont),
      ],
    );
  }

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

  void _removeExpanse(ExpansesDto dto) {
    final index = Epanses.indexOf(dto);
    setState(() {
      Epanses.remove(dto);
    });
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: Duration(seconds: 3),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              Epanses.insert(index, dto);
            });
          },
        ),
        content: Text('data'),
      ),
    );
  }

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(
      title: Text('expense Tracker'),
      actions: [
        IconButton(onPressed: _openAddExpansesOverlay, icon: Icon(Icons.add)),
      ],
    ),
    body: mainContent,
  );
}
