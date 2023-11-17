import 'package:expense_tracker/widgets/expenses.dart';
import 'package:flutter/material.dart';

// starting with k is just a convention you might want to use in Flutter that you set up global variables with the starting character
var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 96, 59, 181),
);

var kDarkColorCheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 5, 9, 125),
);

void main() {
  runApp(
    MaterialApp(
      // theme: ThemeData(useMaterial3: true), // use Material3 look
      darkTheme: ThemeData.dark().copyWith(
        useMaterial3: true,
        colorScheme: kDarkColorCheme,
        cardTheme: const CardTheme().copyWith(
          color: kDarkColorCheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorCheme.primaryContainer,
            foregroundColor: kDarkColorCheme.onPrimaryContainer,
          ),
        ),
      ),
      theme: ThemeData().copyWith(
        // scaffoldBackgroundColor:
        // elevatedButtonTheme: ElevatedButtonThemeData()),
        useMaterial3: true,
        colorScheme: kColorScheme,
        appBarTheme: const AppBarTheme().copyWith(
          backgroundColor: kColorScheme.onPrimaryContainer,
          foregroundColor: kColorScheme.primaryContainer,
        ),
        cardTheme: const CardTheme().copyWith(
          color: kColorScheme.secondaryContainer,
          margin: const EdgeInsets.symmetric(
            horizontal: 16,
            vertical: 8,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.primaryContainer,
          ),
        ),
        textTheme: ThemeData().textTheme.copyWith(
              titleLarge: TextStyle(
                fontWeight: FontWeight.bold,
                color: kColorScheme.onSecondaryContainer,
                fontSize: 16,
              ),
            ),
      ),
      // themeMode: ThemeMode.system,  // default
      home: const Expenses(),
    ),
  );
}
