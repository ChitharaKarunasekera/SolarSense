import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solarsense/src/features/core/models/myplan_model.dart';

import '../../features/core/models/user_model.dart';

class MyPlanRepository extends GetxController {
  static MyPlanRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  Future<void> generatePlan(MyPlanModel myPlanModel) async {
    await _db
        .collection('myplan')
        .add(myPlanModel.toJson())
        .whenComplete(
          () => Get.snackbar(
        "Success",
        "My Plan has been generated successfully!",
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

  // fetch user data
  Future<MyPlanModel> getMyPlan(String userId) async {
    final snapshot =
    await _db.collection("myplan").where("userId", isEqualTo: userId).get();
    final myPlan = snapshot.docs.map((e) => MyPlanModel.fromSnapshot(e)).single;

    return myPlan;
  }


  // TODO: Modify this method to update the MyPlanModel
  Future<void> updateUser(UserModel user) async {
    await _db.collection('users').doc(user.id).update(user.toJson());
  }
}
