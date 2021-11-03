import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  static const baseURL = 'https://hermessengerr.herokuapp.com';

  static Future<http.Response> post<T>(String relURL, T jsonBody) async {
    return http.post(
        Uri.parse('$baseURL/$relURL'),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},
        body: jsonEncode(jsonBody)
    );
  }
}