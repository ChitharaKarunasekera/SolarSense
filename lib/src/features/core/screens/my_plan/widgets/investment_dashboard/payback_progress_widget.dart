import 'package:flutter/material.dart';

class PaybackPeriodProgress extends StatelessWidget {
  final double currentYear; // Current year into the payback period
  final double totalPaybackPeriod; // Total payback period in years

  const PaybackPeriodProgress({
    Key? key,
    required this.currentYear,
    required this.totalPaybackPeriod,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate the percentage of the payback period completed
    final double progress = (currentYear / totalPaybackPeriod).clamp(0.0, 1.0);
    return Container(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Payback Period Progress',
            style: Theme.of(context).textTheme.subtitle1?.copyWith(color: Colors.blueGrey),
          ),
          SizedBox(height: 8.0),
          Stack(
            children: [
              Container(
                height: 20.0,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              LayoutBuilder(
                builder: (context, constraints) {
                  return Container(
                    width: constraints.maxWidth * progress,
                    height: 20.0,
                    decoration: BoxDecoration(
                      color: Colors.green,
                      borderRadius: BorderRadius.circular(10),
                    ),
                  );
                },
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  '${currentYear.toStringAsFixed(1)} Years',
                  style: Theme.of(context).textTheme.caption?.copyWith(color: Colors.black54),
                ),
                Text(
                  'Goal: ${totalPaybackPeriod.toStringAsFixed(1)} Years',
                  style: Theme.of(context).textTheme.caption?.copyWith(color: Colors.black54),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}