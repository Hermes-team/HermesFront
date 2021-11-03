import 'package:shared_preferences/shared_preferences.dart';

class Storage {
  static void saveTokens(String token, String selector) {
    SharedPreferences.getInstance().then((prefs) {
      prefs.setString("token", token);
      prefs.setString("tokenSelector", selector);
    });
  }
  static Future<bool> hasToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.containsKey("token");
  }
}