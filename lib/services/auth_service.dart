import 'package:front/ApiClient/api_client.dart';
import 'package:front/models/register_model.dart';
import 'package:front/models/login_model.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

class AuthService {
  static const session = FlutterSecureStorage();

  static Future<dynamic> register(RegisterModel req) async {
    try {
      var res = await ApiClient.post<RegisterModel>('register', req);
      return res.body;
    } catch (error) {
      rethrow;
    }
  }

  //TODO: save token etc. to session
  static Future<dynamic> login(LoginModel req) async {
    try {
      var res = await ApiClient.post<LoginModel>('login', req);
      return res.body;
    } catch (error) {
      rethrow;
    }
  }
}