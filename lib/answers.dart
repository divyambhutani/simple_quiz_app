import 'package:flutter/material.dart';

class Answer extends StatelessWidget {
  final Function pressHandler;
  final String answer;

  Answer(this.answer, this.pressHandler);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.only(top: 10),
      color: Colors.blue,
      child: ElevatedButton(
        child: Text(answer),
        onPressed: pressHandler,
      ),
    );
  }
}
