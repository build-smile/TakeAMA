import 'package:flutter/material.dart';
import 'package:take_ama/models/UserLogin.dart';

class CaretakerDetailPage extends StatefulWidget {
  const CaretakerDetailPage({Key? key}) : super(key: key);

  @override
  State<CaretakerDetailPage> createState() => _CaretakerDetailPageState();
}

class _CaretakerDetailPageState extends State<CaretakerDetailPage> {
  var txtAmount = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Profile profile = ModalRoute.of(context)!.settings.arguments as Profile;
    return Scaffold(
      appBar: AppBar(
        title: Text('CareTaker'),
      ),
      body: ListView(
        children: [
          SizedBox(
            height: 15,
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              "Name: ${profile.firstName} ${profile.lastName}",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(profile.detail ?? ''),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              onChanged: (String? v) {
                v = v ?? "";
                if (int.tryParse(v) != null) {
                  double amount = double.parse(v) * 300;
                  txtAmount.text = '$amount';
                  setState(() {});
                }
              },
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: "จำนวนชั่วโมง",
                border: OutlineInputBorder(),
              ),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: TextFormField(
              controller: txtAmount,
              readOnly: true,
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("Confirm"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
