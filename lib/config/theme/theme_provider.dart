import 'package:flutter/material.dart';

import 'package:shared_preferences/shared_preferences.dart';

class CustomThemeProvider extends ChangeNotifier {
  bool get isDarkMode => themeMode == ThemeMode.dark;

  ThemeMode _themeMode =
      ThemeMode.light; // Изначально используем системную тему

  CustomThemeProvider() {
    loadThemeMode(); // Загружаем сохраненную тему при создании объекта
  }

  ThemeMode get themeMode => _themeMode;

  set themeMode(ThemeMode mode) {
    _themeMode = mode;
    saveThemeMode(); // Сохраняем выбранную тему при изменении
    notifyListeners(); // Уведомляем слушателей об изменении темы
  }

  // Метод для загрузки сохраненной темы из SharedPreferences
  void loadThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    final themeModeIndex = prefs.getInt('is_night_mode');
    if (themeModeIndex != null) {
      _themeMode = ThemeMode.values[themeModeIndex];
      notifyListeners(); // Уведомляем слушателей об изменении темы
    }
  }

  // Метод для сохранения текущей темы в SharedPreferences
  void saveThemeMode() async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setInt('is_night_mode', _themeMode.index);
  }
}

class MyThemes {
  static final darkTheme = ThemeData(
      // brightness: Brightness.dark,
      // scaffoldBackgroundColor: mainDarkClr,
      // primaryColor: lightGrayClr,
      // colorScheme: ColorScheme.dark(
      //   primary: darkLightThemeClr,
      //   primaryContainer: darkThemeClr,
      //   secondary: darkLightThemeClr,
      //   secondaryContainer: darkThemeClr,
      // ),
      // iconTheme: IconThemeData(color: lightGrayClr),
      // textTheme: TextTheme(
      //   titleLarge: TextStyle(
      //     color: whiteClr,
      //     fontFamily: fontFutura,
      //     fontWeight: FontWeight.normal,
      //   ),
      //   displayLarge: TextStyle(
      //     color: darkLightThemeClr,
      //     fontFamily: fontApp,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   headlineSmall: TextStyle(
      //     color: darkLightThemeClr,
      //     fontFamily: fontApp,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   bodyMedium: TextStyle(
      //     color: lightGrayClr,
      //     fontFamily: fontApp,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   bodySmall: TextStyle(
      //     color: darkLightThemeClr,
      //     fontFamily: fontApp,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
      );

  static final lightTheme = ThemeData(
      // brightness: Brightness.light,
      // scaffoldBackgroundColor: whiteClr,
      // primaryColor: mainDarkClr,
      // colorScheme: ColorScheme.light(
      //   primary: mainDarkClr,
      //   primaryContainer: lightGrayClr,
      //   secondary: darkGrayClr,
      //   secondaryContainer: whiteClr,
      // ),
      // iconTheme: IconThemeData(
      //   color: mainDarkClr,
      // ),
      // textTheme: TextTheme(
      //   titleLarge: const TextStyle(
      //     color: Color(0xFF676767),
      //     fontFamily: fontFutura,
      //   ),
      //   displayLarge: TextStyle(
      //     color: mainDarkClr,
      //     fontFamily: fontApp,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   headlineSmall: TextStyle(
      //     color: darkGrayClr,
      //     fontFamily: fontApp,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   bodyMedium: TextStyle(
      //     color: mainDarkClr,
      //     fontFamily: fontApp,
      //     fontWeight: FontWeight.bold,
      //   ),
      //   bodySmall: TextStyle(
      //     color: darkGrayClr,
      //     fontFamily: fontApp,
      //     fontWeight: FontWeight.bold,
      //   ),
      // ),
      );
}
