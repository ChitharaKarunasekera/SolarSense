import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';

class PanelModel {
  final String productName;
  final String efficiency;
  final String technology;
  final String imageString;
  final VoidCallback? onPressed;

  PanelModel(
      this.productName,
      this.efficiency,
      this.technology,
      this.imageString,
      this.onPressed,
      );

  static List<PanelModel> panelsList = [
    PanelModel("I'm a Panel", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
    PanelModel("I'm a Panel", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
    PanelModel("I'm a Panel", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
    PanelModel("I'm a Panel", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
    PanelModel("I'm a Panel", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
  ];
}