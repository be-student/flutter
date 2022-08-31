import 'package:flutter/material.dart';

import './question.dart';
import "./answer.dart";

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var questionIndex = 0;
  @override
  Widget build(BuildContext ctx) {
    void _answerQuestion() {
      setState(() {
        questionIndex = questionIndex + 1;
      });
      print(questionIndex);
    }

    const questions = [
      {
        'questionText': 'What\'s your favorite color?',
        'answers': ['Black', 'Red', "Green", "White"]
      },
      {
        'questionText': 'What\'s your favorite animal?',
        'answers': ['Cat', 'Dog', "Rabbit", "Snake"]
      },
      {
        'questionText': 'Who is your favorite instructor',
        'answers': ['Max', 'Max', "Max", "Max"]
      },
    ];

    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(title: Text('My First App')),
      body: Column(children: <Widget>[
        Question(questions[questionIndex]['questionText']),
        ...(questions[questionIndex]['answers'] as List<String>).map((answer) {
          return Answer(_answerQuestion, answer);
        }).toList()
      ]),
    ));
  }
}
