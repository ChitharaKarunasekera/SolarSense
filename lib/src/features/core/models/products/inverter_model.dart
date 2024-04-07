import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:solarsense/src/features/core/models/products/product_model.dart';

import '../../../../constants/image_strings.dart';

class InverterModel extends ProductModel {
  final String productName;
  final String brand;
  final String capacity;
  final String efficiency;
  final String warranty;
  final String imageString;
  final String cost;
  final String hybridCompatibility;

  InverterModel(
    super.productId,
    this.productName,
    this.brand,
    this.capacity,
    this.efficiency,
    this.warranty,
    this.cost,
    this.imageString,
    this.hybridCompatibility,
  );

  // static List<InverterModel> invertersList = [
  //   InverterModel("I'm Inverter", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
  //   InverterModel("I'm Inverter", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
  //   InverterModel("I'm Inverter", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
  //   InverterModel("I'm Inverter", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
  //   InverterModel("I'm Inverter", "21.3% Efficiency", "Monocrystalline Solar Panels", ajSolarPanelImage, null),
  // ];

  // convert document snapshot to user model
  factory InverterModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return InverterModel(
      data["product_id"],
      data["product_type"],
      data["brand"],
      data["capacity"],
      data["efficiency"],
      data["warranty"],
      data["cost"],
      ajSolarPanelImage,
      data["hybrid_compatibility"],
    );
  }

  @override
  String toString() {
    return 'InverterModel(productId: $productId, brand: $brand, capacity: $capacity, efficiency: $efficiency, warranty: $warranty, cost: $cost, hybridCompatibility: $hybridCompatibility)';
  }
}
