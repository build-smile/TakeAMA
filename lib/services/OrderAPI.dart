import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/Order.dart';

class OrderAPI {
  static String url = "http://take-ama.cckcoder.cc";
  static Future<String> create(Order order) async {
    var urlRegister = Uri.parse('$url/api/order/create.php');
    var response = await http.post(
      urlRegister,
      headers: {
        'Content-Type': 'application/json',
      },
      encoding: Encoding.getByName('utf-8'),
      body: jsonEncode({
        "careTakerId": 8,
        "hours": 3,
        "price": 1500,
        "amaId": 13,
      }),
    );
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result["message"];
    }
    return "Something went wrong";
  }
}