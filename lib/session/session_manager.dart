import 'package:shared_preferences/shared_preferences.dart';

class SessionManager {
  int? value;
  String? id;

  static Future<void> saveSession(int value, String idUser) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt("value", value);
    prefs.setString("id", idUser);
  }

  Future loadSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
   value = prefs.getInt("value");
    id = prefs.getString("id");
    return value;
  }

  static Future<void> clearSession() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.clear();
  }
}

SessionManager sessionManager = SessionManager();