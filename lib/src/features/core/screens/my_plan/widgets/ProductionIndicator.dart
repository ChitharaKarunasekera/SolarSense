import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:solarsense/src/constants/colors.dart';

class ROICircularIndicator extends StatelessWidget {
  final double roi; // e.g., 0.68 for 68%
  final String investmentPeriod; // e.g., "1 year"

  const ROICircularIndicator({
    Key? key,
    required this.roi,
    required this.investmentPeriod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Assuming ROI is a value between 0 and 1 for percentage representation
    double roiPercent = roi.clamp(0, 1);
    return CircularPercentIndicator(
      radius: 120.0,
      lineWidth: 13.0,
      animation: true,
      percent: roiPercent,
      center: Text(
        '${(roiPercent * 100).round()}% ROI',
        style: TextStyle(
            fontWeight: FontWeight.bold, fontSize: 20.0),
      ),
      footer: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: Text(
          investmentPeriod,
          textAlign: TextAlign.center,
          style: TextStyle(
              fontWeight: FontWeight.bold, fontSize: 17.0),
        ),
      ),
      circularStrokeCap: CircularStrokeCap.round,
      progressColor: roi >= 0 ? Colors.green : Colors.red, // Assuming positive ROI is green, negative is red
    );
  }
}