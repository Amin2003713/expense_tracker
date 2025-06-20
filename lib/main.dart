import 'package:expense_tracker/widget/expanses/expanses.dart';
import 'package:flutter/material.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: const Color.fromARGB(255, 22, 158, 225),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: const Color.fromARGB(255, 29, 50, 61),
);

void main() {
  runApp(
    MaterialApp(
      themeMode: ThemeMode.system,
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        cardTheme: CardThemeData().copyWith(
          elevation: 6,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Color.fromARGB(18, 82, 75, 62),
          shadowColor: Color.fromARGB(54, 82, 75, 62),
        ),
      ),
      theme: ThemeData.light().copyWith(
        colorScheme: kColorScheme,
        cardTheme: CardThemeData().copyWith(
          elevation: 6,
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          color: Color.fromARGB(18, 82, 75, 62),
          shadowColor: Color.fromARGB(54, 82, 75, 62),
        ),
      ),
      home: Expanses(),
    ),
  );
}
