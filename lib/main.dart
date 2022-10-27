import 'package:flutter/material.dart';
import 'package:take_ama/pages/client/caretakerCard.dart';
import 'package:take_ama/pages/client/caretakerDetail.dart';
import 'package:take_ama/pages/client/home.dart';
import 'package:take_ama/pages/login.dart';
import 'package:take_ama/pages/register.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/register": (context) => RegisterPage(),
        "/caretaker": (context) => CaretakerCardPage(),
        "/caretakerDetail": (context) => CaretakerDetailPage(),
      },
      home: LoginPage(),
    );
  }
}
