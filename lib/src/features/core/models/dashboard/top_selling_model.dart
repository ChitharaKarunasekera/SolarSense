import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';

class DashboardTopSellingModel {
  final String productName;
  final String efficiency;
  final String technology;
  final String imageString;
  final VoidCallback? onPressed;

  DashboardTopSellingModel(
      this.productName,
      this.efficiency,
      this.technology,
      this.imageString,
      this.onPressed,
      );

  static List<DashboardTopSellingModel> list = [
    DashboardTopSellingModel("JA Solar Panels", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
    DashboardTopSellingModel("JA Solar Panels", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
    DashboardTopSellingModel("JA Solar Panels", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
    DashboardTopSellingModel("JA Solar Panels", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
    DashboardTopSellingModel("JA Solar Panels", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
  ];
}

