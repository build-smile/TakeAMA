import 'package:flutter/material.dart';
import 'package:take_ama/pages/client/home.dart';
import 'package:take_ama/pages/employee/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: ClientHome(),
    );
  }
}
