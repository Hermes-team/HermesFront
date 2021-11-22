import 'package:front/models/req/socket_auth.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static Future<void> saveTokens(String token, String selector) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
    prefs.setString("tokenSelector", selector);
  }

  static Future<bool> hasToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey("token");
  }

  static Future<SocketAuthReq> getTokens() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return SocketAuthReq(selector: prefs.getString("tokenSelector")!, token: prefs.getString("token")!);
  }

  static Future<void> removeTokens() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    prefs.remove("tokenSelector");
  }
}