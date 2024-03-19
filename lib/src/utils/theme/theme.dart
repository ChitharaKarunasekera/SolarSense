import 'package:flutter/material.dart';
import 'package:solarsense/src/utils/theme/widget_themes/elevated_button_theme.dart';
import 'package:solarsense/src/utils/theme/widget_themes/outlined_button_theme.dart';
import 'package:solarsense/src/utils/theme/widget_themes/text_field_theme.dart';
import 'package:solarsense/src/utils/theme/widget_themes/text_theme.dart';

class SolarSenseTheme {

  SolarSenseTheme._(); // To avoid instantiating this class.

  static ThemeData lightTheme = ThemeData (
    brightness: Brightness.light,
    textTheme: SolarTextTheme.lightTheme,
    //appBarTheme: ,
    outlinedButtonTheme: SolarOutlinedButtonTheme.lightOutlinedButtonTheme,
    elevatedButtonTheme: SolarElevatedButtonTheme.lightElevatedButtonTheme,
    inputDecorationTheme: SolarSenseTextFieldTheme.lightInputDecorationTheme,
  );

  static ThemeData darkTheme = ThemeData (
    brightness: Brightness.dark,
    textTheme: SolarTextTheme.darkTheme,
    outlinedButtonTheme: SolarOutlinedButtonTheme.darkOutlinedButtonTheme,
    elevatedButtonTheme: SolarElevatedButtonTheme.darkElevatedButtonTheme,
    inputDecorationTheme: SolarSenseTextFieldTheme.darkInputDecorationTheme,
  );
}