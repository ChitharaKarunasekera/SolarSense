import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../features/core/models/user_model.dart';

class UserRepository extends GetxController {
  static UserRepository get instance => Get.find();

  final _db = FirebaseFirestore.instance;

  createUser(UserModel user) async {
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

  // fetch user data
  Future<UserModel> getUserDetails(String email) async {
    final snapshot =
    await _db.collection("users").where("email", isEqualTo: email).get();
    final userData = snapshot.docs.map((e) => UserModel.fromSnapshot(e)).single;

    return userData;
  }

  // TODO: Fix error in updateUser. Fails to pick document id
  Future<void> updateUser(UserModel user) async {
    await _db.collection('users').doc(user.email).update(user.toJson());
  }
}
