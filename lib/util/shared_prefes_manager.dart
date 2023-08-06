import 'package:shared_preferences/shared_preferences.dart';

class SharedPrefsManager {
  static late SharedPreferences prefs;

  static Future<void> initializeSharedPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  // language
  static String getLanguage() {
    return prefs.getString("language") ?? "en";
  }

  static void setLanguage(String language) {
    prefs.setString("language", language);
  }
}
