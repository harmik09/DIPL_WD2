import 'package:flutter/material.dart';

class QuizPage extends StatelessWidget {
  Map<String, dynamic> questionData = {};

  QuizPage({super.key, required this.questionData});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
              child: Text(
            questionData['Question'],
            style: TextStyle(fontSize: 30, color: Colors.black),
          )),
          Expanded(
            child: Column(
              children: [
                Text(
                  questionData['Ans1'],
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                Text(
                  questionData['Ans2'],
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                Text(
                  questionData['Ans3'],
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
                Text(
                  questionData['Ans4'],
                  style: TextStyle(fontSize: 25, color: Colors.black),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
