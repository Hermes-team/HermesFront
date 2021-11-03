import 'package:http/http.dart' as http;
import 'dart:convert';

class ApiClient {
  static const baseURL = 'http://localhost:4000';

  static post<T>(String relURL, T jsonBody) {
    http.post(
        Uri.parse('$baseURL/$relURL'),
        headers: <String, String>{'Content-Type': 'application/json; charset=UTF-8',},
        body: jsonEncode(jsonBody)
    );
  }
}