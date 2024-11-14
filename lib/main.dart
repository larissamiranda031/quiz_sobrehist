import 'package:flutter/material.dart';
import 'quiz_Tela.dart';
void main() => runApp(QuizApp());


class QuizApp extends StatelessWidget {
   const QuizApp({super.key});
    @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Quiz App',
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: HomePage(),
    );
  }
}