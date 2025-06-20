import 'package:expense_tracker/models/expanses.dart';
import 'package:expense_tracker/widget/expanses/expanses_list/expanses_item.dart';
import 'package:flutter/cupertino.dart';

class ExpansesList extends StatelessWidget {
  const ExpansesList({super.key, required this.expanses, required this.remove});

  final List<ExpansesDto> expanses;

  final Function(ExpansesDto dto) remove;

  @override
  Widget build(BuildContext context) => ListView.builder(
    itemCount: expanses.length,
    itemBuilder: (ctx, index) => Dismissible(
      key: ValueKey(expanses[index].id),
      onDismissed: (direction) {
        remove(expanses[index]);
      },
      child: ExpansesItem(expanses: expanses[index]),
    ),
  );
}
