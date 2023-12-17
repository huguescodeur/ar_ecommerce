import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final themeProvider = StateProvider<ThemeMode>((ref) {
  return ThemeMode.light;
});

final ThemeData lightTheme = ThemeData(
  brightness: Brightness.light,
  primaryColor: Colors.yellow, // Couleur principale du thème clair
  // : Colors.orange, // Couleur d'accentuation du thème clair
  // Autres propriétés de ThemeData...
);

final ThemeData darkTheme = ThemeData(
  brightness: Brightness.dark,
  primaryColor: Colors.indigo, // Couleur principale du thème sombre
  // accentColor: Colors.deepOrange, // Couleur d'accentuation du thème sombre
  // Autres propriétés de ThemeData...
);
