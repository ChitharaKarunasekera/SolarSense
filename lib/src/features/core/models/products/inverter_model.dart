import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';

class InverterModel {
  final String productName;
  final String efficiency;
  final String technology;
  final String imageString;
  final VoidCallback? onPressed;

  InverterModel(
      this.productName,
      this.efficiency,
      this.technology,
      this.imageString,
      this.onPressed,
      );

  static List<InverterModel> invertersList = [
    InverterModel("I'm Inverter", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
    InverterModel("I'm Inverter", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
    InverterModel("I'm Inverter", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
    InverterModel("I'm Inverter", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
    InverterModel("I'm Inverter", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
  ];
}