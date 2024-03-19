import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solarsense/src/constants/image_strings.dart';
import 'package:solarsense/src/constants/size.dart';
import 'package:solarsense/src/constants/text_strings.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Image(
            image: const AssetImage(welcomeScreenImage1),
            height: size.height * 0.2),
        Text(solarSenseLoginTitle, style: Theme.of(context).textTheme.headline3),
        Text(solarSenseLoginSubTitle, style: Theme.of(context).textTheme.bodyText1),
      ],
    );
  }
}