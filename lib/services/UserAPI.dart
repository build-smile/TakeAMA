import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:take_ama/models/User.dart';
import 'package:take_ama/models/UserLogin.dart';

class UserAPI {
  static String url = "http://take-ama.cckcoder.cc";

  static Future<String> register(User user) async {
    var urlRegister = Uri.parse('$url/api/user/register.php');
    var response = await http.post(
      urlRegister,
      headers: {
        'Content-Type': 'application/json',
      },
      encoding: Encoding.getByName('utf-8'),
      body: jsonEncode(user),
    );

    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      return result["message"];
    }
    return "Something went wrong";
  }

  static Future<UserLogin?> login(
      {required String username, required String password}) async {
    var urlApi = Uri.parse('$url/api/user/login.php');
    final response = await http.post(urlApi,
        headers: {
          'Content-Type': 'application/json',
        },
        encoding: Encoding.getByName('utf-8'),
        body: jsonEncode({
          'username': username,
          'password': password,
        }));
    if (response.statusCode == 200) {
      final result = jsonDecode(response.body);
      var data = UserLogin.fromJson(result);
      return data;
    }
    return null;
  }
}
