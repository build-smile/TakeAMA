import 'package:flutter/material.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:take_ama/models/UserLogin.dart';
import 'package:take_ama/services/UserAPI.dart';

class CaretakerCardPage extends StatefulWidget {
  const CaretakerCardPage({Key? key}) : super(key: key);

  @override
  State<CaretakerCardPage> createState() => _CaretakerCardPageState();
}

class _CaretakerCardPageState extends State<CaretakerCardPage> {
  var images = [
    'https://media.istockphoto.com/photos/headshot-portrait-of-smiling-male-employee-in-office-picture-id1309328823?b=1&k=20&m=1309328823&s=170667a&w=0&h=a-f8vR5TDFnkMY5poQXfQhDSnK1iImIfgVTVpFZi_KU=',
    'https://media.istockphoto.com/photos/headshot-portrait-of-smiling-ethnic-businessman-in-office-picture-id1300512215?b=1&k=20&m=1300512215&s=612x612&w=0&h=pP5ksvhx-gIHFVAyZTn31H_oJuhB0nX4HnLLUN2kVAg=',
    'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcS7vAgLQ-YG784iOrvDMDtO-Spf37R7gN09hixLwEmKwmyiduiH5a2INoHI6sWTflRpEv0&usqp=CAU',
    'https://i.pinimg.com/originals/af/9f/1f/af9f1fed99621ae20f9edd2ab6cbb8bd.jpg'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder(
          future: UserAPI.getAll(),
          builder:
              (BuildContext context, AsyncSnapshot<List<Profile?>> snapshot) {
            if (snapshot.hasData) {
              List<Profile?> caretakers = snapshot.data!;
              caretakers = caretakers.where((e) => e!.userType == "2").toList();
              var images = generateImg(caretakers.length);
              return Swiper(
                loop: false,
                itemBuilder: (BuildContext context, int index) {
                  Profile caretaker = caretakers[index]!;
                  return Card(
                    child: Column(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Image.network(
                            images[index],
                            fit: BoxFit.cover,
                          ),
                        ),
                        Expanded(
                          child: Column(
                            children: [
                              Text(
                                '${caretaker.firstName} ${caretaker.lastName}',
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 25,
                                ),
                              ),
                              Text(
                                '${DateTime.now().year - int.parse(caretaker.birthDay!)} Year',
                                style: const TextStyle(
                                  fontSize: 15,
                                ),
                              ),
                              ElevatedButton(
                                onPressed: () {
                                  _selectCareTaker(caretaker);
                                },
                                child: const Text("Select"),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                },
                itemCount: caretakers.length,
                pagination: const SwiperPagination(),
                control: const SwiperControl(),
              );
            }
            return const Center(child: CircularProgressIndicator());
          }),
    );
  }

  _selectCareTaker(Profile profile) {
    Navigator.pushNamed(context, "/caretakerDetail", arguments: profile);
  }

  List<String> generateImg(int length) {
    List<String> imgs = [];
    int v = 0;
    for (int i = 0; i < length; i++) {
      if (i == images.length - 1) {
        v = 0;
      }
      imgs.add(images[v]);
      v++;
    }
    return imgs;
  }
}
