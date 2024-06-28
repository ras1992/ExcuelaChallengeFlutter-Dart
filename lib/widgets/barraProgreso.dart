import 'package:flutter/material.dart';

/// La clase `ProgresoInteractivoPage` es un `StatelessWidget` que representa
/// una página en la aplicación. Esta página contiene una barra de aplicación
/// y un centro que muestra el `ProgresoInteractivoWidget`.
class ProgresoInteractivoPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Progreso Interactivo'),
      ),
      body: Center(
        child: ProgresoInteractivoWidget(),
      ),
    );
  }
}

/// La clase `ProgresoInteractivoWidget` es un `StatefulWidget` que representa
/// un widget de progreso interactivo animado. Utiliza un `AnimationController`
/// para controlar la animación y un `Tween` para definir los valores de la
/// animación.
class ProgresoInteractivoWidget extends StatefulWidget {
  @override
  _ProgresoInteractivoWidgetState createState() =>
      _ProgresoInteractivoWidgetState();
}

/// La clase `_ProgresoInteractivoWidgetState` es el estado del widget
/// `ProgresoInteractivoWidget`. Implementa `SingleTickerProviderStateMixin`
/// para proporcionar el `vsync` necesario para el `AnimationController`.
class _ProgresoInteractivoWidgetState extends State<ProgresoInteractivoWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    // Inicializa el AnimationController con una duración de 5 segundos
    // y configura la animación para que se repita en reversa.
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 5),
    )..repeat(reverse: true);
    // Define una animación de tipo Tween que va de 0.0 a 1.0.
    _animation = Tween(begin: 0.0, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    // Libera los recursos del AnimationController cuando el widget
    // ya no está en la pantalla.
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        // Construye un CircularProgressIndicator que usa el valor
        // actual de la animación para determinar su progreso.
        return CircularProgressIndicator(
          value: _animation.value,
          color: Colors.orange,
          strokeWidth: 8.0,
        );
      },
    );
  }
}
