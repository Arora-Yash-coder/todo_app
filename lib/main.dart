import 'package:flutter/material.dart';

import 'home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'ToDo App',
      // Color Scheme
      theme: ThemeData(
        primarySwatch: Colors.yellow,
        hintColor: Colors.pinkAccent,
        dividerColor: Colors.pinkAccent,
      ),
      home: const Home(),
    );
  }
}
