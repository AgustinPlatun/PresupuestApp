import 'package:flutter/material.dart';

class PostAdd extends StatelessWidget{
  const PostAdd ({Key? key}) : super(key: key);
  @override
  Widget build (BuildContext context){
    return Center(
      child: Text('Post Add',
      style: TextStyle (fontSize: 28),
      ),
    );
  }
}