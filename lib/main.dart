import 'package:flutter/material.dart';
import 'package:flutter_ci_cd/pages/new_calculator_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: 'Calculator',
      home: NewCalculatorPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}
