import 'package:flutter/material.dart';
import './questions.dart';
import './answers.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  int _totalScore = 0;

  void _answerQuestion(int score) {
    print('Answer Chosen');
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
    _totalScore += score;
  }

  int _questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    var questionList = [
      {
        'questionText': 'What is your favorite animal?',
        'answer': [
          {'text': 'Lion', 'score': 5},
          {'text': 'Dog', 'score': 7},
          {'text': 'Cow', 'score': 9},
          {'text': 'Wolf', 'score': 2},
        ]
      },
      {
        'questionText': 'What would you like to eat',
        'answer': [
          {'text': 'Pasta', 'score': 7},
          {'text': 'Burger', 'score': 5},
          {'text': 'Noodles', 'score': 8},
          {'text': 'Pizza', 'score': 3},
        ]
      },
    ];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("This is my first web app"),
        ),
        body: _questionIndex < questionList.length
            ? Column(
                children: [
                  Questions(
                      questionList.elementAt(_questionIndex)['questionText']),
                  ...(questionList[_questionIndex]['answer']
                          as List<Map<String, Object>>)
                      .map((answer) {
                    return Answer(
                      answer['text'],
                      () => _answerQuestion(answer['score']),
                    );
                  }).toList(),
                ],
              )
            : Container(
                height: double.infinity,
                width: double.infinity,
                alignment: Alignment.center,
                child: Text(
                  'Your total score is $_totalScore',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
      ),
    );
  }
}
