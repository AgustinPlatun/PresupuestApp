import 'package:flutter/material.dart';

// ignore: camel_case_types
class likedproducts extends StatelessWidget {
  const likedproducts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Liked Products',
            style: TextStyle(fontSize: 28),
          ),
        ),
        backgroundColor: Colors.blue
      ),
      body: Center(
        child: Text(
          'Lista de likeados',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}