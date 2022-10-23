import 'package:flutter/material.dart';

import '../../components/MyCardTaker.dart';

class MyCareTaker extends StatefulWidget {
  const MyCareTaker({Key? key}) : super(key: key);

  @override
  State<MyCareTaker> createState() => _MyCareTakerState();
}

class _MyCareTakerState extends State<MyCareTaker> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: ListView(
      children: [
        MyCardTaker(),
      ],
    ));
  }
}
