import 'package:flutter/material.dart';

/// La clase `TarjetaEducativaPage` es un `StatelessWidget` que representa
/// una página en la aplicación. Esta página contiene una barra de aplicación
/// y un centro que muestra el `TarjetaEducativaWidget`.
class TarjetaEducativaPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Tarjeta Educativa'),
      ),
      body: Center(
        child: TarjetaEducativaWidget(
          imagen: 'https://via.placeholder.com/150',
          titulo: 'Título de la Tarjeta',
          descripcion: 'Esta es una descripción de la tarjeta educativa.',
        ),
      ),
    );
  }
}

/// La clase `TarjetaEducativaWidget` es un `StatelessWidget` que representa
/// una tarjeta educativa. La tarjeta muestra una imagen, un título, una
/// descripción y botones de acción.
///
/// Parámetros:
///   - `imagen`: URL de la imagen a mostrar en la tarjeta.
///   - `titulo`: Título de la tarjeta.
///   - `descripcion`: Descripción de la tarjeta.
class TarjetaEducativaWidget extends StatelessWidget {
  final String imagen;
  final String titulo;
  final String descripcion;

  TarjetaEducativaWidget({
    required this.imagen,
    required this.titulo,
    required this.descripcion,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5.0,
      margin: EdgeInsets.all(10.0),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // Muestra una imagen desde una URL.
          Image.network(imagen),
          // Muestra el título de la tarjeta con estilo.
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              titulo,
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          // Muestra la descripción de la tarjeta.
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(descripcion),
          ),
          // Muestra una barra de botones con acciones.
          ButtonBar(
            children: <Widget>[
              TextButton(
                child: Text('Botón 1'),
                onPressed: () {},
              ),
              TextButton(
                child: Text('Botón 2'),
                onPressed: () {},
              ),
            ],
          ),
        ],
      ),
    );
  }
}
