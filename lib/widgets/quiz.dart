import 'package:flutter/material.dart';

/// La clase `QuizPersonalizadoPage` es un `StatelessWidget` que representa
/// una página en la aplicación. Esta página contiene una barra de aplicación
/// y un centro que muestra el `QuizPersonalizadoWidget`.
class QuizPersonalizadoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Quiz Personalizado'),
      ),
      body: Center(
        child: QuizPersonalizadoWidget(),
      ),
    );
  }
}

/// La clase `QuizPersonalizadoWidget` es un `StatelessWidget` que proporciona
/// un conjunto de preguntas al `QuizWidget`.
class QuizPersonalizadoWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return QuizWidget(
      preguntas: [
        Pregunta(
          opcion: '¿Cuál es la capital de Francia?',
          opciones: ['París', 'Londres', 'Madrid'],
          respuestaCorrecta: 'París',
        ),
        Pregunta(
          opcion: '¿El sol es una estrella?',
          opciones: ['Verdadero', 'Falso'],
          respuestaCorrecta: 'Verdadero',
        ),
      ],
    );
  }
}

/// La clase `QuizWidget` es un `StatefulWidget` que representa un cuestionario.
/// Recibe una lista de preguntas y gestiona el estado del cuestionario.
///
/// Parámetros:
///   - `preguntas`: Lista de objetos `Pregunta` que representan las preguntas del cuestionario.
class QuizWidget extends StatefulWidget {
  final List<Pregunta> preguntas;

  QuizWidget({required this.preguntas});

  @override
  _QuizWidgetState createState() => _QuizWidgetState();
}

/// La clase `_QuizWidgetState` es el estado del widget `QuizWidget`. Gestiona
/// la lógica de selección de respuestas, verificación de respuestas y navegación
/// entre preguntas.
class _QuizWidgetState extends State<QuizWidget> {
  int _preguntaActual = 0;
  String? _respuestaSeleccionada;
  bool _mostrarRetroalimentacion = false;
  bool _esCorrecta = false;

  /// Método para seleccionar una respuesta. Actualiza el estado con la respuesta seleccionada.
  void _seleccionarRespuesta(String? respuesta) {
    setState(() {
      _respuestaSeleccionada = respuesta;
      _mostrarRetroalimentacion = false;
    });
  }

  /// Método para verificar la respuesta seleccionada. Comprueba si la respuesta es correcta
  /// y muestra la retroalimentación correspondiente.
  void _verificarRespuesta() {
    setState(() {
      if (_respuestaSeleccionada != null) {
        _esCorrecta = widget.preguntas[_preguntaActual].respuestaCorrecta == _respuestaSeleccionada;
        _mostrarRetroalimentacion = true;
      }
    });
  }

  /// Método para pasar a la siguiente pregunta. Reinicia el estado de la respuesta seleccionada
  /// y la retroalimentación.
  void _siguientePregunta() {
    setState(() {
      if (_preguntaActual < widget.preguntas.length - 1) {
        _preguntaActual++;
        _respuestaSeleccionada = null;
        _mostrarRetroalimentacion = false;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    Pregunta pregunta = widget.preguntas[_preguntaActual];
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        // Muestra la pregunta actual.
        Text(
          pregunta.opcion,
          style: TextStyle(fontSize: 20.0),
        ),
        // Muestra las opciones de respuesta.
        ...pregunta.opciones.map((opcion) {
          return RadioListTile<String>(
            title: Text(opcion),
            value: opcion,
            groupValue: _respuestaSeleccionada,
            onChanged: _seleccionarRespuesta,
          );
        }).toList(),
        // Botón para verificar la respuesta seleccionada.
        ElevatedButton(
          child: Text('Verificar'),
          onPressed: _verificarRespuesta,
        ),
        // Muestra la retroalimentación si se ha verificado la respuesta.
        if (_mostrarRetroalimentacion)
          Text(
            _esCorrecta ? '¡Correcto!' : 'Incorrecto, la respuesta es ${pregunta.respuestaCorrecta}.',
            style: TextStyle(
              color: _esCorrecta ? Colors.green : Colors.red,
              fontSize: 16.0,
            ),
          ),
        // Botón para pasar a la siguiente pregunta.
        ElevatedButton(
          child: Text('Siguiente'),
          onPressed: _siguientePregunta,
        ),
      ],
    );
  }
}

/// La clase `Pregunta` representa una pregunta del cuestionario.
///
/// Parámetros:
///   - `opcion`: Texto de la pregunta.
///   - `opciones`: Lista de opciones de respuesta.
///   - `respuestaCorrecta`: Respuesta correcta de la pregunta.
class Pregunta {
  final String opcion;
  final List<String> opciones;
  final String respuestaCorrecta;

  Pregunta({
    required this.opcion,
    required this.opciones,
    required this.respuestaCorrecta,
  });
}
