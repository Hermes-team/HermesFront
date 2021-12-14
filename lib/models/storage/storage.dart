import 'package:front/models/req/socket_auth_req.dart';
import 'package:front/models/res/login_res.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../user_data.dart';

class Storage {
  static Future<void> saveTokens(String token, String selector) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", token);
    prefs.setString("tokenSelector", selector);
  }

  static Future<void> saveUser(LoginRes r) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("token", r.token!);
    prefs.setString("tokenSelector", r.selector!);
    prefs.setString("nickname", r.nickname!);
    prefs.setInt("tag", r.tag!);
    prefs.setString("uniqid", r.uniqid!);
  }

  static Future<bool> hasToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey("token") && prefs.containsKey("uniqid");
  }

  static Future<SocketAuthReq> getTokens() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return SocketAuthReq(selector: prefs.getString("tokenSelector")!, token: prefs.getString("token")!);
  }

  static Future<UserData> getUserData() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  return UserData(nickname: prefs.getString("nickname")!, tag: prefs.getInt("tag")!);
}

  static Future<String?> getUniqid() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString("uniqid");
  }

  static Future<void> removeTokens() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.remove("token");
    prefs.remove("tokenSelector");
    prefs.remove("uniqid");
  }
}