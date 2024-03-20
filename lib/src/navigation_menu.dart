import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:iconsax/iconsax.dart';
import 'package:solarsense/src/features/core/screens/dashboard/dashboard.dart';
import 'package:solarsense/src/features/core/screens/profile/profile_screen.dart';

import 'constants/colors.dart';
import 'features/core/screens/my_plan/my_plan_screen.dart';
import 'features/core/screens/playground/playground_screen.dart';

class NavigationMenu extends StatelessWidget {
  const NavigationMenu({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(NavigationController());
    var mediaQuery = MediaQuery.of(context);
    var height = mediaQuery.size.height;
    var brightness = mediaQuery.platformBrightness;
    var isDarkMode = brightness == Brightness.dark;

    return Scaffold(
      bottomNavigationBar: Obx(
        () => NavigationBar(
          height: 80,
          elevation: 0,
          selectedIndex: controller.selectedIndex.value,
          onDestinationSelected: (index) =>
              controller.selectedIndex.value = index,
          backgroundColor:
              isDarkMode ? SolarSenseColors.darkColor : Colors.white,
          indicatorColor: isDarkMode
              ? SolarSenseColors.accentColor.withOpacity(0.3)
              : SolarSenseColors.primaryColor.withOpacity(0.3),
          destinations: const [
            NavigationDestination(
              icon: Icon(Iconsax.home),
              label: "Home",
            ),
            NavigationDestination(
              icon: Icon(Iconsax.frame_3),
              label: "Your Plan",
            ),
            NavigationDestination(
              icon: Icon(Iconsax.shop),
              label: "Playground",
            ),
            NavigationDestination(
              icon: Icon(Iconsax.user),
              label: "Profile",
            ),
          ],
        ),
      ),
      body: Obx(() => controller.screens[controller.selectedIndex.value]),
    );
  }
}

class NavigationController extends GetxController {
  var selectedIndex = 0.obs;

  final screens = [
    const Dashboard(),
    const MyPlan(),
    const PlaygroundScreen(),
    const ProfileScreen()
  ];
}
