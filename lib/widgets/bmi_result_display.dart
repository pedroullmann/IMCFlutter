import 'package:flutter/material.dart';
import 'package:imcflutter/utils/bmi_calculator.dart';

class BMIResultDisplay extends StatelessWidget {
  final double? bmiResult;
  final String? bmiCategory;

  const BMIResultDisplay({
    super.key,
    required this.bmiResult,
    required this.bmiCategory,
  });

  @override
  Widget build(BuildContext context) {
    if (bmiResult == null || bmiCategory == null) {
      return const SizedBox.shrink();
    }

    return Column(
      children: [
        Text(
          'Your BMI',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: Colors.grey[700],
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          bmiResult!.toStringAsFixed(1),
          textAlign: TextAlign.center,
          style: const TextStyle(
            fontSize: 48,
            fontWeight: FontWeight.bold,
            color: Colors.blueAccent,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          bmiCategory!,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 18,
            color: BMICalculator.getCategoryColor(bmiCategory),
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}