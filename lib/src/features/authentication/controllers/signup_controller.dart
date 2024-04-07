import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';
import '../../../repository/user_repository/user_repository.dart';
import '../../core/models/user_model.dart';


class SignupController extends GetxController {
  static SignupController get instance => Get
      .find(); // used to get the instance of the controller from anywhere in the app

  // TextField Controllers to get data from TextFiled
  final hidePassword = true.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  final fullName = TextEditingController();
  final phoneNumber = TextEditingController();
  final monthlyConsumption = TextEditingController();
  final  electricalAppliances = TextEditingController(); // TODO: Change to List<String>
  final averageMonthlyBill = TextEditingController();

  final userRepo = Get.put(UserRepository()); // Used to get the instance of the user repository

  // Called from design
  void registerUser(String email, String password) {
    //Authenticate user
    AuthenticationRepository.instance.createUserWithEmailAndPassword(email, password);
  }

  // Get phoneMo from user and pass it to Auth Repository for Firebase Authentication
  void phoneAuthentication(String phoneNo) {
    //AuthenticationRepository.instance.phoneAuthentication(phoneNo);
  }

  //
  Future<void> createUser(UserModel user) async {
    await userRepo.createUser(user);
    registerUser(user.email, user.password);
    // Get.to(() => const Dashboard());
  }
}
