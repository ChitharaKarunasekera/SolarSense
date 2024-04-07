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
            // TextFormField(
            //   controller: controller.monthlyConsumption,
            //   decoration: const InputDecoration(
            //       label: Text(solarSenseAvgConsumption),
            //       prefixIcon: Icon(Icons.email_outlined)),
            // ),
            Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    solarSenseAvgConsumption,
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  flex: 3, // Adjust the flex as needed to allocate space for the dropdown
                  child:
                  TextFormField(
                    controller: controller.monthlyConsumption,
                    decoration: const InputDecoration(
                        label: Text("450 kWa"),
                        prefixIcon: Icon(Icons.lightbulb_outline)),
                  ),
                ),
              ],
            ),
            const SizedBox(height: solarSenseFormHeight - 20),
            Row(
              children: [
                const Expanded(
                  flex: 2,
                  child: Text(
                    solarSenseAvgBill,
                    style: TextStyle(fontSize: 16.0),
                    textAlign: TextAlign.center,
                  ),
                ),
                SizedBox(width: 5.0), // Add space between the text and the textfield
                Expanded(
                  flex: 3, // Adjust the flex as needed to allocate space for the dropdown
                  child:
                  TextFormField(
                    controller: controller.averageMonthlyBill,
                    decoration: const InputDecoration(
                        label: Text("14,000"),
                        prefixIcon: Icon(Icons.money)),
                  ),
                ),
              ],
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
