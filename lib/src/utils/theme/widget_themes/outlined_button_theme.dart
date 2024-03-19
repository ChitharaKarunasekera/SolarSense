import 'package:flutter/material.dart';

import '../../../constants/colors.dart';
import '../../../constants/size.dart';

class SolarOutlinedButtonTheme {
  SolarOutlinedButtonTheme._(); // To avoid instantiating this class.

  // -- Light Theme -- //
  static final lightOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: SolarSenseColors.secondaryColor,
      side: const BorderSide(color: SolarSenseColors.secondaryColor),
      padding: const EdgeInsets.symmetric(vertical: solarSenseButtonHeight),
    ),
  );

  // -- Dark Theme -- //
  static final darkOutlinedButtonTheme = OutlinedButtonThemeData(
    style: OutlinedButton.styleFrom(
      shape: const RoundedRectangleBorder(),
      foregroundColor: SolarSenseColors.whiteColor,
      side: const BorderSide(color: SolarSenseColors.whiteColor),
      padding: const EdgeInsets.symmetric(vertical: solarSenseButtonHeight),
    ),
  );
}