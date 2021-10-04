import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  bool _isLight = true;
  ThemeMode _mode = ThemeMode.light;

  ThemeMode get mode => _mode;
  bool get isLight => _isLight;

  void theme() {
    if (_isLight == true) {
      _mode = ThemeMode.light;
      notifyListeners();
    } else {
      _mode = ThemeMode.dark;
      notifyListeners();
    }
  }

  void changeBool() {
    _isLight = !_isLight;
    notifyListeners();
  }
}
