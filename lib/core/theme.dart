import 'package:flutter/material.dart';

final ThemeData theme = ThemeData(
  fontFamily: "Poppins",
  appBarTheme: const AppBarTheme(backgroundColor: Colors.white, foregroundColor: Colors.black, elevation: 1),
  primaryColor: const Color(0xFF258C50),
  scaffoldBackgroundColor: const Color.fromARGB(255, 255, 255, 255),
  colorScheme: const ColorScheme(
    primary: Color(0xFF258C50),
    secondary: Color.fromARGB(255, 245, 111, 33),
    surface: Color.fromARGB(255, 255, 255, 255),
    background: Color.fromARGB(255, 255, 255, 255),
    brightness: Brightness.light,
    error: Color.fromARGB(255, 215, 53, 41),
    onBackground: Colors.black,
    onError: Colors.white,
    onPrimary: Colors.white,
    onSecondary: Colors.black,
    onSurface: Colors.black,
  ),
  inputDecorationTheme: const InputDecorationTheme(filled: true, fillColor: Color(0xFFEDEDED), border: OutlineInputBorder(borderSide: BorderSide.none)),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
    foregroundColor: Colors.white,
    backgroundColor: Colors.green,
    textStyle: const TextStyle(color: Colors.white),
    minimumSize: const Size.fromHeight(64),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(31.5)),
    ),
  )),
  outlinedButtonTheme: OutlinedButtonThemeData(
      style: ButtonStyle(
          minimumSize: MaterialStateProperty.all(const Size.fromHeight(64)),
          shape: MaterialStateProperty.all(RoundedRectangleBorder(borderRadius: BorderRadius.circular(31.5))))),
);
