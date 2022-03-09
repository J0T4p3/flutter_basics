import 'package:flutter/material.dart';

class Answers extends StatelessWidget {
  final Function _selectHandler;
  final String answerText;

  Answers(this._selectHandler, this.answerText);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      child: RaisedButton(
        child: Text(answerText),
        onPressed: _selectHandler,
        textColor: Colors.white,
        color: Colors.blue,
      ),
    );
  }
}
