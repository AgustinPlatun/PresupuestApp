import 'package:flutter/material.dart';

class Stats extends StatelessWidget {
  const Stats({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Estadisticas',
            style: TextStyle(fontSize: 28),
          ),
        ),
        backgroundColor: Colors.blue
      ),
      body: Center(
        child: Text(
          'Estadisticas',
          style: TextStyle(fontSize: 26),
        ),
      ),
    );
  }
}