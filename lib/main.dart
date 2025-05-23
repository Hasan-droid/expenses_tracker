import 'package:flutter/material.dart';

import 'package:expenses_tracker/screen/expenses.dart';
import 'package:flutter/services.dart';

var kColorScheme = ColorScheme.fromSeed(
  seedColor: Color.fromARGB(255, 66, 6, 131),
);

var kDarkColorScheme = ColorScheme.fromSeed(
  brightness: Brightness.dark,
  seedColor: Color.fromARGB(255, 40, 20, 50),
);
void main() async {
  //insures widget has initialized , with put this line an error will occur
  WidgetsFlutterBinding.ensureInitialized();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(
    MaterialApp(
      darkTheme: ThemeData.dark().copyWith(
        colorScheme: kDarkColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kDarkColorScheme.primaryContainer,
          foregroundColor: kDarkColorScheme.onPrimaryContainer,
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kDarkColorScheme.secondaryContainer,
          ),
        ),
        cardTheme: CardTheme().copyWith(
          color: kColorScheme.secondary,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        textTheme: ThemeData.dark().textTheme.copyWith(
          titleLarge: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 198, 153, 229),
          ),
        ),
      ),
      theme: ThemeData.light().copyWith(
        colorScheme: kColorScheme,
        appBarTheme: AppBarTheme().copyWith(
          backgroundColor: kColorScheme.primary,
          foregroundColor: kColorScheme.onPrimary,
        ),
        cardTheme: CardTheme().copyWith(
          color: kColorScheme.primaryContainer,
          margin: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: kColorScheme.secondaryContainer,
          ),
        ),
        textTheme: ThemeData.light().textTheme.copyWith(
          titleLarge: TextStyle(
            fontSize: 16,
            color: Color.fromARGB(255, 77, 3, 127),
          ),
          // bodyMedium: TextStyle(color: Colors.black),
          // bodySmall: TextStyle(color: Colors.black),
          // displaySmall: TextStyle(color: Colors.black),
        ),
      ),
      home: Expenses(),
    ),
  );
}
