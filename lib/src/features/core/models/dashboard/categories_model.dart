import 'package:flutter/material.dart';

class DashboardCategoriesModel {
  final String title;
  final String heading;
  final String subHeading;
  final VoidCallback? onPressed;

  DashboardCategoriesModel(
    this.title,
    this.heading,
    this.subHeading,
    this.onPressed,
  );

  static List<DashboardCategoriesModel> list = [
    DashboardCategoriesModel("1", "This is Heading", "Something", null),
    DashboardCategoriesModel("2", "Heading", "Some Text", null),
    DashboardCategoriesModel("3", "Heading", "Something", null),
    DashboardCategoriesModel("4", "Heading", "This is something", null),
  ];
}
