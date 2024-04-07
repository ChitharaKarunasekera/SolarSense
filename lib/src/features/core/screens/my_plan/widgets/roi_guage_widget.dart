import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solarsense/src/constants/colors.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';

class RIOGuage extends StatelessWidget {
  final double roi; // e.g., 131.25 for 131.25%

  const RIOGuage({
    super.key,
    required this.roi,
  });

  @override
  Widget build(BuildContext context) {
    // Adjust the maximum value for the gauge based on your needs
    final double maxValue = roi >= 100 ? (roi * 1.1).roundToDouble() : 100;
    final txtTheme = Theme.of(context).textTheme;

    return Column(
      children: [
        SfRadialGauge(
          axes: <RadialAxis>[
            RadialAxis(
              radiusFactor: 0.8,
              minimum: 0,
              maximum: maxValue,
              showLabels: true,
              showTicks: false,
              axisLineStyle: AxisLineStyle(
                thickness: 0.2,
                cornerStyle: CornerStyle.bothCurve,
                color: Colors.grey.withOpacity(0.3),
                thicknessUnit: GaugeSizeUnit.factor,
              ),
              pointers: <GaugePointer>[
                RangePointer(
                    value: roi,
                    cornerStyle: CornerStyle.bothCurve,
                    width: 0.2,
                    sizeUnit: GaugeSizeUnit.factor,
                    gradient: const SweepGradient(
                        colors: <Color>[SolarSenseColors.primaryColor, SolarSenseColors.whiteColor],
                        stops: <double>[1.5, 0.25])
                ),
              ],
              annotations: <GaugeAnnotation>[
                GaugeAnnotation(
                  widget: Text(
                    '${roi.toStringAsFixed(2)} %\nReturn on Investment',
                    textAlign: TextAlign.center,
                    style: txtTheme.bodyText1?.copyWith(fontSize: 18, fontWeight: FontWeight.bold), // Smaller font size
                  ),
                  angle: 90,
                  positionFactor: 0.99,
                )
              ],
            )
          ],
        ),
      ],
    );
  }
}