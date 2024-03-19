import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:solarsense/src/common_widgets/fade_in_animation/animation_desing.dart';
import 'package:solarsense/src/constants/colors.dart';
import 'package:solarsense/src/constants/size.dart';

import '../../../../common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import '../../../../common_widgets/fade_in_animation/fade_in_animation_model.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';
import '../login/login_screen.dart';
import '../signup/signup_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    controller.startAnimation();

    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    var isDarkMode = brightness == Brightness.dark;

    return Scaffold(
        backgroundColor: isDarkMode ? SolarSenseColors.secondaryColor : SolarSenseColors.primaryColor,
        body: Stack(
          children: [
            SolarFadeInAnimation(
              durationInMs: 1200,
              animatePosition: SolarAnimatePosition(
                bottomAfter: 0,
                bottomBefore: -100,
                rightBefore: 0,
                rightAfter: 0,
                leftBefore: 0,
                leftAfter: 0,
                topBefore: 0,
                topAfter: 0,
              ),
              child: Container(
                padding: EdgeInsets.all(solarSenseDefaultSize),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Image(
                      image: AssetImage(welcomeScreenImage1),
                      height: height * 0.6,
                    ),
                    Column(
                      children: [
                        Text(
                          welcomeScreenTitle,
                          style: Theme.of(context).textTheme.headline2,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: spaceBtwItems),
                        Text(
                          welcomeScreenSubTitle,
                          style: Theme.of(context).textTheme.bodyText1,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: spaceBtwItems),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: OutlinedButton(
                            onPressed: () => Get.to(() => const LoginScreen()),
                            child: const Text("LOGIN"),
                          ),
                        ),
                        const SizedBox(width: 10.0),
                        Expanded(
                          child: ElevatedButton(
                            onPressed: () => Get.to(() => const SignUpScreen()),
                            child: const Text("SIGNUP"),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
