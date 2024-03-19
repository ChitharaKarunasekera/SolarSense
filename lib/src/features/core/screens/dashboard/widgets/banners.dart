import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../../../constants/colors.dart';
import '../../../../../constants/image_strings.dart';
import '../../../../../constants/size.dart';
import '../../../../../constants/text_strings.dart';

class DashboardBanners extends StatelessWidget {
  const DashboardBanners({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;

  @override
  Widget build(BuildContext context) {
    return Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Expanded(
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: SolarSenseColors.cardBgColor,
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
              Text(solarSenseDashboardBannerTitle1,
                  style: txtTheme.headline4,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis),
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
                color: SolarSenseColors.cardBgColor,
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
                  Text(solarSenseDashboardBannerSubTitle,
                      style: txtTheme.bodyText2,
                      overflow: TextOverflow.ellipsis),
                ],
              ),
            ),
            const SizedBox(height: 5),
            SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: OutlinedButton(
                    onPressed: () {},
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