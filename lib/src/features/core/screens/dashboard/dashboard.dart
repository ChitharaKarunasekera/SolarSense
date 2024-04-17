import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:solarsense/src/constants/size.dart';
import 'package:solarsense/src/constants/text_strings.dart';
import 'package:solarsense/src/features/core/screens/dashboard/widgets/banners.dart';
import 'package:solarsense/src/features/core/screens/dashboard/widgets/categories.dart';
import 'package:solarsense/src/features/core/screens/dashboard/widgets/top_selling.dart';

import '../../controllers/profile_controller.dart';
import '../../models/user_model.dart';
import 'widgets/appbar.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(ProfileController());
    final txtTheme = Theme.of(context).textTheme;

    return Scaffold(
      appBar: const DashboardAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(20),
          child: FutureBuilder<UserModel>(
              future: controller.getUserdata(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done) {
                  if (snapshot.hasData) {
                    UserModel userdata = snapshot.data!;
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("${solarSenseDashboardTitle} ${userdata.fullName.capitalize}!", // Assuming 'name' is a property you want to display
                            style: txtTheme.bodyMedium?.apply(fontSizeFactor: 1.2)),
                        Text(solarSenseDashboardHeading,
                            style: txtTheme.headline2),
                        const SizedBox(height: solarSenseDashboardPadding),

                        // Category List
                        DashboardCategories(txtTheme: txtTheme),
                        const SizedBox(height: 40),

                        // Banners
                        DashboardBanners(txtTheme: txtTheme, userConsumption: userdata.monthlyConsumption, expense: userdata.averageMonthlyBill),
                        const SizedBox(height: 40),

                        // Top Selling
                        Text(solarSenseDashboardTopSelling,
                            style:
                            txtTheme.headline4?.apply(fontSizeFactor: 1.2)),
                        DashboardTopSelling(txtTheme: txtTheme),
                      ],
                    );
                  } else if (snapshot.hasError) {
                    return Text("Error: ${snapshot.error}");
                  }
                }
                // Display a loading indicator while waiting for the future to complete
                return const Center(child: CircularProgressIndicator());
              }),
        ),
      ),
    );
  }
}
