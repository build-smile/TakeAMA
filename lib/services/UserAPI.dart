import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:take_ama/models/User.dart';

import '../utils/storageToken.dart';

class UserAPI {
  static String url = "http://take-ama.cckcoder.cc";
  static register(User user) async {
    var urlRegister = Uri.parse('$url/api/user/register.php');
    var res = await http.post(
      urlRegister,
      headers: {
        'Content-Type': 'application/json',
      },
      encoding: Encoding.getByName('utf-8'),
      body: jsonEncode(user),
    );

    if (res.statusCode == 200) {}
  }
}
