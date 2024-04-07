

import 'package:cloud_firestore/cloud_firestore.dart';

class UserModel {

  final String? id;
  final String email;
  final String fullName;
  final String phoneNumber;
  final String monthlyConsumption;
  final String electricalAppliances; //TODO: Change to List<String>
  final String averageMonthlyBill;
  final String password;


  const UserModel({

    this.id,
    required this.email,
    required this.fullName,
    required this.phoneNumber,
    required this.monthlyConsumption,
    required this.password,
    required this.electricalAppliances,
    required this.averageMonthlyBill,
  });

  // Map data to JSON approach for Firebase
  toJson() {

    return {
      'email': email,
      'fullName': fullName,
      'phoneNumber': phoneNumber,
      'monthlyConsumption': monthlyConsumption,
      'electricalAppliances': electricalAppliances,
      'averageMonthlyBill': averageMonthlyBill,
      'password': password,
    };
  }

  // convert document snapshot to user model
  factory UserModel.fromSnapshot(DocumentSnapshot<Map<String, dynamic>> document) {

    final data = document.data()!;
    return UserModel(
      id: document.id,
      email: data["email"],
      fullName: data["fullName"],
      phoneNumber: data["phoneNumber"],
      monthlyConsumption: data["monthlyConsumption"],
      electricalAppliances: data["electricalAppliances"],
      averageMonthlyBill: data["averageMonthlyBill"],
      password: data["password"],
    );
  }
}