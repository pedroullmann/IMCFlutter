import 'package:flutter/material.dart';

class BMICalculator {
  static double? calculateBMI(double? weightKg, double? heightCm) {
    if (weightKg == null || heightCm == null || weightKg <= 0 || heightCm <= 0) {
      return null;
    }

    final double heightM = heightCm / 100.0;
    return weightKg / (heightM * heightM);
  }

  static String? getBMICategory(double? bmi) {
    if (bmi == null) return null;

    if (bmi < 18.5) {
      return "You're underweight";
    } else if (bmi < 25) {
      return "You're normal";
    } else if (bmi < 30) {
      return "You're overweight";
    } else {
      return "You have obesity";
    }
  }

  static Color getCategoryColor(String? category) {
    if (category == null) return Colors.black87;
    if (category.contains("underweight")) return Colors.orangeAccent;
    if (category.contains("normal")) return Colors.green;
    if (category.contains("overweight")) return Colors.deepOrangeAccent;
    if (category.contains("obesity")) return Colors.red;

    return Colors.black87;
  }
}