import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/home.dart'; // Asegúrate de importar la página de inicio

class likedproducts extends StatelessWidget {
  const likedproducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Contenido principal de la pantalla
          Column(
            children: [
              // El AppBar debe estar en la parte superior del Stack
              AppBar(
                automaticallyImplyLeading: false,
                title: Center(
                  child: Text(
                    'Liked Products',
                    style: TextStyle(fontSize: 28),
                  ),
                ),
                backgroundColor: Colors.blue,
                elevation: 0, // Elimina la sombra del AppBar
              ),
              Expanded(
                child: Center(
                  child: Text(
                    'Lista de likeados',
                    style: TextStyle(fontSize: 28),
                  ),
                ),
              ),
            ],
          ),
          // Ícono sobre el AppBar, centrado en el Container, más abajo
          Positioned(
            top: 25, // Ajusta este valor para mover el ícono más abajo
            left: 16,
            child: Container(
              width: 50, // Ancho del Container
              height: 50, // Alto del Container
              alignment: Alignment.center, // Centra el ícono en el Container
              child: IconButton(
                icon: Icon(Icons.home, color: Colors.white, size: 30.0), // Color azul para el ícono
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => PageHome()),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
