import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:solarsense/src/features/authentication/screens/forgot_password/forgot_password_bottom_sheet.dart';

import '../../../../constants/size.dart';
import '../../../../constants/text_strings.dart';
import '../../controllers/login_controller.dart';

class LoginForm extends StatelessWidget {
  const LoginForm({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());

    return Container(
      padding: const EdgeInsets.symmetric(vertical: solarSenseFormHeight),
      child: Form(
        key: controller.loginFormKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.person_outline_outlined),
                labelText: solarSenseEmail,
                hintText: solarSenseEmail,
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(height: solarSenseFormHeight - 20),
            TextFormField(
              controller: controller.password,
              obscureText: controller.showPassword.value,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.fingerprint),
                  labelText: solarSensePassword,
                  hintText: solarSensePassword,
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                      onPressed: null, icon: Icon(Icons.remove_red_eye_sharp))),
            ),
            const SizedBox(height: solarSenseFormHeight - 20),
            Align(
                alignment: Alignment.centerRight,
                child: TextButton(
                    onPressed: () {
                      ForgetPasswordScreen.buildShowModalBottomSheet(context);
                    },
                    child: const Text(solarSenseForgetPassword))),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    controller.login();
                  }, child: Text(solarSenseLogin.toUpperCase())),
            ),
          ],
        ),
      ),
    );
  }
}
