import 'package:flutter/material.dart';
import 'package:solarsense/src/constants/colors.dart';

class OverviewCard1 extends StatelessWidget {
  final String title;
  final String value;
  final IconData icon;
  final Color iconColor;
  final Color textColor;

  const OverviewCard1({
    Key? key,
    required this.title,
    required this.value,
    required this.icon,
    this.iconColor = SolarSenseColors.primaryColor, // Default icon color; can be customized
    this.textColor = SolarSenseColors.secondaryColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final txtTheme = Theme.of(context).textTheme;
    return Container(
      height: 175.0,
      width: 195.0,
      child: Card(
        elevation: 4.0,
        margin: const EdgeInsets.all(6.0),
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
          child: Column(
            children: [
              CircleAvatar(
                backgroundColor: iconColor.withOpacity(0.1),
                radius: 30.0,
                child: Icon(icon, size: 30, color: iconColor),
              ),
              const SizedBox(height: 8.0),
              Text(
                value,
                style: txtTheme.headline5?.copyWith(
                  color: textColor,
                  fontWeight: FontWeight.bold,
                ),
                // style: TextStyle(
                //   fontSize: 20.0,
                //   fontWeight: FontWeight.bold,
                //   color: textColor,
                // ),
              ),
              Text(
                title,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(color: textColor),
              ),
            ],
          ),
        ),
      ),
    );
  }
}