import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:shop_ease/model_class/user_model.dart';

class ApiServices {
  Future<Details> signUp(
      String UserName, String Password, String Email, String PhoneNo) async {
    final http.Response response = await http.post(
        Uri.parse('https://d95b-117-204-87-247.ngrok.io/api/user-registration'),
        headers: <String, String>{
          'Content-type': 'application/x-www-form-urlencoded'
        },
        //encoding: Encoding.getByName('utf-8'),
        body: jsonEncode(<String, String>{
          'UserName': UserName,
          'Password': Password,
          'Email': Email,
          'PhoneNo': PhoneNo,
          'Role': '2'
        }));
    // print(UserName);
    // print(Password);
    // print(Email);
    // print(PhoneNo);
    //print(response);
    if (response.statusCode == 200) {
      print(response.statusCode);
      return Details.fromJson(jsonDecode(response.body));
    } else {
      print(jsonDecode(response.body));
      throw Exception('Registration Failed');
    }
  }
}