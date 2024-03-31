import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';

class PanelModel {
  final String productName;
  final String efficiency;
  final String technology;
  final String imageString;
  final String wattage;
  final String cost;
  final VoidCallback? onPressed;

  PanelModel(
      this.productName,
      this.efficiency,
      this.technology,
      this.imageString,
      this.wattage,
      this.cost,
      this.onPressed,
      );


  static List<PanelModel> panelsList = [
    PanelModel("I'm a Panel", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, "500w", "Rs. 400", null),
    PanelModel("I'm a Panel", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, "500w", "Rs. 400", null),
    PanelModel("I'm a Panel", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, "500w", "Rs. 400", null),
    PanelModel("I'm a Panel", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, "500w", "Rs. 400", null),
    PanelModel("I'm a Panel", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, "500w", "Rs. 400", null),
  ];

  // convert document snapshot to user model
  factory PanelModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {

    final data = document.data()!;
    return PanelModel(
      data["product_type"],
      data["efficiency"],
      data["type"],
      ajSolarPanelImage,
      data["wattage"],
      data["cost"],
      null,
    );
  }
}