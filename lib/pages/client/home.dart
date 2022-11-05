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
        title: const Text('Take AMA'),
      ),
      body: pages[pageIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(color: Colors.blue),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const CircleAvatar(
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
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                      Profile profile = snapshot.data!;
                      return Text(
                        '${profile.firstName} ${profile.lastName}',
                        style: const TextStyle(
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
              leading: const Icon(Icons.search),
              title: const Text('Find Caretaker'),
            ),
            ListTile(
              onTap: () {
                _selectChange(1);
              },
              selected: pageIndex == 1,
              leading: const Icon(Icons.my_library_books),
              title: const Text('My Caretaker'),
            ),
            ListTile(
              selected: pageIndex == 2,
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
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
