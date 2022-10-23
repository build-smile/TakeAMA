import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:take_ama/models/CaretakerCard.dart';

class CaretakerCardPage extends StatefulWidget {
  const CaretakerCardPage({Key? key}) : super(key: key);

  @override
  State<CaretakerCardPage> createState() => _CaretakerCardPageState();
}

class _CaretakerCardPageState extends State<CaretakerCardPage> {
  var caretakers = [
    Caretaker(
        fullName: "Json yong",
        imgUrl:
            "https://media.istockphoto.com/photos/headshot-portrait-of-smiling-male-employee-in-office-picture-id1309328823?b=1&k=20&m=1309328823&s=170667a&w=0&h=a-f8vR5TDFnkMY5poQXfQhDSnK1iImIfgVTVpFZi_KU=",
        rate: 4.5,
        detail: "age 35 year"),
    Caretaker(
        fullName: "Kem yong",
        imgUrl:
            "https://media.istockphoto.com/photos/headshot-portrait-of-smiling-ethnic-businessman-in-office-picture-id1300512215?b=1&k=20&m=1300512215&s=612x612&w=0&h=pP5ksvhx-gIHFVAyZTn31H_oJuhB0nX4HnLLUN2kVAg=",
        rate: 1.5,
        detail: "age 35 year"),
    Caretaker(
        fullName: "Sara yong",
        imgUrl:
            "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7vAgLQ-YG784iOrvDMDtO-Spf37R7gN09hixLwEmKwmyiduiH5a2INoHI6sWTflRpEv0&usqp=CAU",
        rate: 5.5,
        detail: "age 35 year"),
    Caretaker(
        fullName: "halo yong",
        imgUrl:
            "https://i.pinimg.com/originals/af/9f/1f/af9f1fed99621ae20f9edd2ab6cbb8bd.jpg",
        rate: 7.5,
        detail: "age 35 year")
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Swiper(
        itemBuilder: (BuildContext context, int index) {
          Caretaker caretaker = caretakers[index];
          return Card(
            child: Column(
              children: [
                Expanded(
                  flex: 3,
                  child: Image.network(
                    caretaker.imgUrl,
                    fit: BoxFit.cover,
                  ),
                ),
                Expanded(
                  child: Column(
                    children: [
                      Text(
                        caretaker.fullName,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 25,
                        ),
                      ),
                      Text(
                        caretaker.detail,
                        style: TextStyle(
                          fontSize: 15,
                        ),
                      ),
                      ElevatedButton(
                        onPressed: _selectCareTaker,
                        child: Text("Select"),
                      )
                    ],
                  ),
                )
              ],
            ),
          );
        },
        itemCount: caretakers.length,
        pagination: SwiperPagination(),
        control: SwiperControl(),
      ),
    );
  }

  _selectCareTaker() {
    Navigator.pushNamed(context, "/caretakerDetail");
  }
}
