import 'dart:convert';

import 'package:http/http.dart' as http;

class ApiClient {
  static const baseURL = 'https://hermesback.glitch.me';

  static Future<http.Response> post<T>(String relURL, T jsonBody) async {
    return http.post(
        Uri.parse('$baseURL/$relURL'),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},
        body: jsonEncode(jsonBody)
    );
  }
}