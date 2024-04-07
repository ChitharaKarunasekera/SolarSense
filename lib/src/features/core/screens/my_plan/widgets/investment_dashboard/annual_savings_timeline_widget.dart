import 'package:flutter/material.dart';
import 'package:fl_chart/fl_chart.dart';

class AnnualSavingsTimelineChart extends StatelessWidget {
  final double initialCost;
  final double annualIncreasePercent;

  AnnualSavingsTimelineChart({
    Key? key,
    required this.initialCost,
    this.annualIncreasePercent = 5, // Default to a 5% increase in savings annually
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final textStyle = TextStyle(
      color: Colors.blueGrey,
      fontWeight: FontWeight.bold,
      fontSize: 10,
    );

    List<FlSpot> spots = List.generate(10, (index) {
      // Simulate annual savings increase
      final year = index + 1;
      final savings = initialCost * (1 + annualIncreasePercent / 100) * year / 10;
      return FlSpot(year.toDouble(), savings);
    });

    return Container(
      height: 300,
      padding: const EdgeInsets.all(20),
      child: LineChart(
        LineChartData(
          gridData: FlGridData(show: true),
          titlesData: FlTitlesData(
            leftTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                interval: initialCost / 5, // Adjust the interval as needed
                reservedSize: 40,
                getTitlesWidget: (value, meta) {
                  return Padding(
                    padding: const EdgeInsets.only(right: 8.0), // Adjust the padding as needed
                    child: Text(
                      '${(value / 1000000).toStringAsFixed(1)}M',
                      style: textStyle,
                      textAlign: TextAlign.right,
                    ),
                  );
                },
              ),
            ),
            bottomTitles: AxisTitles(
              sideTitles: SideTitles(
                showTitles: true,
                reservedSize: 30,
                getTitlesWidget: (value, meta) {
                  return Padding(
                    padding: const EdgeInsets.only(top: 8.0), // Adjust the padding as needed
                    child: Text(
                      '${value.toInt()}Y',
                      style: textStyle,
                      textAlign: TextAlign.center,
                    ),
                  );
                },
              ),
            ),
          ),
          borderData: FlBorderData(show: true),
          lineBarsData: [
            LineChartBarData(
              spots: spots,
              isCurved: true,
              color: Colors.green,
              dotData: FlDotData(show: false),
              belowBarData: BarAreaData(
                show: true,
                color: Colors.green.withOpacity(0.3),
              ),
            ),
          ],
        ),
      ),
    );
  }
}