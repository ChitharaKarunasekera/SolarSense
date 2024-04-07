import 'package:flutter/material.dart';
import 'package:solarsense/src/constants/colors.dart';

class OverviewCard2 extends StatelessWidget {
  final String totalInvestment; // e.g., "Rs. 1,200,000"

  const OverviewCard2({
    Key? key,
    required this.totalInvestment,
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
                backgroundColor: Colors.deepOrange.shade100, // A color that suggests financials/cost
                radius: 30.0,
                child: Icon(Icons.attach_money, size: 30, color: Colors.deepOrange), // Money-related icon
              ),
              const SizedBox(width: 20.0),
              Column(
                mainAxisSize: MainAxisSize.min, // Ensures the card size fits the content
                children: [
                  Text(
                    totalInvestment,
                    style: txtTheme.headlineLarge?.copyWith(
                      color: Colors.deepOrange,
                    ),
                    // style: const TextStyle(
                    //   fontSize: 20.0,
                    //   fontWeight: FontWeight.bold,
                    //   color: Colors.deepOrange, // Text color that stands out for the investment amount
                    // ),
                    textAlign: TextAlign.center,
                  ),

                  Text(
                    "Total Investment",
                    style: txtTheme.bodyMedium?.copyWith(color: Colors.deepOrange),
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