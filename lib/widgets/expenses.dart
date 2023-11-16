import 'package:expense_tracker/widgets/expenses_list/expenses_list.dart';
import 'package:expense_tracker/models/expense.dart';
import 'package:expense_tracker/widgets/new_expense.dart';
import 'package:flutter/material.dart';

class Expenses extends StatefulWidget {
  const Expenses({super.key});

  @override
  State<StatefulWidget> createState() {
    return _ExpensesState();
  }
}

class _ExpensesState extends State<Expenses> {
  final List<Expense> _registeredExpenses = [
    Expense(
      date: DateTime.now(),
      title: 'Flutter Course',
      amount: 19.99,
      category: Category.work,
    ),
    Expense(
      date: DateTime.now(),
      title: 'Cinema',
      amount: 15.69,
      category: Category.leisure,
    ),
  ];

  void _openAddExpenseOverlay() {
    // show... build-in feature (build-in function provide by Flutter)
    // context (Object is full of metadata): holds information about this expenses widget in the end and it's position in the widget tree
    showModalBottomSheet(
      context: context,
      isScrollControlled: true, // all screen
      builder: (ctx) => NewExpense(
        onAddExpense: _addExpense,
      ),
    );
  }

  void _addExpense(Expense expense) {
    setState(() {
      _registeredExpenses.add(expense);
    });
  }

  void _removeExpense(Expense expense) {
    setState(() {
      _registeredExpenses.remove(expense);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: _openAddExpenseOverlay,
            icon: Icon(Icons.add),
          ),
        ],
      ),
      body: Column(
        children: [
          const Text('The Chart'),
          Expanded(
            // wrap Expended to solve problem another kind of column inside of a column (doesn't know how to size)
            child: ExpensesList(
              expenses: _registeredExpenses,
              onRemoveExpense: _removeExpense,
            ),
          ),
        ],
      ),
    );
  }
}
