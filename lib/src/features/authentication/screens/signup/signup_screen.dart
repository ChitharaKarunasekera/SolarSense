import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solarsense/src/constants/image_strings.dart';
import 'package:solarsense/src/constants/size.dart';
import 'package:solarsense/src/features/authentication/screens/signup/widgets/signup_form_widget.dart';
import 'package:solarsense/src/features/authentication/screens/signup/widgets/signup_futter_widget.dart';

import '../../../../constants/text_strings.dart';
import 'widgets/form_header_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(solarSenseDefaultSize),
            child: const Column(
              children: [
                FormHeaderWidget(
                  image: welcomeScreenImage1,
                  title: solarSenseSignUpTitle,
                  subTitle: solarSenseSignUpSubTitle,
                  imageHeight: 0.15,
                ),
                SignUpFormWidget(),
                SignUpFooterWidget(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}