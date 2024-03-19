import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solarsense/src/constants/size.dart';
import 'package:solarsense/src/constants/text_strings.dart';
import 'package:solarsense/src/features/core/screens/dashboard/widgets/banners.dart';
import 'package:solarsense/src/features/core/screens/dashboard/widgets/categories.dart';
import 'package:solarsense/src/features/core/screens/dashboard/widgets/top_selling.dart';

import 'widgets/appbar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const DashboardAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(solarSenseDashboardTitle, style: txtTheme.bodyText2),
              Text(solarSenseDashboardHeading, style: txtTheme.headline2),
              const SizedBox(height: solarSenseDashboardPadding),

              // Category List
              DashboardCategories(txtTheme: txtTheme),
              const SizedBox(height: solarSenseDashboardPadding),

              // Banners
              DashboardBanners(txtTheme: txtTheme),
              const SizedBox(height: solarSenseDashboardPadding),

              // Top Selling
              Text(solarSenseDashboardTopSelling,
                  style: txtTheme.headline4?.apply(fontSizeFactor: 1.2)),
              DashboardTopSelling(txtTheme: txtTheme),
            ],
          ),
        ),
      ),
    );
  }
}
