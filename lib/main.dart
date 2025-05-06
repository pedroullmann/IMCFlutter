import 'package:flutter/material.dart';
import 'package:imcflutter/screens/bmi_calculator_screen.dart';
import 'package:imcflutter/utils/app_theme.dart';

void main() {
  runApp(const BMICalculatorApp());
}

class BMICalculatorApp extends StatelessWidget {
  const BMICalculatorApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator',
      theme: AppTheme.lightTheme,
      home: const BMICalculatorScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}