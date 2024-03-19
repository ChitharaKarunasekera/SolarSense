import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solarsense/src/constants/size.dart';
import 'package:solarsense/src/features/authentication/controllers/mail_verification_controller.dart';
import 'package:solarsense/src/features/authentication/screens/login/login_screen.dart';
import 'package:solarsense/src/features/authentication/screens/success_screen/success_screen.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MailVerificationController());
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () => Get.offAll(() => const LoginScreen()),
            icon: const Icon(Icons.close),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(defaultSpace),
          child: Column(
            children: [
              /// Image
              const Image(image: AssetImage(emailVerificationImage)),
              const SizedBox(height: spaceBtwItems),

              /// Title & SubTitle
              Text(emailVerificationTitle,
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center),
              const SizedBox(height: spaceBtwItems),

              Text("sampleemail@gmail.com",
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: spaceBtwItems),

              Text(emailVerificationSubTitle,
                  style: Theme.of(context).textTheme.bodyText1,
                  textAlign: TextAlign.center),
              const SizedBox(height: spaceBtwItems),

              /// Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => const SuccessSecreen()),
                      child: const Text("Continue"))),
              const SizedBox(height: spaceBtwItems),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {}, child: const Text("Resend Email"))),
              const SizedBox(height: spaceBtwItems),
            ],
          ),
        ),
      ),
    );
  }
}
