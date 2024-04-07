import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:solarsense/src/constants/size.dart';
import 'package:solarsense/src/constants/text_strings.dart';

import '../../../../core/models/user_model.dart';
import '../../../controllers/signup_controller.dart';

class SignUpFormWidget extends StatelessWidget {
  const SignUpFormWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final controller = Get.put(SignupController());
    final _formKey = GlobalKey<FormState>();

    return Container(
      padding: const EdgeInsets.symmetric(vertical: solarSenseFormHeight - 10),
      child: Form(
        key: _formKey, // a unique identifier for the Form
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: controller.fullName,
              decoration: const InputDecoration(
                  label: Text(solarSenseFullName),
                  prefixIcon: Icon(Icons.person_outline_rounded)),
            ),
            const SizedBox(height: solarSenseFormHeight - 20),
            TextFormField(
              controller: controller.email,
              decoration: const InputDecoration(
                  label: Text(solarSenseEmail),
                  prefixIcon: Icon(Icons.email_outlined)),
            ),
            const SizedBox(height: solarSenseFormHeight - 20),
            TextFormField(
              controller: controller.phoneNumber,
              decoration: const InputDecoration(
                  label: Text(solarSensePhoneNo),
                  prefixIcon: Icon(Icons.numbers)),
            ),
            const SizedBox(height: solarSenseFormHeight - 20),
            TextFormField(
              controller: controller.password,
              obscureText: controller.hidePassword.value,
              decoration: const InputDecoration(
                  label: Text(solarSensePassword),
                  prefixIcon: Icon(Icons.fingerprint)),
            ),
            const SizedBox(height: solarSenseFormHeight - 10),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {

                  if (_formKey.currentState!.validate()) {
                    
                    // SignupController.instance.registerUser(controller.email.text.trim(), controller.password.text.trim());

                    final user = UserModel(
                        email: controller.email.text.trim(),
                        fullName: controller.fullName.text.trim(),
                        phoneNumber: controller.phoneNumber.text.trim(),
                        monthlyConsumption: controller.monthlyConsumption.text.trim(),
                        password: controller.password.text.trim(),
                        electricalAppliances: controller.electricalAppliances.text.trim(),
                        averageMonthlyBill: controller.averageMonthlyBill.text.trim()
                    );

                    SignupController.instance.createUser(user);

                  }
                },
                child: Text(solarSenseSignup.toUpperCase()),
              ),
            )
          ],
        ),
      ),
    );
  }
}
