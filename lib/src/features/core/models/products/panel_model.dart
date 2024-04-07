import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:solarsense/src/features/core/models/products/product_model.dart';

import '../../../../constants/image_strings.dart';

class PanelModel extends ProductModel {
  final String productName;
  final String brand;
  final String efficiency;
  final String technology;
  final String imageString;
  final String warranty;
  final String performance;
  final String wattage;
  final String cost;

  PanelModel(
    super.productId,
    this.productName,
    this.brand,
    this.efficiency,
    this.technology,
    this.imageString,
    this.warranty,
    this.performance,
    this.wattage,
    this.cost,
  );

  // convert document snapshot to user model
  factory PanelModel.fromSnapshot(
      DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return PanelModel(
      data["product_id"],
      data["product_type"],
      data["brand"],
      data["efficiency"],
      data["type"],
      ajSolarPanelImage,
      //data["product_id"],
      data["warranty"],
      data["performance"],
      data["wattage"],
      data["cost"],
    );
  }

  @override
  String toString() {
    return 'PanelModel(productId: $productId, brand: $brand, efficiency: $efficiency, technology: $technology, warranty: $warranty, performance: $performance, wattage: $wattage, cost: $cost)';
  }
}
