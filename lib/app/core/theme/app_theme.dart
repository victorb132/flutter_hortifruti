import 'package:flutter/material.dart';

final colorScheme = ColorScheme.fromSeed(
  seedColor: Colors.greenAccent,
);

final radioTheme = RadioThemeData(
  fillColor: MaterialStateColor.resolveWith((states) => colorScheme.primary),
);

final elevatedButtonTheme = ElevatedButtonThemeData(
  style: ElevatedButton.styleFrom(
    foregroundColor: colorScheme.onPrimary,
    backgroundColor: colorScheme.primary,
  ),
);

final ThemeData themeData = ThemeData(
  colorScheme: colorScheme,
  useMaterial3: true,
  radioTheme: radioTheme,
  elevatedButtonTheme: elevatedButtonTheme,
);
