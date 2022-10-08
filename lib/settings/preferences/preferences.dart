import 'package:flutter/material.dart';
import 'package:senacor_devcon_mysafe/settings/preferences/preference_service.dart';

class Preferences with ChangeNotifier {
  PreferenceService themePreferences = PreferenceService();
  bool _isDarkMode = false;

  bool get isDarkMode => _isDarkMode;

  set darkMode(bool value) {
    _isDarkMode = value;
    themePreferences.setDarkTheme(value);
    notifyListeners();
  }
}
