import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../repository/user_repository/user_repository.dart';
import '../models/user_model.dart';


class ProfileController extends GetxController {
  static ProfileController get instance => Get.find();

  /// Repositories
  final _authRepo = Get.put(AuthenticationRepository());
  final _userRepo = Get.put(UserRepository());

  /// Get user email and password from the UserRepository to fetch user details
  getUserdata() {
    final email = _authRepo.firebaseUser.value?.email;
    //_firebaseUser?.value.email; // using email for authentication
    if(email != null) {
      return _userRepo.getUserDetails(email);
    } else {
      //Get.snackbar("E  rror", "Login to continue");
      print(email);
      print("I am here :)");
    }
  }

  /// Fetch list of all users
  // Future<List<UserModel>> getAllUsers() async => await _userRepo.allUser();
  //
  updateRecord(UserModel user) async {
    await _userRepo.updateUser(user);
  }
}