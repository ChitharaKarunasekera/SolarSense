import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/size.dart';
import '../../../../../constants/text_strings.dart';
import '../../profile/update_profile_screen.dart';

class DashboardBanners extends StatelessWidget {
  const DashboardBanners({
    super.key,
    required this.userConsumption,
    required this.expense,
    required this.txtTheme,
  });

  final TextTheme txtTheme;
  final String userConsumption;
  final String expense;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: SolarSenseColors.primaryColor.withOpacity(0.1),
            //For Dark Color
            //color: isDark ? tSecondaryColor : tCardBgColor,
          ),
          padding: const EdgeInsets.symmetric(
              horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: SizedBox(
                      width: 24.0,
                      // Specify your desired width
                      height: 24.0,
                      // Specify your desired height
                      child: Image(image: AssetImage(bookmarkIcon)),
                    ),
                  ),
                  Flexible(
                      child: Image(
                          image: AssetImage(
                              solarSenseDashboardAboutMeImg))),
                ],
              ),
              const SizedBox(height: 25),
              Text("$yourMonthlyConsumption is $userConsumption",
                  style: txtTheme.headline4,
                  maxLines: 3,
                  overflow: TextOverflow.ellipsis),
              const SizedBox(height: 10),
              Text(solarSenseDashboardBannerSubTitle,
                  style: txtTheme.bodyText2,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis),
            ],
          ),
        ),
      ),
      const SizedBox(width: solarSenseDashboardPadding),
      Expanded(
        child: Column(
          children: [
            //Card
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                //For Dark Color
                color: SolarSenseColors.primaryColor.withOpacity(0.1),
              ),
              padding: const EdgeInsets.symmetric(
                  horizontal: 10, vertical: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                        child: SizedBox(
                          width: 24.0,
                          // Specify your desired width
                          height: 24.0,
                          // Specify your desired height
                          child: Image(
                              image: AssetImage(bookmarkIcon)),
                        ),
                      ),
                      Flexible(
                          child: Image(
                              image: AssetImage(
                                  solarSenseDashboardPlanningImg))),
                    ],
                  ),
                  Text(solarSenseDashboardBannerTitle2,
                      style: txtTheme.headline4,
                      overflow: TextOverflow.ellipsis),
                  const SizedBox(height: 10),
                  Text(solarSenseDashboardBannerSubTitle,
                      style: txtTheme.bodyText2,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: OutlinedButton(
                    onPressed: () => Get.to(() => const UpdateProfileScreen()),
                    child: const Text(
                        solarSenseDashboardBannerButton)),
              ),
            )
          ],
        ),
      ),
    ]);
  }
}