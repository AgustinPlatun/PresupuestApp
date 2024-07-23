import 'package:flutter/material.dart';

class PostAdd extends StatelessWidget {
  const PostAdd({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Agregar producto',
            style: TextStyle(fontSize: 28),
          ),
        ),
        backgroundColor: Colors.blue
      ),
      body: Center(
        child: Text(
          'Post Add',
          style: TextStyle(fontSize: 28),
        ),
      ),
    );
  }
}
