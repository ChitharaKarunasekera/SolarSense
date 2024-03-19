import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:solarsense/src/features/authentication/controllers/otp_controller.dart';

import '../../../../constants/size.dart';
import '../../../../constants/text_strings.dart';

class OTPScreen extends StatelessWidget {
  const OTPScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var otpController = OTPController.instance;
    var otp;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(solarSenseDefaultSize),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              otpTitle,
              style: Theme.of(context).textTheme.headline1,
              //style: GoogleFonts.montserrat(fontWeight: FontWeight.bold, fontSize: 80.0),
            ),
            Text(otpSubTitle.toUpperCase(),
                style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 40.0),
            const Text("$otpMessage support@codingwitht.com",
                textAlign: TextAlign.center),
            const SizedBox(height: 20.0),
            OtpTextField(
                mainAxisAlignment: MainAxisAlignment.center,
                numberOfFields: 6,
                fillColor: Colors.black.withOpacity(0.1),
                filled: true,
                onSubmit: (code) {
                  otp = code;
                  OTPController.instance.verifyOTP(otp);
                }),
            //onSubmit: (code) => print("OTP is => $code")),
            const SizedBox(height: 20.0),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  onPressed: () {
                    OTPController.instance.verifyOTP(otp);
                  },
                  child: const Text(solarSenseNext)),
            ),
          ],
        ),
      ),
    );
  }
}
