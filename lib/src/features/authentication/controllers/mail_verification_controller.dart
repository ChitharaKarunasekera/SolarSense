import 'package:get/get_state_manager/src/simple/get_controllers.dart';

class MailVerificationController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    print('MailVerificationController');
  }

  /// -- Send OR Resend Email Verification
  Future<void> sendVerificationEmail() async {
    //AuthenticationRepository.instance.sendEmailVerification();
  }

  /// -- Set Timer to check if Verification Completed then Redirect
  void setTimerForAutoRedirect() {

  }

  ///  -- Mannually Check Email Verification completed then Redirect
  void manuallyCheckEmailVerificationStatus() {

  }
}