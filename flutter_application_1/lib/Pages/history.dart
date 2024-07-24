import 'package:flutter/material.dart';

class History extends StatelessWidget {
  const History({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'History',
            style: TextStyle(fontSize: 28),
          ),
        ),
        backgroundColor: Colors.blue
      ),
      body: Center(
        child: Text(
          'Lista de productos presupuestados',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}