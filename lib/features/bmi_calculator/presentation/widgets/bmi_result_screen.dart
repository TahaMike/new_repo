import 'dart:math';
import 'package:flutter/material.dart';

class BmiResultScreen extends StatelessWidget {
  final double bmiValue;

  const BmiResultScreen({super.key, required this.bmiValue});

  String _getBmiCategory(double bmi) {
    if (bmi < 18.5) return 'Underweight';
    if (bmi < 25) return 'Normal weight';
    if (bmi < 30) return 'Overweight';
    if (bmi < 35) return 'Obese Class I';
    if (bmi < 40) return 'Obese Class II';
    return 'Obese Class III';
  }

  Color _getBmiColor(double bmi) {
    if (bmi < 18.5) return Colors.blue;
    if (bmi < 25) return Colors.green;
    if (bmi < 30) return Colors.orange;
    return Colors.red;
  }

  @override
  Widget build(BuildContext context) {
    final category = _getBmiCategory(bmiValue);
    final color = _getBmiColor(bmiValue);
    
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Your BMI Result',
              style: Theme.of(context).textTheme.titleMedium,
            ),
            const SizedBox(height: 16),
            Center(
              child: SizedBox(
                height: 200,
                child: _BmiMeter(
                  bmiValue: bmiValue,
                  color: color,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Center(
              child: Column(
                children: [
                  Text(
                    bmiValue.toStringAsFixed(1),
                    style: Theme.of(context).textTheme.headlineLarge?.copyWith(
                      color: color,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    category,
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: color,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            _BmiRangeLegend(),
          ],
        ),
      ),
    );
  }
}

class _BmiMeter extends StatelessWidget {
  final double bmiValue;
  final Color color;

  const _BmiMeter({
    required this.bmiValue,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return CustomPaint(
      size: const Size(200, 200),
      painter: _BmiMeterPainter(bmiValue: bmiValue, color: color),
    );
  }
}

class _BmiMeterPainter extends CustomPainter {
  final double bmiValue;
  final Color color;

  _BmiMeterPainter({
    required this.bmiValue,
    required this.color,
  });

  @override
  void paint(Canvas canvas, Size size) {
    final center = Offset(size.width / 2, size.height / 2);
    final radius = size.width * 0.35;

    // Draw meter background
    final backgroundPaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..color = Colors.grey.shade300;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      -2.356, // -135 degrees
      3.141, // 180 degrees
      false,
      backgroundPaint,
    );

    // Draw BMI ranges
    _drawBmiRange(canvas, center, radius, 0, 18.5, Colors.blue);
    _drawBmiRange(canvas, center, radius, 18.5, 25, Colors.green);
    _drawBmiRange(canvas, center, radius, 25, 30, Colors.orange);
    _drawBmiRange(canvas, center, radius, 30, 40, Colors.red);

    // Draw needle
    final needleAngle = _getBmiAngle(bmiValue);
    final needlePaint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 3
      ..color = color;

    final needleEnd = Offset(
      center.dx + (radius - 10) * cos(needleAngle),
      center.dy + (radius - 10) * sin(needleAngle),
    );

    canvas.drawLine(center, needleEnd, needlePaint);

    // Draw center circle
    final centerPaint = Paint()
      ..style = PaintingStyle.fill
      ..color = color;
    canvas.drawCircle(center, 8, centerPaint);
  }

  void _drawBmiRange(Canvas canvas, Offset center, double radius, double startBmi, double endBmi, Color color) {
    final startAngle = _getBmiAngle(startBmi);
    final endAngle = _getBmiAngle(endBmi);
    
    final paint = Paint()
      ..style = PaintingStyle.stroke
      ..strokeWidth = 20
      ..color = color;

    canvas.drawArc(
      Rect.fromCircle(center: center, radius: radius),
      startAngle,
      endAngle - startAngle,
      false,
      paint,
    );
  }

  double _getBmiAngle(double bmi) {
    // Map BMI range (0-40) to angle range (-135 to 45 degrees)
    const startAngle = -2.356; // -135 degrees
    const endAngle = 0.785; // 45 degrees
    const bmiRange = 40.0;
    
    final normalizedBmi = (bmi / bmiRange).clamp(0.0, 1.0);
    return startAngle + normalizedBmi * (endAngle - startAngle);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => true;
}

class _BmiRangeLegend extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'BMI Categories:',
          style: Theme.of(context).textTheme.titleSmall,
        ),
        const SizedBox(height: 8),
        _LegendItem(color: Colors.blue, range: '< 18.5', category: 'Underweight'),
        _LegendItem(color: Colors.green, range: '18.5 - 24.9', category: 'Normal weight'),
        _LegendItem(color: Colors.orange, range: '25.0 - 29.9', category: 'Overweight'),
        _LegendItem(color: Colors.red, range: '≥ 30.0', category: 'Obese'),
      ],
    );
  }
}

class _LegendItem extends StatelessWidget {
  final Color color;
  final String range;
  final String category;

  const _LegendItem({
    required this.color,
    required this.range,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 2),
      child: Row(
        children: [
          Container(
            width: 16,
            height: 16,
            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(2),
            ),
          ),
          const SizedBox(width: 8),
          Text(
            '$range: $category',
            style: Theme.of(context).textTheme.bodySmall,
          ),
        ],
      ),
    );
  }
}
