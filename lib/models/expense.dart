import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

final formatter = DateFormat.yMd();

const uuid = Uuid();

// Dart feature that allow us to create a custom type
enum Category { food, travel, leisure, work }

const categoryIcons = {
  Category.food: Icons.lunch_dining,
  Category.work: Icons.work,
  Category.travel: Icons.flight_takeoff,
  Category.leisure: Icons.movie,
};

class Expense {
  // : with values that are NOT received as constructor function arguments
  Expense({
    required this.date,
    required this.title,
    required this.amount,
    required this.category,
  }) : id = uuid.v4();

  final String id;
  final String title;
  final double amount;
  final DateTime date;
  final Category category;

  String get formattedDate {
    return formatter.format(date);
  }
}
