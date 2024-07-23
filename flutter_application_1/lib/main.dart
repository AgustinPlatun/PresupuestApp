import 'package:flutter/material.dart';// Asegúrate de que la ruta es correcta
import 'package:flutter_application_1/Pages/home.dart'; // Asegúrate de que la ruta es correcta

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PresupuestApp', // Título de la aplicación
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PageHome(),
      debugShowCheckedModeBanner: false, // Elimina el banner de depuración
    );
  }
}

