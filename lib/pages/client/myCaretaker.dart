import 'package:flutter/material.dart';

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
        ListTile(
          leading: Text('12/12/2022'),
          title: Text('สุพจน์ ใจร่ม'),
          subtitle: Text('8ชั่วโมง/2500 บาท'),
          trailing: Column(
            children: [
              Text('รอการตอบรับ'),
              TextButton(
                onPressed: () {},
                child: Text("ยกเลิก"),
              ),
            ],
          ),
        ),
        ListTile(
          leading: Text('12/12/2022'),
          title: Text('สุพจน์ ใจร่ม'),
          subtitle: Text('8ชั่วโมง/2500 บาท'),
          trailing: Text('กำลังดำเนินการ'),
        ),
        ListTile(
          leading: Text('10/12/2022'),
          title: Text('สุขใจ ใจร่ม'),
          subtitle: Text('8ชั่วโมง/2500 บาท'),
          trailing: ElevatedButton(
            onPressed: () {},
            child: Text("เสร็จสิ้น"),
          ),
        ),
      ],
    ));
  }
}
