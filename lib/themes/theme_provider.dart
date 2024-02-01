import 'package:flutter/material.dart';
import 'package:musicplayer/themes/dark.dart';
import 'package:musicplayer/themes/light.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _themeData = LightMode;
  ThemeData get themeData => _themeData;

  bool get isDarkMode => _themeData == themeData;

  set themeData(themeData) {
    _themeData = themeData;
    //update ui
    notifyListeners();
  }

  void toggleTheme() {
    if (_themeData == LightMode) {
      themeData = DarkMode;
    } else {
      themeData = LightMode;
    }
  }
}
