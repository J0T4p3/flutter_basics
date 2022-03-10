import 'package:flutter/material.dart';

import 'answers.dart';
import 'question.dart';

class Quiz extends StatelessWidget {
  final Function answerQuestion;
  final List<Map<String, Object>> questions;
  final int qIndex;

  Quiz(
      {@required this.answerQuestion,
      @required this.questions,
      @required this.qIndex});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Texto da questão. 'as String' para null safety
        Question(questions[qIndex]['questionText'] as String),

        // Opções da questão

        // ... transforma uma lista interna em externa, como um unzip
        ...(questions[qIndex]['answers'] as List<Map<String, Object>>)
            .map((answer) {
          return Answers(

              // An anonymous function for pass values without trigger the function
              () => answerQuestion(answer['score']),
              answer['text'] as String);
        }).toList(),
      ],
    );
  }
}
