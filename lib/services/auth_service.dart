import 'package:front/ApiClient/api_client.dart';
import 'package:front/models/req/login_model.dart';
import 'package:front/models/req/register_model.dart';

class AuthService {
  static Future<dynamic> register(RegisterReq req) async {
    try {
      var res = await ApiClient.post<RegisterReq>('register', req);
      return res.body;
    } catch (error) {
      rethrow;
    }
  }

  static Future<dynamic> login(LoginReq req) async {
    try {
      var res = await ApiClient.post<LoginReq>('login', req);
      return res.body;
    } catch (error) {
      rethrow;
    }
  }
}