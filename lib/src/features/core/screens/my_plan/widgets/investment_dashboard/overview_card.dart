import 'package:flutter/material.dart';
import 'package:solarsense/src/constants/colors.dart';

class OverviewCard extends StatelessWidget {
  final String title;
  final String value;// e.g., "Rs. 1,200,000"
  final IconData icon;
  final Color iconColor;
  final Color textColor;

  const OverviewCard({
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
    return Card(
      elevation: 4.0,
      margin: const EdgeInsets.all(8.0),
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),

        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                backgroundColor: iconColor.withOpacity(0.1),
                radius: 30.0,
                child: Icon(Icons.attach_money, size: 30, color: iconColor), // Money-related icon
              ),
              const SizedBox(width: 20.0),
              Column(
                mainAxisSize: MainAxisSize.min, // Ensures the card size fits the content
                children: [
                  Text(
                    value,
                    style: txtTheme.headlineLarge?.copyWith(
                      color: textColor,
                      fontWeight: FontWeight.bold,
                    ),
                    // style: const TextStyle(
                    //   fontSize: 20.0,
                    //   fontWeight: FontWeight.bold,
                    //   color: Colors.deepOrange, // Text color that stands out for the investment amount
                    // ),
                    textAlign: TextAlign.center,
                  ),

                  Text(
                    title,
                    style: txtTheme.bodyMedium?.copyWith(color: textColor),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}