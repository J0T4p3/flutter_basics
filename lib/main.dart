import 'package:flutter/material.dart';

import 'question.dart';
import 'answers.dart';

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

  void _answerQuestion() {
    // The setState is a method who can update all the widgets what are afected
    // by the modifiable variable
    setState(() {
      _qIndex++;
    });
    print('Question ${_qIndex} answered!');
  }

  void resetQuestion() {
    setState(() {
      _qIndex = 0;
    });
    print('Questions reseted!');
  }

  final questions = [
    {
      'questionText': 'Qual a sua cor favorita?',
      'answers': ['Amarelo', 'Azul', 'Verde', 'Preto']
    },
    {
      'questionText': 'Qual o seu animal preferido?',
      'answers': ['Cachorro', 'Gato', 'Papagaio', 'Periquito'],
    },
    {
      'questionText': 'Qual o seu jogo preferido?',
      'answers': ['Fifa', 'Call of Duty', 'Uncharted', 'Minecraft'],
    },
  ];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Perguntas e respostas'),
        ),
        body: Column(
          children: [
            // Texto da questão
            Question(questions[_qIndex]['questionText']),

            // Opções da questão

            // ... transforma uma lista interna em externa
            ...(questions[_qIndex]['answers'] as List<String>).map((answer) {
              return Answers(_answerQuestion, answer);
            }).toList()
          ],
        ),
      ),
    );
  }
}
