import 'package:flutter/material.dart';
import 'package:imcflutter/models/gender_model.dart';

class GenderSelector extends StatelessWidget {
  final Gender? selectedGender;
  final ValueChanged<Gender> onGenderSelected;

  const GenderSelector({
    super.key,
    required this.selectedGender,
    required this.onGenderSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: <Widget>[
        _genderOption(context, Gender.male, Icons.male, 'Male'),
        _genderOption(context, Gender.female, Icons.female, 'Female'),
      ],
    );
  }

  Widget _genderOption(BuildContext context, Gender gender, IconData icon, String label) {
    final bool isSelected = selectedGender == gender;
    return GestureDetector(
      onTap: () => onGenderSelected(gender),
      child: Container(
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: isSelected ? Colors.blue.withOpacity(0.1) : Colors.grey[100],
          borderRadius: BorderRadius.circular(10.0),
          border: Border.all(
            color: isSelected ? Colors.blueAccent : Colors.grey[300]!,
            width: isSelected ? 2.0 : 1.0,
          ),
        ),
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              size: 50,
              color: isSelected ? Colors.blueAccent : Colors.grey[600],
            ),
            const SizedBox(height: 8),
            Text(
              label,
              style: TextStyle(
                color: isSelected ? Colors.blueAccent : Colors.grey[700],
                fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
              ),
            ),
          ],
        ),
      ),
    );
  }
}