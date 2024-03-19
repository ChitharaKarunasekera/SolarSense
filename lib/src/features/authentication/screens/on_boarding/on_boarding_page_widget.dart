import 'package:flutter/material.dart';

import '../../../../constants/size.dart';
import '../../models/on_boarding_model.dart';

class OnBoardingPageWidget extends StatelessWidget {
  const OnBoardingPageWidget({
    Key? key,
    required this.model,
  }) : super(key: key);

  final OnBoardingModel model;

  @override
  Widget build(BuildContext context) {

    final size = MediaQuery.of(context).size;

    return Container(
      padding: const EdgeInsets.all(solarSenseDefaultSize),
      color: model.bgColor,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Image(image: AssetImage(model.image), height: size.height * 0.45,),
          Column(
              children: [
                Text(model.title, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
                Text(model.subTitle, style: const TextStyle(fontSize: 16), textAlign: TextAlign.center),
              ]),
          Text(model.counterText, style: const TextStyle(fontSize: 12, fontWeight: FontWeight.bold), textAlign: TextAlign.center),
          const SizedBox(height: 50.0,)
        ],
      ),
    );
  }
}