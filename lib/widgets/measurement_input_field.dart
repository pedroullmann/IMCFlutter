import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MeasurementInputField extends StatelessWidget {
  final TextEditingController controller;
  final String label;
  final String hint;
  final String? Function(String?)? validator;

  const MeasurementInputField({
    super.key,
    required this.controller,
    required this.label,
    required this.hint,
    this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: Colors.grey[700],
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [
            FilteringTextInputFormatter.allow(RegExp(r'^\d+\.?\d{0,2}')),
          ],
          decoration: InputDecoration(
            hintText: hint,
          ),
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          validator: validator ?? (value) {
            if (value == null || value.isEmpty) {
              return 'Cannot be empty';
            }
            final number = double.tryParse(value);
            if (number == null) {
              return 'Invalid number';
            }
            if (number <= 0) {
              return 'Must be > 0';
            }
            return null;
          },
        ),
      ],
    );
  }
}