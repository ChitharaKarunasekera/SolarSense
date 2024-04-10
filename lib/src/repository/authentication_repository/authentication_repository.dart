import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:solarsense/src/features/authentication/screens/splash_screen/splash_screen.dart';
import 'package:solarsense/src/navigation_menu.dart';

import '../../features/authentication/screens/welcome/welcome_screen.dart';
import '../../features/core/screens/dashboard/dashboard.dart';
import 'exceptions/login_email_password_failed.dart';
import 'exceptions/signup_email_password_failure.dart';

class AuthenticationRepository extends GetxController {
  static AuthenticationRepository get instance => Get.find();

  /// variables
  final _auth = FirebaseAuth.instance;
  late final Rx<User?> firebaseUser; // contains state of the user

  @override
  void onReady() {
    firebaseUser = Rx<User?>(_auth.currentUser);
    firebaseUser.bindStream(
        _auth.userChanges()); // fetches the user state from firebase
    ever(firebaseUser, (callback) => _setInitialScreen());
  }

  _setInitialScreen() {
    if (firebaseUser.value != null) {
      Get.offAll(() => const NavigationMenu());
    } else {
      Get.offAll(() => SplashScreen());
    }
  }

  void createUserWithEmailAndPassword(String email, String password) async {
    try {
      await _auth.createUserWithEmailAndPassword(
          email: email, password: password);

      firebaseUser.value != null ? Get.offAll(() => const NavigationMenu()) : Get.to(() => SplashScreen());

    } on FirebaseAuthException catch (e) {
      final ex = SignUpWithEmailAndPasswordFailure.code(e.code);
      print("FIREBASE EXCEPTION: ${ex.message}");
      throw ex.message;
    } catch (_) {
      const ex = SignUpWithEmailAndPasswordFailure();
      print("EXCEPTION: ${ex.message}");
      throw ex.message;
    }
  }

  /// [EmailAuthentication] - LOGIN
  Future<String?> loginWithEmailAndPassword(
      String email, String password) async {
    try {
      await _auth.signInWithEmailAndPassword(email: email, password: password);
      firebaseUser.value != null
          ? Get.offAll(() => const NavigationMenu())
          : Get.to(() => const WelcomeScreen());
    } on FirebaseAuthException catch (e) {
      final ex = LogInWithEmailAndPasswordFailure.code(e.code);
      return ex.message;
    } catch (_) {
      const ex = LogInWithEmailAndPasswordFailure();
      return ex.message;
    }
    return null;
  }

  Future<void> logout() async => await _auth.signOut();
}
