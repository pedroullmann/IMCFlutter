import 'package:flutter/material.dart';

class BMICategoriesDialog extends StatelessWidget {
  const BMICategoriesDialog({super.key});

  static void show(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return const BMICategoriesDialog();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text(
        'BMI Categories',
        style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black87),
        textAlign: TextAlign.center,
      ),
      content: const SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text('Less than 18.5: you\'re underweight.', style: TextStyle(fontSize: 15)),
            SizedBox(height: 8),
            Text('18.5 to 24.9: you\'re normal.', style: TextStyle(fontSize: 15)),
            SizedBox(height: 8),
            Text('25 to 29.9: you\'re overweight.', style: TextStyle(fontSize: 15)),
            SizedBox(height: 8),
            Text('30 or more: obesity.', style: TextStyle(fontSize: 15)),
          ],
        ),
      ),
      actions: <Widget>[
        TextButton(
          child: const Text('Close'),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ],
    );
  }
}