import 'package:shared_preferences/shared_preferences.dart';

class PreferenceService {
  static const darkTheme = "THEMESTATUS";

  setDarkTheme(bool value) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(darkTheme, value);
  }

  Future<bool> hasDarkThemePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(darkTheme) ?? false;
  }
}
