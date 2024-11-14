import 'package:flutter/material.dart';
import 'quiz_Result.dart';
import 'dart:async';

class QuizApp extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizApp> {
  int _currentQuestionIndex = 0;
  int _score = 0;
  int _timeRemaining = 10;
  Timer? _timer;

  final List<Map<String, dynamic>> _questions = [
        {
      'question': '1-Quando foi assinado o Tratado de Tordesilhas?',
      'answer': [
        {'texto':'1494','score': 1}, 
        {'texto':'1500','score': 0},
        {'texto':'1888','score': 0 },
        {'texto':'1713','score': 0 }
      ],
    'image': 'lib/assets/imag-1.jpg',
    },
    {
      'question': '2-Quem foi Júlio César?',
      'answer': [
        {'texto':'Filósofo','score': 0}, 
        {'texto':'Matemático','score': 0}, 
        {'texto':'Ditador','score': 1},
        {'texto':'Rei','score': 0}
        ],
    'image': 'lib/assets/imag-2.jpg',
    },
    {
      'question': '3-Quantos continentes existem na Terra?',
      'answer': [
        {'texto':'5','score': 0},
        {'texto':'6','score': 1},
        {'texto':'7','score': 0},
        {'texto':'8','score': 0}
      ],
    'image': 'lib/assets/imag-3.jpg',  
    }, 
    {
      'question': '4-Que tratado acabou com a 1ª Guerra Mundial?',
      'answer': [
        {'texto':'Tratado de Paris','score': 0}, 
        {'texto':'Tratado de Bruxelas','score': 0}, 
        {'texto':'Tratado de Berlim','score': 0}, 
        {'texto':'Tratado de Versalhes','score': 1}
      ],
    'image': 'lib/assets/imag-4.jpg',
    },
    {
      'question': '5-Quando ocorreu a 2ª Guerra Mundial?',
      'answer': [
        {'texto':'Entre 1914 e 1918','score': 0},
        {'texto':'Entre 1967 e 1980','score': 0},
        {'texto':'Entre 1939 e 1945','score': 1},
        {'texto':'Entre 1889 e 1893','score': 0}
      ],
    'image': 'lib/assets/imag-5.jpg',
    },
    {
      'question':'6-De qual mitologia são esses deuses: Saturno, Júpiter, Juno, Plutão, Netuno, Vesta, Ceres e Febo?',
      'answer': [
        {'texto':'Mitologia Nórdica','score': 0}, 
        {'texto':'Mitologia Grega','score': 0}, 
        {'texto':'Mitologia Romana','score': 1}, 
        {'texto':'Mitologia Egípcia','score': 0}
      ],
    'image': 'lib/assets/imag-6.jpg',
    },
    {
      'question': '7-Que filósofo falou: "Se penso, logo existo"?',
      'answer': [
        {'texto':'René Descartes','score': 1}, 
        {'texto':'Sócrates','score': 0}, 
        {'texto':'Pitágoras de Samos','score': 0}, 
        {'texto':'Aristóteles','score': 0}
      ],
    'image': 'lib/assets/imag-7.jpg',
    },
    {
      'question': '8-Em que século ocorreu a Revolução Francesa?',
      'answer': [
        {'texto':'XVIII','score': 1}, 
        {'texto':'XVII','score': 0}, 
        {'texto':'XX','score': 0}, 
        {'texto':'XIV','score': 0}
      ],
    'image': 'lib/assets/imag-8.jpg',
    },
    {
      'question': '9-Em que dia Getúlio Vargas se suicidou?',
      'answer': [
        {'texto':'20/10/1940','score': 0},
        {'texto':'10/04/1932','score': 0},
        {'texto':'30/01/1969','score': 0},
        {'texto':'24/08/1954','score': 1}
      ],
    'image': 'lib/assets/imag-9.jpg',
    },
    {
      'question': '10-Qual é o menor país do mundo?',
      'answer': [
        {'texto':'Mônaco','score': 0},
        {'texto':'Nauru','score': 1},
        {'texto':'Vaticano','score': 0},
        {'texto':'São Marino','score': 0}
      ],
    'image': 'lib/assets/imag-10.jpg',
    },
    {
      'question': '11-Em que período da Pré-história foi descoberto o fogo?',
      'answer': [
        {'texto':'Mesolítico','score': 0},
        {'texto':'Paleolítico','score': 1},
        {'texto':'Neolítico','score': 0},
        {'texto':'Idade de Metais','score': 0}
      ],
    'image': 'lib/assets/imag-11.jpg',
    },
    {
      'question': '12-Quem elaborou a Teoria de Relatividade?',
      'answer': [
        {'texto':'Charles Darwin','score': 0},
        {'texto':'Stephen Hawking','score': 0},
        {'texto':'Albert Einstein','score': 1},
        {'texto':'Thomas Edson','score': 0}
      ],
    'image': 'lib/assets/imag-12.jpg',
    },
  ];

  @override
  void initState() {
    super.initState();
    _startTimer();
  }

  void _startTimer() {
    _timer = Timer.periodic(Duration(seconds: 1), (timer) {
      setState(() {
        if (_timeRemaining > 0) {
          _timeRemaining--;
        } else {
          _nextQuestion();
        }
      });
    });
  }

  void _nextQuestion() {
    if (_currentQuestionIndex < _questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _timeRemaining = 10;
      });
    } else {
      _timer?.cancel();
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => ResultPage(score: _score, total: _questions.length),
        ),
      );
    }
  }

  void _answerQuestion(int selectedOption) {
    if (_questions[_currentQuestionIndex]['answer'][selectedOption]['score'] == 1) {
      _score++;
    }
    _nextQuestion();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final question = _questions[_currentQuestionIndex];
    return Scaffold(
      appBar: AppBar(
        title: Text('Pergunta ${_currentQuestionIndex + 1} de ${_questions.length}'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Image.asset(
              question['image'],
              height: 500,
              width: 500,
              fit: BoxFit.contain,
            ),
              Text(
               question['question'],
               style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            Text(
              'Tempo restante: $_timeRemaining segundos',
              style: TextStyle(fontSize: 16, color: Colors.redAccent),
            ),
            SizedBox(height: 20),
            ...List.generate(question['answer'].length, (index) {
              return ElevatedButton(
                onPressed: () => _answerQuestion(index),
                child: Text(question['answer'][index]['texto']),
              );
            }),
          ],
        ),
      ),
    );
  }
}