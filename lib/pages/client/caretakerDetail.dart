import 'package:flutter/material.dart';

class CaretakerDetailPage extends StatefulWidget {
  const CaretakerDetailPage({Key? key}) : super(key: key);

  @override
  State<CaretakerDetailPage> createState() => _CaretakerDetailPageState();
}

class _CaretakerDetailPageState extends State<CaretakerDetailPage> {
  @override
  Widget build(BuildContext context) {
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
              "Name: สมศรี จันทร์เรือง",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
                "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum."),
          ),
          Container(
            padding: EdgeInsets.all(20),
            child: TextFormField(
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
              readOnly: true,
              decoration: InputDecoration(
                hintText: "0 บาท",
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {},
                child: Text("Confirm"),
              ),
            ],
          )
        ],
      ),
    );
  }
}
