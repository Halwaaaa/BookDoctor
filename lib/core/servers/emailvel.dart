import 'dart:convert';

import 'package:email_otp/email_otp.dart';
import 'package:http/http.dart' as http;

class emailVal {
  static Future<void> send() async {
    dynamic u = EmailOTP().setConfig(
        appName: 'App Name',
        otpType: OTPType.mixed,
        appEmail: 'halwadev@gmail.com',
        otpLength: 6,
        userEmail: 'halwadev@gmail.com');
    EmailOTP().sendOTP().then((value) {
      print("kkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkkk$value");
    }).catchError((g) {
      print(g);
    });
    dynamic i = EmailOTP().verifyOTP(otp: u);
    print(
        "hhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhhh${EmailOTP().sendOTP().toString()}");
    print(i);
  }

  void ver() {
    Future<dynamic> sendOTP() async {
      var url = Uri.parse('https://email-otp.api.rohitchouhan.com/v2/');
      Map<String, dynamic> body = {
        "user_email": "halwadev@gmail.com",
      };
      http.Response response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: json.encode(body),
      );
      try {
        if (response.statusCode == 200) {
          String data = response.body;
          var decodedData = jsonDecode(data);
          if (decodedData['status'] == true) {
            return true;
          } else {
            String errorMessage = decodedData[
                'message']; // Assuming the error message key is 'message'
            throw Exception(
                errorMessage); // Throwing an error with the response message
          }
        } else {
          throw Exception('Failed to load data: ${response.statusCode}');
        }
      } catch (e) {
        return false;
      }
    }
  }
}
