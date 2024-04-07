import 'package:flutter/material.dart';

class InvestmentOverviewChart extends StatelessWidget {
  final double annualSavings = 157500;
  final double totalInvestment = 1200000;
  final double roi = 131.25;

  InvestmentOverviewChart({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Calculate the percentage of the total investment covered by the first year's savings
    final savingsPercentage = annualSavings / totalInvestment;
    return Column(
      children: [
        Text('Investment Overview', style: Theme.of(context).textTheme.headline6),
        SizedBox(height: 20),
        CustomPaint(
          size: Size(200, 200), // Pie Chart Size
          painter: _PieChartPainter(savingsPercentage),
        ),
        SizedBox(height: 20),
        Text('ROI: $roi%', style: Theme.of(context).textTheme.subtitle1),
        SizedBox(height: 10),
        // Assuming CustomProgressRing is a widget you've created to draw a circular progress
        // indicator that visually represents the ROI as a progress ring.
        CircularProgressIndicator(
          value: roi / 200, // Example scaling, adjust based on your visual preference
          backgroundColor: Colors.grey.shade300,
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blue),
        ),
        SizedBox(height: 20),
        Text('Annual Savings: Rs. $annualSavings', style: Theme.of(context).textTheme.subtitle1),
        Text('Total Investment: Rs. $totalInvestment', style: Theme.of(context).textTheme.subtitle1),
      ],
    );
  }
}

class _PieChartPainter extends CustomPainter {
  final double savingsPercentage;

  _PieChartPainter(this.savingsPercentage);

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.blue
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20;

    // Draw savings arc
    canvas.drawArc(
      Rect.fromCenter(center: Offset(size.width / 2, size.height / 2), width: size.width, height: size.height),
      -90 * (3.14 / 180), // Start angle
      360 * savingsPercentage * (3.14 / 180), // Sweep angle
      false,
      paint,
    );

    // Adjust the paint for the remaining investment
    paint.color = Colors.grey;
    canvas.drawArc(
      Rect.fromCenter(center: Offset(size.width / 2, size.height / 2), width: size.width, height: size.height),
      (360 * savingsPercentage - 90) * (3.14 / 180), // Start angle
      360 * (1 - savingsPercentage) * (3.14 / 180), // Sweep angle
      false,
      paint,
    );
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}