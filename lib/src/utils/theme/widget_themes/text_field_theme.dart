import 'package:flutter/material.dart';
import 'package:solarsense/src/constants/colors.dart';

class SolarSenseTextFieldTheme {
  SolarSenseTextFieldTheme._();

  // Light Theme
  static InputDecorationTheme lightInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
    prefixIconColor: SolarSenseColors.secondaryColor,
    floatingLabelStyle: const TextStyle(color: SolarSenseColors.secondaryColor),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(color: SolarSenseColors.primaryColor),
    ),
  );

  // Dark Theme
  static InputDecorationTheme darkInputDecorationTheme = InputDecorationTheme(
    border: OutlineInputBorder(borderRadius: BorderRadius.circular(100)),
    prefixIconColor: SolarSenseColors.secondaryColor,
    floatingLabelStyle: const TextStyle(color: SolarSenseColors.secondaryColor),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(100),
      borderSide: const BorderSide(color: SolarSenseColors.primaryColor),
    ),
  );
}
