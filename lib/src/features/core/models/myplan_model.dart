import 'package:cloud_firestore/cloud_firestore.dart';

class MyPlanModel {
  final String? id;
  final String userId; // ID of the user this plan belongs to
  final double inverterCapacity;
  final double panelOutputWattage;
  final int noOfPanels;
  final double investment;
  final double paybackPeriod;
  final double roi; // Return on Investment

  const MyPlanModel({
    this.id,
    required this.userId,
    required this.inverterCapacity,
    required this.panelOutputWattage,
    required this.noOfPanels,
    required this.investment,
    required this.paybackPeriod,
    required this.roi,
  });

  // Map data to JSON approach for Firebase
  Map<String, dynamic> toJson() {
    return {
      'userId': userId,
      'inverterCapacity': inverterCapacity,
      'panelOutputWattage': panelOutputWattage,
      'noOfPanels': noOfPanels,
      'investment': investment,
      'paybackPeriod': paybackPeriod,
      'roi': roi,
    };
  }

  // Convert document snapshot to MyPlanModel
  factory MyPlanModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return MyPlanModel(
      id: document.id,
      userId: data['userId'],
      inverterCapacity: data['inverterCapacity'],
      panelOutputWattage: data['panelOutputWattage'],
      noOfPanels: data['noOfPanels'],
      investment: data['investment'],
      paybackPeriod: data['paybackPeriod'],
      roi: data['roi'],
    );
  }
}
