import 'package:blog_teste_tecnico/presentation/components/theme/colors_components.dart';
import 'package:flutter/material.dart';

final blogAppTheme = theme;

final theme = ThemeData(
  scaffoldBackgroundColor: const Color(0xffeaeaea),
  primaryColor: const Color(0xFF3a304f),
  primarySwatch: Colors.teal,
  buttonTheme: const ButtonThemeData(
    buttonColor: floatActionButtonColor,
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(onPrimary: Colors.white, primary: floatActionButtonColor)),
  colorScheme:
  ColorScheme.fromSwatch().copyWith(secondary: floatActionButtonColor),
);
