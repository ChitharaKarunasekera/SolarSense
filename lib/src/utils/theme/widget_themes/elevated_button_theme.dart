
import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/size.dart';

class SolarElevatedButtonTheme {
  SolarElevatedButtonTheme._(); // To avoid instantiating this class.

  // -- Light Theme -- //
  static final lightElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      foregroundColor: SolarSenseColors.whiteColor,
      backgroundColor: SolarSenseColors.secondaryColor,
      side: const BorderSide(color: SolarSenseColors.secondaryColor),
      padding: const EdgeInsets.symmetric(vertical: solarSenseButtonHeight),
    ),
  );

  // -- Dark Theme -- //
  static final darkElevatedButtonTheme = ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      elevation: 0,
      shape: const RoundedRectangleBorder(),
      foregroundColor: SolarSenseColors.secondaryColor,
      backgroundColor: SolarSenseColors.whiteColor,
      side: const BorderSide(color: SolarSenseColors.secondaryColor),
      padding: const EdgeInsets.symmetric(vertical: solarSenseButtonHeight),
    ),
  );
}