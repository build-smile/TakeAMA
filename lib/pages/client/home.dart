import 'package:flutter/material.dart';
import 'package:take_ama/pages/client/CaretakerCard.dart';

class ClientHome extends StatefulWidget {
  const ClientHome({Key? key}) : super(key: key);

  @override
  State<ClientHome> createState() => _ClientHomeState();
}

class _ClientHomeState extends State<ClientHome> {
  String fullName = "John Doe";
  int pageIndex = 0;
  List<dynamic> pages = [const CaretakerCardPage()];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Take Ama'),
      ),
      body: pages[pageIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 50,
                    child: Icon(
                      Icons.person_outline,
                      size: 50,
                    ),
                  ),
                  Text(
                    fullName,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                  ),
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.search),
              title: Text('Find Caretaker'),
            ),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
            )
          ],
        ),
      ),
    );
  }
}
