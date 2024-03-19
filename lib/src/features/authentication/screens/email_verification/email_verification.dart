import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:line_awesome_flutter/line_awesome_flutter.dart';

import '../../controllers/mail_verification_controller.dart';

class MailVerification extends StatelessWidget {
  const MailVerification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(MailVerificationController());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(
            top: 20 * 5,
            left: 20,
            right: 20,
            bottom: 20 * 2,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(LineAwesomeIcons.envelope_open_text, size: 100),
              const SizedBox(height: 20 * 2),
              Text('Email Verification',
                  style: Theme.of(context).textTheme.headlineMedium),
              const SizedBox(height: 20),
              Text(
                'A verification link has been sent to your email. Please verify your email to continue.',
                style: Theme.of(context).textTheme.bodyMedium,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20 * 2),
              SizedBox(
                width: 200,
                child: OutlinedButton(
                  child: Text("Button Text"),
                  onPressed: () =>
                      controller.manuallyCheckEmailVerificationStatus(),
                ),
              ),
              const SizedBox(height: 20 * 2),
              TextButton(
                onPressed: () => controller.sendVerificationEmail(),
                child: const Text("Resend Verification Email"),
              ),
              TextButton(
                onPressed: () => {}, //AuthenticationRepository.instance.logout(),
                child: const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(LineAwesomeIcons.alternate_long_arrow_left),
                    SizedBox(width: 5),
                    Text("Logout"),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
