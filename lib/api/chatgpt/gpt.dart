import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class ApiHandler {
  static Future<String> getResponse(String? query) async {
    try {
      print('here');
      var uri = Uri.parse('http://172.25.4.189:5500/api/v1/generate');
      var res = await http.post(uri, body: {
        "query": query,
      }).timeout(const Duration(seconds: 120));
      var data = jsonDecode(res.body);
      print('data...$data');
      if (res.statusCode != 200) {
        throw data['message'];
      }
      return data['output'];
    } catch (e) {
      log("An error occured $e.");
      throw e.toString();
    }
  }
}
