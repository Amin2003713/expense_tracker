import 'package:expense_tracker/models/expanses.dart';

class ExpenseBucket {
  const ExpenseBucket({required this.category, required this.expansesDto});

  ExpenseBucket.forCategory(this.category, List<ExpansesDto> expanses)
    : expansesDto = expanses
          .where((element) => element.category == category)
          .toList();

  final Categories category;
  final List<ExpansesDto> expansesDto;

  double get getTotalExpense {
    double sum = 0;

    for (final ex in expansesDto) {
      sum += ex.amount;
    }

    return sum;
  }
}
