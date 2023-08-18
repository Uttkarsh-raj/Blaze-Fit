import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class Assessmenthandler {
  static Future<String> getResponse(
      int age, int sleepQuality, String gender, int duration) async {
    try {
      print('here');
      // var uri = Uri.parse('http://172.25.4.189:5500/api/v1/sleepModel');
      var uri = Uri.parse('https://open-fit-api.vercel.app/api/v1/sleepModel');
      var res = await http.post(
        uri,
        body: jsonEncode(<String, dynamic>{
          "age": 25,
          "Sleep_Duration": 5,
          "Quality_of_Sleep": 10,
          "Stress_Level": 5,
          "Gender": "Male",
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(const Duration(seconds: 30));
      var data = jsonDecode(res.body);
      print('data...$data');
      if (res.statusCode != 200) {
        throw data['message'];
      }
      if (data['success'] == true) {
        return data['result'];
      } else {
        return 'Some Error Occurred !!';
      }
    } catch (e) {
      log("An error occured $e.");
      throw e.toString();
    }
  }

  static Future<String> getKidneyResponse(int age, String smoke, String gender,
      String alcohol, String diabetic, int sleepTime) async {
    try {
      print('here');
      // var uri = Uri.parse('http://172.25.4.189:5500/api/v1/sleepModel');
      var uri = Uri.parse('https://open-fit-api.vercel.app/api/v1/kidneyModel');
      var res = await http.post(
        uri,
        body: jsonEncode(<String, dynamic>{
          "age": age,
          "smoke": smoke,
          "sleepTime": sleepTime,
          "diabetic": diabetic,
          "sex": gender,
          "alcohol": alcohol,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(const Duration(seconds: 30));
      var data = jsonDecode(res.body);
      print('data...$data');
      if (res.statusCode != 200) {
        throw data['message'];
      }
      if (data['success'] == true) {
        return data['result'];
      } else {
        return 'Some Error Occurred !!';
      }
    } catch (e) {
      log("An error occured $e.");
      throw e.toString();
    }
  }

  static Future<String> getHeartResponse(int age, String smoke, String gender,
      String alcohol, String diabetic, int sleepTime) async {
    try {
      print('here');
      // var uri = Uri.parse('http://172.25.4.189:5500/api/v1/sleepModel');
      var uri = Uri.parse('https://open-fit-api.vercel.app/api/v1/heartModel');
      var res = await http.post(
        uri,
        body: jsonEncode(<String, dynamic>{
          "age": age,
          "smoke": smoke,
          "sleepTime": sleepTime,
          "diabetic": diabetic,
          "sex": gender,
          "alcohol": alcohol,
        }),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
      ).timeout(const Duration(seconds: 30));
      var data = jsonDecode(res.body);
      print('data...$data');
      if (res.statusCode != 200) {
        throw data['message'];
      }
      if (data['success'] == true) {
        return data['result'];
      } else {
        return 'Some Error Occurred !!';
      }
    } catch (e) {
      log("An error occured $e.");
      throw e.toString();
    }
  }
}
