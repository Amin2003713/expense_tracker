import 'package:expense_tracker/widget/expanses_list/expanses_list.dart';
import 'package:flutter/material.dart';

import '../models/expanses.dart';

class Expanses extends StatefulWidget {
  const Expanses({super.key});

  @override
  State<StatefulWidget> createState() => _ExpansesState();
}

class _ExpansesState extends State<Expanses> {
  final List<ExpansesDto> Epanses = ExpansesDto.GetDummy();

  @override
  Widget build(BuildContext context) => Scaffold(
    body: Column(
      children: [
        Text('data'),
        Expanded(child: ExpansesList(expanses: Epanses)),
      ],
    ),
  );
}
