import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solarsense/src/features/core/models/products/battery_model.dart';
import 'package:solarsense/src/features/core/models/products/inverter_model.dart';
import 'package:solarsense/src/features/core/models/products/panel_model.dart';

import '../../../../../../constants/colors.dart';
import '../../../../../../constants/colors.dart';
import '../../../../../../constants/image_strings.dart';
import '../../../../../../constants/size.dart';
import '../../../../../../constants/text_strings.dart';
import '../../../../models/products/product_model.dart';

class ContentCard extends StatelessWidget {
  const ContentCard({
    super.key,
    required this.txtTheme,
  });

  final TextTheme txtTheme;



  @override
  Widget build(BuildContext context) {
    return //Card
        Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        //For Dark Color
        //color: Colors.white.withOpacity(0.1)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 10),
                child: Text("Your Statistics", style: txtTheme.headline4),
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 115,
                    width: 215,
                    decoration: BoxDecoration(
                      color: SolarSenseColors.whiteColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Text("Total Investment", style: txtTheme.titleSmall),
                        const SizedBox(height: solarSenseDashboardPadding),
                        Text("Rs. 1,200,000", style: txtTheme.headlineMedium),
                      ],
                    ),
                  ),
                  const SizedBox(width: 5), // Optional: Adds space between the containers
                  Container(
                    height: 115,
                    width: 140,
                    decoration: BoxDecoration(
                      color: SolarSenseColors.whiteColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Column(
                      children: [
                        Text("System Size", style: txtTheme.titleSmall),
                        const SizedBox(height: solarSenseDashboardPadding),
                        Text("8 kW", style: txtTheme.headlineMedium),
                      ],
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 15),
              Row(
                // crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    height: 115,
                    width: 140,
                    decoration: BoxDecoration(
                      color: SolarSenseColors.whiteColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Text("Payback", style: txtTheme.titleSmall),
                  ),
                  const SizedBox(width: 5), // Optional: Adds space between the containers
                  Container(
                    height: 115,
                    width: 215,
                    decoration: BoxDecoration(
                      color: SolarSenseColors.whiteColor.withOpacity(0.3),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    padding: const EdgeInsets.all(8),
                    child: Text("Annual Savings", style: txtTheme.titleSmall),
                  ),
                ],
              ),
            ],
          ),
          // Text(solarSenseDashboardBannerTitle2,
          //     style: txtTheme.headline4, overflow: TextOverflow.ellipsis),
          // Text(solarSenseDashboardBannerSubTitle,
          //     style: txtTheme.bodyText2, overflow: TextOverflow.ellipsis),
          // Text(solarSenseDashboardBannerSubTitle,
          //     style: txtTheme.bodyText2, overflow: TextOverflow.ellipsis),
          // Text(solarSenseDashboardBannerSubTitle,
          //     style: txtTheme.bodyText2, overflow: TextOverflow.ellipsis),
        ],
      ),
    );
  }
}
