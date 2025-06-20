import 'package:expense_tracker/models/expanses.dart';
import 'package:flutter/material.dart';

class ExpansesItem extends StatelessWidget {
  const ExpansesItem({required this.expanses, super.key});

  final ExpansesDto expanses;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    return Card(
      elevation: 6,
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
      color: Color.fromARGB(18, 82, 75, 62),
      shadowColor: Color.fromARGB(54, 82, 75, 62),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              expanses.title,
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.bold,
                color: colorScheme.onSurface,
              ),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 12,
                    vertical: 6,
                  ),
                  decoration: BoxDecoration(
                    color: Color.fromARGB(54, 120, 100, 170),
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: Text(
                    '\$${expanses.amount.toStringAsFixed(2)}',
                    style: theme.textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.bold,
                      color: colorScheme.primary,
                    ),
                  ),
                ),
                const Spacer(),
                Row(
                  children: [
                    CircleAvatar(
                      backgroundColor: Color.fromARGB(54, 82, 75, 62),
                      radius: 16,
                      child: Icon(
                        CategoryIcons[expanses.category],
                        color: colorScheme.secondary,
                        size: 18,
                      ),
                    ),
                    const SizedBox(width: 8),
                    Text(
                      expanses.getFormattedDate(),
                      style: theme.textTheme.bodySmall?.copyWith(
                        color: colorScheme.onSurface.withOpacity(0.7),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
