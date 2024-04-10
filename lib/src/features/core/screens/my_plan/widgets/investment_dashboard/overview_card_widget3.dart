import 'package:flutter/material.dart';
import 'package:solarsense/src/constants/colors.dart';

class OverviewCard3 extends StatelessWidget {
  final String value;
  final IconData icon;
  final Color iconColor;

  const OverviewCard3({
    Key? key,
    required this.value,
    required this.icon,
    this.iconColor = SolarSenseColors.onBoardingPage1Color, // Default icon color; can be customized
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return Container(
      height: 100.0,
      width: 125.0,
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(8.0),
        color: SolarSenseColors.primaryColor,//.withOpacity(0.6),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Column(
            children: [
              Icon(icon, size: 30, color: iconColor),
              const SizedBox(height: 8.0),
              Text(
                value,
                style: txtTheme.headline6?.copyWith(
                  color: SolarSenseColors.onBoardingPage1Color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}