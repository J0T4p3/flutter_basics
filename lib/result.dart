import 'package:flutter/material.dart';

class Result extends StatelessWidget {
  final int _totalScore;
  final VoidCallback _resetQuestions;

  Result(this._totalScore, this._resetQuestions);

  String get finishPhrase {
    var phrase = "Parabéns, você é top!\nResultado: ${_totalScore}";
    if (_totalScore < 10) {
      phrase = "Dá pra melhorar...\nResultado: ${_totalScore}";
    } else if (_totalScore < 20) {
      phrase = "Você é bom nisso!\nResultado: ${_totalScore}";
    }

    return phrase;
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: (Column(
        children: [
          Text(
            finishPhrase,
            style: TextStyle(fontSize: 36, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          FlatButton(
            child: Text('Jogar novamente'),
            onPressed: _resetQuestions,
            textColor: Colors.white,
            color: Colors.blue,
          )
        ],
      )),
    );
  }
}
