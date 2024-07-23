import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PresupuestApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'PresupuestApp'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
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
                      // Acción para el primer botón
                    },
                    tooltip: 'Botón 1',
                    child: const Icon(Icons.add, size: 60),
                  ),
                ),
                SizedBox(
                  width: 170.0,
                  height: 170.0,
                  child: FloatingActionButton(
                    onPressed: () {
                      // Acción para el segundo botón
                    },
                    tooltip: 'Botón 2',
                    child: const Icon(Icons.add, size: 60),
                  ),
                ),
              ],
            ),
            SizedBox(height: 40), // Espaciado reducido entre filas
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                SizedBox(
                  width: 170.0,
                  height: 170.0,
                  child: FloatingActionButton(
                    onPressed: () {
                      // Acción para el tercer botón
                    },
                    tooltip: 'Botón 3',
                    child: const Icon(Icons.add, size: 60),
                  ),
                ),
                SizedBox(
                  width: 170.0,
                  height: 170.0,
                  child: FloatingActionButton(
                    onPressed: () {
                      // Acción para el cuarto botón
                    },
                    tooltip: 'Botón 4',
                    child: const Icon(Icons.add, size: 60),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}