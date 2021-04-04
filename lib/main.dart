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
  void _answerQuestion() {
    print('Answer Chosen');
    setState(() {
      _questionIndex += 1;
    });
    print(_questionIndex);
  }

  int _questionIndex = 0;

  @override
  Widget build(BuildContext context) {
    var questionList = ['Question1', 'Question2', 'Question3'];
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("This is my first web app"),
        ),
        body: Column(
          children: [
            Questions(questionList.elementAt(_questionIndex)),
            Answer(),
            Answer(),
            Answer(),
          ],
        ),
      ),
    );
  }
}
