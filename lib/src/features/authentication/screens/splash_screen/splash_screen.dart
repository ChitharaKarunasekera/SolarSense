import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../common_widgets/fade_in_animation/animation_desing.dart';
import '../../../../common_widgets/fade_in_animation/fade_in_animation_controller.dart';
import '../../../../common_widgets/fade_in_animation/fade_in_animation_model.dart';
import '../../../../constants/colors.dart';
import '../../../../constants/image_strings.dart';
import '../../../../constants/size.dart';
import '../../../../constants/text_strings.dart';

class SplashScreen extends StatelessWidget {
  SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(FadeInAnimationController());
    FadeInAnimationController.find.startSplashAnimation();


    return Scaffold(
      body: Stack(
        children: [
          SolarFadeInAnimation(
            durationInMs: 1600,
            animatePosition: SolarAnimatePosition(
              topAfter: 10, topBefore: -30, leftBefore: -30, leftAfter: 10,
            ),
            child: const Image(image: AssetImage(solarSenseSplashIcon1)),
          ),
          SolarFadeInAnimation(
            durationInMs: 2000,
            animatePosition: SolarAnimatePosition(topBefore: 80, topAfter: 80, leftAfter: solarSenseDefaultSize, leftBefore: -80),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(solarSenseAppName,
                    style: Theme.of(context).textTheme.headline3),
                Text(solarSenseTagline,
                    style: Theme.of(context).textTheme.headline2)
              ],
            ),
          ),
          SolarFadeInAnimation(
            durationInMs: 2400,
            animatePosition: SolarAnimatePosition(bottomBefore: 0, bottomAfter: 150, leftBefore: 10, leftAfter: 20),
            child: const Image(image: AssetImage(solarSenseSplashImage1)),
          ),
          SolarFadeInAnimation(
            durationInMs: 2400,
            animatePosition: SolarAnimatePosition(bottomBefore: 0, bottomAfter: 60, rightBefore: solarSenseDefaultSize, rightAfter: solarSenseDefaultSize),
            child: Container(
              width: solarSenseSplashContainerSize,
              height: solarSenseSplashContainerSize,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: SolarSenseColors.primaryColor
              ),
            ),
          ),
        ],
      ),
    );
  }
}