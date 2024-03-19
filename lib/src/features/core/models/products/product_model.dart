import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';

class ProductModel {
  final String productName;
  final String efficiency;
  final String technology;
  final String imageString;
  final VoidCallback? onPressed;

  ProductModel(
      this.productName,
      this.efficiency,
      this.technology,
      this.imageString,
      this.onPressed,
      );

  static List<ProductModel> list = [
    ProductModel("JA Solar Panels", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
    ProductModel("JA Solar Panels", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
    ProductModel("JA Solar Panels", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
    ProductModel("JA Solar Panels", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
    ProductModel("JA Solar Panels", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
  ];
}