import 'package:flutter/material.dart';
import 'package:take_ama/pages/careTaker/setting.dart';
import 'package:take_ama/pages/shared/newsFeed.dart';
import 'myOrder.dart';

class CareTakerHome extends StatefulWidget {
  const CareTakerHome({super.key});
  @override
  State<CareTakerHome> createState() => _CareTakerHomeState();
}

class _CareTakerHomeState extends State<CareTakerHome> {
  int _selectedIndex = 0;
  static const List<Widget> _widgetOptions = <Widget>[
    NewsFeed(),
    MyOrder(),
    SettingPage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CareTaker'),
      ),
      body: Center(
        child: _widgetOptions.elementAt(_selectedIndex),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.newspaper),
            label: 'News',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.inbox),
            label: 'My Order',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Setting',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onItemTapped,
      ),
    );
  }
}
