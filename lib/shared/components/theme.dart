import 'package:flutter/material.dart';

var lightTheme = ThemeData(
  snackBarTheme: SnackBarThemeData(backgroundColor: Colors.green),
  fontFamily: "Quicksand",
  primarySwatch: Colors.red,
  primaryColor: Colors.white,
  brightness: Brightness.light,
  backgroundColor: const Color(0xFFE5E5E5),
  accentColor: Colors.black,
  accentIconTheme: const IconThemeData(color: Colors.white),
  dividerColor: Colors.white54,
);

var darkTheme = ThemeData(
  fontFamily: "Quicksand",
  primarySwatch: Colors.red,
  appBarTheme: AppBarTheme(backgroundColor: Colors.red),
  primaryColor: Colors.black,
  floatingActionButtonTheme:
      FloatingActionButtonThemeData(backgroundColor: Colors.black),
  brightness: Brightness.dark,
  backgroundColor: const Color(0xFF212121),
  accentColor: Colors.white,
  accentIconTheme: const IconThemeData(color: Colors.black),
  dividerColor: Colors.black12,
);
