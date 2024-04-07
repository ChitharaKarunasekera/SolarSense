import 'package:flutter/material.dart';

import '../../../../constants/image_strings.dart';

class ProductModel {
  final String productId;
  //final VoidCallback? onPressed;


  ProductModel(
      this.productId,
      //this.onPressed,
      );


  static List<ProductModel> list = [
    ProductModel("ID01"),
    ProductModel("ID02"),
    ProductModel("ID03"),
    ProductModel("ID04"),
    ProductModel("ID05"),
  ];
}