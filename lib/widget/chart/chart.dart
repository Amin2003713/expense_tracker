import 'package:expense_tracker/models/ExpenseBucket.dart';
import 'package:expense_tracker/models/expanses.dart';
import 'package:expense_tracker/widget/chart/chart_Bar.dart';
import 'package:flutter/material.dart';

class Chart extends StatelessWidget {
  const Chart({super.key, required this.expences});

  final List<ExpansesDto> expences;

  List<ExpenseBucket> get bucket {
    return [
      ExpenseBucket.forCategory(Categories.work, expences),
      ExpenseBucket.forCategory(Categories.food, expences),
      ExpenseBucket.forCategory(Categories.travel, expences),
      ExpenseBucket.forCategory(Categories.leisure, expences),
    ];
  }

  double get totalExpanse {
    double sum = 0;
    for (var b in bucket) {
      if (b.getTotalExpense > sum) {
        sum = b.getTotalExpense;
      }
    }

    return sum;
  }

  @override
  Widget build(BuildContext context) {
    var theme = MediaQuery.of(context);
    return Container(
      margin: EdgeInsets.all(16),
      padding: EdgeInsets.symmetric(horizontal: 8, vertical: 16),
      width: double.infinity,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        gradient: LinearGradient(
          colors: [
            Theme.of(context).colorScheme.secondary.withAlpha(30),
            Theme.of(context).colorScheme.primary.withAlpha(60),
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                ...bucket.map(
                  (e) => ChartBar(fill: e.getTotalExpense / totalExpanse),
                ),
              ],
            ),
          ),
          SizedBox(height: 7),
          Expanded(
            child: Row(
              children: bucket
                  .map(
                    (e) => Expanded(
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4,
                          vertical: 2,
                        ),
                        child: Icon(
                          CategoryIcons[e.category],
                          color: theme.platformBrightness == Brightness.dark
                              ? Theme.of(context).colorScheme.secondary
                              : Theme.of(
                                  context,
                                ).colorScheme.primary.withAlpha(70),
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
