import 'package:flutter/material.dart';
import 'package:take_ama/models/UserLogin.dart';
import 'package:take_ama/pages/client/caretakerCard.dart';
import 'package:take_ama/pages/client/myCaretaker.dart';
import 'package:take_ama/utils/storageLocal.dart';

class ClientHome extends StatefulWidget {
  const ClientHome({Key? key}) : super(key: key);

  @override
  State<ClientHome> createState() => _ClientHomeState();
}

class _ClientHomeState extends State<ClientHome> {
  String fullName = "John Doe";
  int pageIndex = 0;
  List<dynamic> pages = [
    const CaretakerCardPage(),
    const MyCareTaker(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Take AMA'),
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
                  FutureBuilder(
                    future: StorageLocal.getUser(),
                    builder: (BuildContext context,
                        AsyncSnapshot<Profile?> snapshot) {
                      if (!snapshot.hasData) {
                        return Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      Profile profile = snapshot.data!;
                      return Text(
                        '${profile.firstName} ${profile.lastName}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
            ListTile(
              onTap: () {
                _selectChange(0);
              },
              selected: pageIndex == 0,
              leading: Icon(Icons.search),
              title: Text('Find Caretaker'),
            ),
            ListTile(
              onTap: () {
                _selectChange(1);
              },
              selected: pageIndex == 1,
              leading: Icon(Icons.my_library_books),
              title: Text('My Caretaker'),
            ),
            ListTile(
              selected: pageIndex == 2,
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: _logout,
            )
          ],
        ),
      ),
    );
  }

  _selectChange(int index) {
    setState(() {
      pageIndex = index;
      Navigator.pop(context);
    });
  }

  _logout() {
    StorageLocal.clearUser();
    Navigator.pushNamedAndRemoveUntil(context, "/login", (route) => false);
  }
}
