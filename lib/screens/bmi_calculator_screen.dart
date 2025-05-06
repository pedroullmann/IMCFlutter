import 'package:flutter/material.dart';
import 'package:imcflutter/models/gender_model.dart';
import 'package:imcflutter/utils/bmi_calculator.dart';
import 'package:imcflutter/widgets/gender_selector.dart';
import 'package:imcflutter/widgets/measurement_input_field.dart';
import 'package:imcflutter/widgets/bmi_result_display.dart';
import 'package:imcflutter/widgets/bmi_categories_dialog.dart';


class BMICalculatorScreen extends StatefulWidget {
  const BMICalculatorScreen({super.key});

  @override
  State<BMICalculatorScreen> createState() => _BMICalculatorScreenState();
}

class _BMICalculatorScreenState extends State<BMICalculatorScreen> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _weightController = TextEditingController();
  final TextEditingController _heightController = TextEditingController();

  Gender? _selectedGender;
  double? _bmiResultValue;
  String? _bmiCategoryResult;
  String? _errorMessage;

  void _processBMI() {
    setState(() {
      _bmiResultValue = null;
      _bmiCategoryResult = null;
      _errorMessage = null;
    });

    if (_selectedGender == null) {
      setState(() {
        _errorMessage = 'Please select your gender.';
      });
      return;
    }

    if (_formKey.currentState!.validate()) {
      final double? weight = double.tryParse(_weightController.text);
      final double? heightCm = double.tryParse(_heightController.text);

      final calculatedBmi = BMICalculator.calculateBMI(weight, heightCm);

      if (calculatedBmi != null) {
        setState(() {
          _bmiResultValue = calculatedBmi;
          _bmiCategoryResult = BMICalculator.getBMICategory(calculatedBmi);
        });
      } else {
        setState(() {
          _errorMessage = 'Please enter valid positive values for weight and height.';
        });
      }
    }
  }

  void _resetForm() {
     setState(() {
      _weightController.clear();
      _heightController.clear();
      _selectedGender = null;
      _bmiResultValue = null;
      _bmiCategoryResult = null;
      _errorMessage = null;
      _formKey.currentState?.reset();
      FocusScope.of(context).unfocus();
    });
  }

  @override
  void dispose() {
    _weightController.dispose();
    _heightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
        title: const Text('BMI Calculator'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.info_outline),
            onPressed: () => BMICategoriesDialog.show(context),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: _formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              const SizedBox(height: 20),
              GenderSelector(
                selectedGender: _selectedGender,
                onGenderSelected: (gender) {
                  setState(() {
                    _selectedGender = gender;
                  });
                },
              ),
              const SizedBox(height: 30),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Expanded(
                    child: MeasurementInputField(
                      controller: _weightController,
                      label: 'Your weight (kg)',
                      hint: 'e.g. 70',
                    ),
                  ),
                  const SizedBox(width: 20),
                  Expanded(
                    child: MeasurementInputField(
                      controller: _heightController,
                      label: 'Your height (cm)',
                      hint: 'e.g. 175',
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              if (_errorMessage != null)
                Padding(
                  padding: const EdgeInsets.only(bottom: 15.0, top: 5.0),
                  child: Text(
                    _errorMessage!,
                    style: const TextStyle(color: Colors.red, fontSize: 14),
                    textAlign: TextAlign.center,
                  ),
                ),
              const SizedBox(height: 10),
              if (_bmiResultValue == null)
                ElevatedButton(
                  onPressed: _processBMI,
                  child: const Text('Calculate Your BMI'),
                ),
              if (_bmiResultValue != null) ...[
                BMIResultDisplay(
                  bmiResult: _bmiResultValue,
                  bmiCategory: _bmiCategoryResult,
                ),
                const SizedBox(height: 30),
                 Center(
                  child: TextButton(
                    onPressed: _resetForm,
                    child: const Text('Calculate BMI again'),
                  ),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}