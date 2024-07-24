import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/history.dart';
import 'package:flutter_application_1/Pages/likedProducts.dart';
import 'package:flutter_application_1/Pages/postadd.dart';
import 'package:flutter_application_1/Pages/stats.dart';

class PageHome extends StatelessWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'PresupuestApp',
            style: TextStyle(fontSize: 28), // Ajusta el tamaño del texto si lo deseas
          ),
        ),
        backgroundColor: Colors.blue, // Cambia el color si lo deseas
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: 170.0,
                  height: 170.0,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => PostAdd()),
                      );
                    },
                    child: const Text(
                      'Agregar producto',
                      style: TextStyle(fontSize: 26),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  width: 170.0,
                  height: 170.0,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => History()),
                      );
                    },
                    child: const Text(
                      'Historial',
                      style: TextStyle(fontSize: 26),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20), // Espacio entre la primera y segunda fila
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: 170.0,
                  height: 170.0,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => likedproducts()),
                      );
                    },
                    child: const Text(
                      'Favoritos',
                      style: TextStyle(fontSize: 26),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                SizedBox(
                  width: 170.0,
                  height: 170.0,
                  child: FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Stats()),
                      );
                    },
                    child: const Text(
                      'Estadisticas',
                      style: TextStyle(fontSize: 26),
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40), // Espacio al final
          ],
        ),
      ),
    );
  }
}
