import 'package:front/api_client//api_client.dart';
import 'package:front/models/req/login_req.dart';
import 'package:front/models/req/register_req.dart';

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