import 'package:flutter/material.dart';
import 'package:take_ama/models/UserLogin.dart';
import 'package:take_ama/pages/admin/editDetail.dart';
import 'package:take_ama/pages/admin/home.dart';
import 'package:take_ama/pages/careTaker/home.dart';
import 'package:take_ama/pages/careTaker/myOrderDetail.dart';
import 'package:take_ama/pages/client/caretakerCard.dart';
import 'package:take_ama/pages/client/caretakerDetail.dart';
import 'package:take_ama/pages/client/home.dart';
import 'package:take_ama/pages/login.dart';
import 'package:take_ama/pages/ratingHome.dart';
import 'package:take_ama/pages/register.dart';
import 'package:take_ama/utils/storageLocal.dart';

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
        "/client-home": (context) => ClientHome(),
        "/caretaker-home": (context) => CareTakerHome(),
        "/login": (context) => LoginPage(),
        "/admin": (context) => AdminHomePage(),
        "/detail": (context) => EditDetailPage(),
        "/myOrderDetail": (context) => MyOrderDetail(),
        "/ratingHome": (context) => RatingHome(),
      },
      home: FutureBuilder(
        future: StorageLocal.getUser(),
        builder: (context, AsyncSnapshot<Profile> snapshot) {
          if (snapshot.hasData) {
            Profile user = snapshot.data!;
            if (user.userType == "1") {
              return ClientHome();
            } else if (user.userType == "2") {
              return CareTakerHome();
            } else {
              return LoginPage();
            }
          }
          return CircularProgressIndicator();
        },
      ),
    );
  }
}
