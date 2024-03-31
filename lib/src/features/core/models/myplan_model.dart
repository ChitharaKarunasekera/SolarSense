import 'package:cloud_firestore/cloud_firestore.dart';

class MyPlanModel {
  final String? id;
  final String? email; // ID of the user this plan belongs to
  final String inverterCapacity;
  final String panelOutputWattage;
  final String noOfPanels;
  final String investment;
  final String annualProduction;
  final String annualSavings;
  final String paybackPeriod;
  final String roi; // Return on Investment

  const MyPlanModel({
    this.id,
    required this.email,
    required this.inverterCapacity,
    required this.panelOutputWattage,
    required this.noOfPanels,
    required this.investment,
    required this.annualProduction,
    required this.annualSavings,
    required this.paybackPeriod,
    required this.roi,
  });

  // Map data to JSON approach for Firebase
  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'inverterCapacity': inverterCapacity,
      'panelOutputWattage': panelOutputWattage,
      'noOfPanels': noOfPanels,
      'investment': investment,
      'annualProduction': annualProduction,
      'annualSavings': annualSavings,
      'paybackPeriod': paybackPeriod,
      'roi': roi,
    };
  }

  // Convert document snapshot to MyPlanModel
  factory MyPlanModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {
    final data = document.data()!;
    return MyPlanModel(
      id: document.id,
      email: data['email'],
      inverterCapacity: data['inverterCapacity'],
      panelOutputWattage: data['panelOutputWattage'],
      noOfPanels: data['noOfPanels'],
      investment: data['investment'],
      annualProduction: data['annualProduction'],
      annualSavings: data['annualSavings'],
      paybackPeriod: data['paybackPeriod'],
      roi: data['roi'],
    );
  }
}
