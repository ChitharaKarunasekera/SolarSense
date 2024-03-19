import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:solarsense/src/constants/size.dart';

import '../../../../constants/image_strings.dart';
import '../../../../constants/text_strings.dart';
import '../signup/widgets/form_header_widget.dart';

class ForgetPasswordMailScreen extends StatelessWidget {
  const ForgetPasswordMailScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(solarSenseDefaultSize),
            child: Column(
              children: [
                const SizedBox(height: solarSenseDefaultSize * 4),
                FormHeaderWidget(
                  image: solarSenseForgetPasswordImage,
                  title: solarSenseForgetPassword.toUpperCase(),
                  subTitle: solarSenseForgetPasswordSubTitle,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  heightBetween: 30.0,
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: solarSenseFormHeight),
                Form(
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: const InputDecoration(
                            label: Text(solarSenseEmail),
                            hintText: solarSenseEmail,
                            prefixIcon: Icon(Icons.mail_outline_rounded)),
                      ),
                      const SizedBox(height: 20.0),
                      SizedBox(
                          width: double.infinity,
                          child: ElevatedButton(
                              onPressed: () {
                                //Get.to(() => const OTPScreen());
                                (){};
                              },
                              child: const Text(solarSenseNext))),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}