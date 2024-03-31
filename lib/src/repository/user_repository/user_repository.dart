import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solarsense/src/features/core/models/myplan_model.dart';

import '../../features/core/models/products/panel_model.dart';
import '../../features/core/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> createUser(UserModel user) async {
    await _db
        .collection('users')
        .add(user.toJson())
        .whenComplete(
          () => Get.snackbar(
        "Success",
        "Your account has been created successfully!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      ),
    )
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
    });
  }

  Future<void> createGeneratedPlan(MyPlanModel myPlanModel) async {
    await _db
        .collection('myplan')
        .add(myPlanModel.toJson())
        .whenComplete(
          () => Get.snackbar(
        "Success",
        "Your plan generated successfully!",
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.green.withOpacity(0.1),
        colorText: Colors.green,
      ),
    )
        .catchError((error, stackTrace) {
      Get.snackbar("Error", "Something went wrong. Try again",
          snackPosition: SnackPosition.BOTTOM,
          backgroundColor: Colors.redAccent.withOpacity(0.1),
          colorText: Colors.red);
    });
  }

  Future<MyPlanModel> getGeneratedPlan(String email) async {
    final snapshot =
    await _db.collection("myplan").where("email", isEqualTo: email).get();
    final myPlan = snapshot.docs.map((e) => MyPlanModel.fromSnapshot(e)).single;

    return myPlan;
  }

  // fetch user data
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
    await _db.collection("users").where("email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;

    return userData;
  }



  Future<void> updateUser(UserModel user) async {
    await _db.collection('users').doc(user.id).update(user.toJson());
  }
}
