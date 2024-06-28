import 'package:flutter/material.dart';
import 'package:excuela/widgets/quiz.dart';
import 'package:excuela/widgets/barraProgreso.dart';
import 'package:excuela/widgets/targeta.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Custom Widgets App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Custom Widgets App'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Progreso Interactivo'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => ProgresoInteractivoPage()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Tarjeta Educativa'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => TarjetaEducativaPage()),
                );
              },
            ),
            ElevatedButton(
              child: Text('Quiz Personalizado'),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => QuizPersonalizadoPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}








