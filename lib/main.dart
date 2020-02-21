import 'package:flutter/material.dart';
import 'homepage.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    home: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Tax Scheme Desider',
      debugShowCheckedModeBanner: false,
      home: HomePage(),
      
    );
  }
}