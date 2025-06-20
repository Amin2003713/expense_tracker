import 'package:expense_tracker/models/expanses.dart';
import 'package:expense_tracker/widget/expanses/expanses_list/expanses_item.dart';
import 'package:flutter/cupertino.dart';

class ExpansesList extends StatelessWidget {
  const ExpansesList({super.key, required this.expanses});

  final List<ExpansesDto> expanses;

  @override
  Widget build(BuildContext context) => ListView.builder(
    itemCount: expanses.length,
    itemBuilder: (ctx, index) => ExpansesItem(expanses: expanses[index]),
  );
}
