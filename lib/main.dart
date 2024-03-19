import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:solarsense/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:solarsense/src/features/authentication/screens/welcome/welcome_screen.dart';
import 'package:solarsense/src/navigation_menu.dart';
import 'package:solarsense/src/repository/authentication_repository/authentication_repository.dart';
import 'package:solarsense/src/utils/theme/theme.dart';

import 'firebase_options.dart';

void main() {

  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform)
  .then((value) => Get.put(AuthenticationRepository()));


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      theme: SolarSenseTheme.lightTheme,
      darkTheme: SolarSenseTheme.darkTheme,
      themeMode: ThemeMode.system,
      home: const WelcomeScreen(),
    );
  }
}
