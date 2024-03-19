import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';

class BatterModel {
  final String productName;
  final String efficiency;
  final String technology;
  final String imageString;
  final VoidCallback? onPressed;

  BatterModel(
      this.productName,
      this.efficiency,
      this.technology,
      this.imageString,
      this.onPressed,
      );

  static List<BatterModel> batteriesList = [
    BatterModel("I'm Battery", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
    BatterModel("Lithium Battery", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
    BatterModel("I'm Battery", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
    BatterModel("I'm Battery", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
    BatterModel("I'm Battery", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
  ];
}