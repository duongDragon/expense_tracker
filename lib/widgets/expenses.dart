import 'package:expense_tracker/widgets/chart/chart.dart';
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
      useSafeArea:
          true, // makes sure that we stay away from the device feature (Scaffold widget auto)
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
    final expenseIndex = _registeredExpenses.indexOf(expense);

    setState(() {
      _registeredExpenses.remove(expense);
    });

    ScaffoldMessenger.of(context).clearSnackBars();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        duration: const Duration(seconds: 3),
        content: const Text('Expense deleted.'),
        action: SnackBarAction(
          label: 'Undo',
          onPressed: () {
            setState(() {
              _registeredExpenses.insert(expenseIndex, expense);
            });
          },
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;

    Widget mainContent = const Center(
      child: Text('No expenses found. Start adding some!'),
    );

    if (_registeredExpenses.isNotEmpty) {
      mainContent = ExpensesList(
        expenses: _registeredExpenses,
        onRemoveExpense: _removeExpense,
      );
    }

    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter expenseTracker'),
          actions: [
            IconButton(
              onPressed: _openAddExpenseOverlay,
              icon: const Icon(Icons.add),
            ),
          ],
        ),
        body: width < 600
            ? Column(
                children: [
                  Chart(expenses: _registeredExpenses),
                  Expanded(
                    // wrap Expanded to solve problem another kind of column inside of a column (doesn't know how to size)
                    child: mainContent,
                  ),
                ],
              )
            : Row(
                children: [
                  // must Expanded here because size constraint
                  Expanded(
                    child: Chart(expenses: _registeredExpenses),
                  ),
                  Expanded(
                    // wrap Expanded to solve problem another kind of column inside of a column (doesn't know how to size)
                    child: mainContent,
                  ),
                ],
              ));
  }
}
