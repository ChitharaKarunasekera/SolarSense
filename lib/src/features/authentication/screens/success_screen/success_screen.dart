import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solarsense/src/constants/spacing_styles/solar_spacing_styles.dart';
import 'package:solarsense/src/features/authentication/screens/login/login_screen.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/size.dart';

class SuccessSecreen extends StatelessWidget {
  const SuccessSecreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: SolarSenseSpacingStyle.paddingWithAppBarHeight*2,
          child: Column(
            children: [
              /// Image
              const Image(image: AssetImage(emailVerificationImage)),
              const SizedBox(height: spaceBtwItems),

              /// Title & SubTitle
              Text("Account Created Successfully!",
                  style: Theme.of(context).textTheme.headline3,
                  textAlign: TextAlign.center),
              const SizedBox(height: spaceBtwItems),

              Text("sampleemail@gmail.com",
                  style: Theme.of(context).textTheme.labelLarge,
                  textAlign: TextAlign.center),
              const SizedBox(height: spaceBtwItems),

              /// Button
              SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                      onPressed: () => Get.to(() => const LoginScreen()),
                      child: const Text("Continue"))),
              const SizedBox(height: spaceBtwItems),
            ],
          ),
        ),
      ),
    );
  }
}
