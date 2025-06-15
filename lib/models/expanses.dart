import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

const uuid = Uuid();

enum Categories { food, travel, leisure, work }

const CategoryIcons = {
  Categories.food: Icons.lunch_dining,
  Categories.leisure: Icons.movie,
  Categories.travel: Icons.flight,
  Categories.work: Icons.person_3,
};

final formatter = DateFormat.yMd();

class ExpansesDto {
  ExpansesDto({
    required this.title,
    required this.amount,
    required this.date,
    required this.category,
  }) : id = uuid.v8();

  final String title;
  final double amount;
  final String id;
  final DateTime date;
  final Categories category;

  String getFormattedDate() => formatter.format(date);

  static List<ExpansesDto> GetDummy() => [
    ExpansesDto(
      title: 'flutter',
      amount: 100.99,
      date: DateTime.now(),
      category: Categories.work,
    ),
    ExpansesDto(
      title: 'Pizza',
      amount: 100.12,
      date: DateTime.now(),
      category: Categories.food,
    ),
    ExpansesDto(
      title: 'Sleep',
      amount: 19.93,
      date: DateTime.now(),
      category: Categories.travel,
    ),
  ];
}
