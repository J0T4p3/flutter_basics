import 'package:flutter/material.dart';

class Question extends StatelessWidget {
  // (final) Grants the immutability off the variable, after it creation
  final String questionText;

  // A class constructor receives one argument to create one Question class
  Question(this.questionText);

  @override
  Widget build(BuildContext context) {
    // A container for positioning the items
    return Container(
      width: double.infinity,
      margin: EdgeInsets.all(10),
      child: Text(
        questionText,
        style: TextStyle(fontSize: 28),
        textAlign: TextAlign.center,
      ),
    );
  }
}
