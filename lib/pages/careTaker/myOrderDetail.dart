import 'package:flutter/material.dart';
import 'package:take_ama/models/Order.dart';
import 'package:take_ama/services/OrderAPI.dart';

class MyOrderDetail extends StatefulWidget {
  const MyOrderDetail({Key? key}) : super(key: key);

  @override
  State<MyOrderDetail> createState() => _MyOrderDetailState();
}

class _MyOrderDetailState extends State<MyOrderDetail> {
  @override
  Widget build(BuildContext context) {
    OrderDetail order =
        ModalRoute.of(context)!.settings.arguments as OrderDetail;
    return Scaffold(
      appBar: AppBar(title: Text('Status')),
      body: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Visibility(
            visible: order.id != '1',
            child: ElevatedButton(
              child: const Text('Accept'),
              onPressed: () {
                updateStatus("1", order.id!);
              },
            ),
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.red),
            child: const Text('Reject'),
            onPressed: () {
              updateStatus("9", order.id!);
            },
          ),
          ElevatedButton(
            style: ElevatedButton.styleFrom(primary: Colors.green),
            child: const Text('Complete'),
            onPressed: () {
              updateStatus("2", order.id!);
            },
          ),
        ],
      ),
    );
  }

  updateStatus(String status, String orderId) async {
    await OrderAPI.update(orderId, status);
    Navigator.pop(context);
  }
}
