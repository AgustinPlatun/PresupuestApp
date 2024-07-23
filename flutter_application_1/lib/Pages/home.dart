import 'package:flutter/material.dart';
import 'package:flutter_application_1/Pages/postAdd.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'PresupuestApp',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const PageHome(),
    );
  }
}

class PageHome extends StatefulWidget {
  const PageHome({Key? key}) : super(key: key);

  @override
  _PageHomeState createState() => _PageHomeState();
}

class _PageHomeState extends State<PageHome> {
  int _selectedIndex = 0;

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page Home'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_one),
            label: 'Page One',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_two),
            label: 'Page Two',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_3),
            label: 'Page Three',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.looks_4),
            label: 'Page Four',
          ),
        ],
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}