import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:solarsense/src/constants/size.dart';
import 'package:solarsense/src/constants/text_strings.dart';
import 'package:solarsense/src/features/authentication/controllers/login_controller.dart';
import 'package:solarsense/src/features/authentication/screens/signup/signup_screen.dart';

import '../../../../constants/image_strings.dart';

class LoginFooterWidget extends StatelessWidget {
  const LoginFooterWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(LoginController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const Text("OR"),
        const SizedBox(height: solarSenseFormHeight - 20),
        SizedBox(
          width: double.infinity,
          child: OutlinedButton.icon(
            icon: const Image(image: AssetImage(solarSenseGoogleLogoImage), width: 25.0),
            onPressed: () => {}, //controller.googleSignIn(),
            label: const Text(solarSenseSignInWithGoogle),
          ),
        ),
        const SizedBox(height: solarSenseFormHeight - 20),
        TextButton(
          onPressed: () => Get.to(() => const SignUpScreen()),
          child: Text.rich(
            TextSpan(
                text: solarSenseDontHaveAnAccount,
                style: Theme.of(context).textTheme.bodyText1,
                children: const [
                  TextSpan(text: solarSenseSignup, style: TextStyle(color: Colors.blue))
                ]),
          ),
        ),
      ],
    );
  }
}