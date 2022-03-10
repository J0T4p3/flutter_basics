import 'package:flutter/material.dart';

import 'quiz.dart';
import 'result.dart';

void main() => runApp(MyApp());

// A stateful widget can update widgets on the screen by user interaction
class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // The _ before class or variable turn it in a private, only acessable in
    // the main.dart (in this case)

    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _qIndex = 0;
  var _totalScore = 0;

  void resetQuestions() {
    setState(() {
      _qIndex = 0;
      _totalScore = 0;
    });
  }

  void _answerQuestion(int score) {
    // The setState is a method who can update all the widgets what are afected
    // by the modifiable variable

    _totalScore += score;

    setState(() {
      _qIndex++;
    });
  }

  final _questions = const [
    {
      'questionText': 'Qual a sua cor favorita?',
      'answers': [
        {'text': 'Amarelo', 'score': 2},
        {'text': 'Azul', 'score': 8},
        {'text': 'Verde', 'score': 6},
        {'text': 'Preto', 'score': 10}
      ]
    },
    {
      'questionText': 'Qual o seu animal preferido?',
      'answers': [
        {'text': 'Cachorro', 'score': 10},
        {'text': 'Gato', 'score': 3},
        {'text': 'Papagaio', 'score': 6},
        {'text': 'Periquito', 'score': 7}
      ],
    },
    {
      'questionText': 'Qual o seu jogo preferido?',
      'answers': [
        {'text': 'Fifa', 'score': 1},
        {'text': 'Call of Duty', 'score': 6},
        {'text': 'Uncharted', 'score': 4},
        {'text': 'Minecraft', 'score': 10}
      ],
    },
  ];

  @override
  Widget build(BuildContext context) {
    // const itens can't be changed, final can change in the execution

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas e respostas'),
        ),

        // A ternary to verify's the end of questions
        body: _qIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                qIndex: _qIndex)
            : Result(_totalScore, resetQuestions),
      ),
    );
  }
}
