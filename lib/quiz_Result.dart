import 'package:flutter/material.dart';
import 'quiz_Tela.dart';

class ResultPage extends StatelessWidget {
  final int score;
  final int total;

  ResultPage({required this.score, required this.total});

  @override
  Widget build(BuildContext context) {
    bool isWinner = score >= total / 2; // Define condição para "ganhou"
    return Scaffold(
      appBar: AppBar(
        title: Text('Resultado do Quiz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            if (isWinner)
             Image.asset('lib/assets/trofeu1.jpg',height:200, width:200,), 
            Text(
              'Você acertou $score de $total perguntas!',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => HomePage()),
                  (route) => false,
                );
              },
              child: Text('Reiniciar Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}