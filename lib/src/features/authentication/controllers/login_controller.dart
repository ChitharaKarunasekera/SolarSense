import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../repository/authentication_repository/authentication_repository.dart';

class LoginController extends GetxController {
  static LoginController get instance => Get.find();

  /// TextField Controllers to get data from TextFields
  final showPassword = false.obs;
  final email = TextEditingController();
  final password = TextEditingController();
  GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  ///Loader
  final isLoading = false.obs;
  final isGoogleLoading = false.obs;

  /// [EmailAndPasswordLogin]
  Future<void> login() async {
    try {
      isLoading.value = true;
      if(!loginFormKey.currentState!.validate()) {
        isLoading.value = false;
        return;
      }
      final auth = AuthenticationRepository.instance;
      await auth.loginWithEmailAndPassword(email.text.trim(), password.text.trim());
      //auth._setInitialScreen(auth.firebaseUser);
    } catch (e) {
      isLoading.value = false;
      //Helper.errorSnackBar(title:"Error", message: e.toString());
    }
  }
  //
  // /// [GoogleSignupInAuthentication]
  // Future<void> googleSignIn() async {
  //   try {
  //     isGoogleLoading.value = true;
  //     await AuthenticationRepository.instance.signIWithGoogle();
  //     isGoogleLoading.value = false;
  //   } catch (e){
  //     isGoogleLoading.value = false;
  //     //Helper.errorSnackBar(title:"Error", message: e.toString());
  //   }
  // }
}
