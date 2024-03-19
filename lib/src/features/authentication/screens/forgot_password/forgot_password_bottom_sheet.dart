import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:solarsense/src/constants/text_strings.dart';

import '../../../../constants/size.dart';
import 'bottom_sheet_button_widget.dart';
import 'forgot_password_mail_screen.dart';
import 'otp_screen.dart';

class ForgetPasswordScreen {
  static Future<dynamic> buildShowModalBottomSheet(BuildContext context) {
    return showModalBottomSheet(
      context: context,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.0)),
      builder: (context) => Container(
        padding: const EdgeInsets.all(solarSenseDefaultSize),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(solarSenseForgetPasswordTitle,
                style: Theme.of(context).textTheme.headline2),
            Text(solarSenseForgetPasswordSubTitle,
                style: Theme.of(context).textTheme.bodyText2),
            const SizedBox(height: 30.0),
            ForgetPasswordBtnWidget(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const ForgetPasswordMailScreen());
              },
              title: solarSenseEmail,
              subTitle: solarSenseResetViaEMail,
              btnIcon: Icons.mail_outline_rounded,
            ),
            const SizedBox(height: 20.0),
            ForgetPasswordBtnWidget(
              onTap: () {
                Navigator.pop(context);
                Get.to(() => const OTPScreen());
              },
              title: solarSensePhoneNo,
              subTitle: solarSenseResetViaPhone,
              btnIcon: Icons.mobile_friendly_rounded,
            ),
          ],
        ),
      ),
    );
  }
}