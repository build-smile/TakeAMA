import 'package:flutter/material.dart';
import 'package:take_ama/models/Order.dart';
import 'package:take_ama/services/OrderAPI.dart';
import '../../utils/storageLocal.dart';

class MyOrder extends StatefulWidget {
  const MyOrder({Key? key}) : super(key: key);

  @override
  State<MyOrder> createState() => _MyOrderState();
}

class _MyOrderState extends State<MyOrder> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: OrderAPI.getById(id: globalProfile!.id!),
        builder: (BuildContext context, AsyncSnapshot<OrderDetail?> snapshot) {
          if (!snapshot.hasData) {
            return const Center(child: Text('No data'));
          }
          OrderDetail orderDetail = snapshot.data!;
          return ListTile(
            leading: const Icon(Icons.person),
            title: Text('${orderDetail.amaName!} ${orderDetail.hours} ชั่วโมง'),
            subtitle: Text('${orderDetail.price} บาท'),
            trailing: Text(orderDetail.orderStatus!),
            onTap: () {
              Navigator.pushNamed(context, '/myOrderDetail',
                      arguments: orderDetail)
                  .then((value) {
                setState(() {});
              });
            },
          );
        },
      ),
    );
  }
}

// return ListView.separated(
//   itemBuilder: (BuildContext context, int i) {
//     return ListTile();
//   },
//   itemCount: 0,
//   separatorBuilder: (BuildContext context, int index) =>
//       const Divider(
//     color: Colors.black,
//   ),
// );
