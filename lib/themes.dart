import 'package:flutter/material.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier {
  static bool isDarkTheme = true;

  ThemeMode get currentTheme => isDarkTheme ? ThemeMode.dark : ThemeMode.light;

  void toggleTheme() {
    isDarkTheme = !isDarkTheme;
    notifyListeners();
  }

  static ThemeData get lightTheme {
    return ThemeData(
      primaryColor: Colors.blue.shade300,
      scaffoldBackgroundColor: Colors.grey.shade100,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue.shade300,
        titleTextStyle: TextStyle(color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(color: Colors.grey.shade900),
        displayMedium: TextStyle(color: Colors.grey.shade900),
        displaySmall: TextStyle(color: Colors.grey.shade900),
        headlineLarge: TextStyle(color: Colors.blue.shade900),
        headlineMedium: TextStyle(color: Colors.blue.shade900),
        headlineSmall: TextStyle(color: Colors.blue.shade900),
        bodyLarge: TextStyle(color: Colors.grey.shade900),
        bodyMedium: TextStyle(color: Colors.grey.shade900),
        bodySmall: TextStyle(color: Colors.grey.shade900),
      ),
    );
  }


  static ThemeData get darkTheme {
    return ThemeData(
      primaryColor: Colors.blue.shade800,
      scaffoldBackgroundColor: Colors.grey.shade900,
      appBarTheme: AppBarTheme(
        backgroundColor: Colors.blue.shade800,
        titleTextStyle: TextStyle(color: Colors.white),
        iconTheme: IconThemeData(color: Colors.white),
      ),
      textTheme: TextTheme(
        displayLarge: TextStyle(color: Colors.grey.shade300),
        displayMedium: TextStyle(color: Colors.grey.shade300),
        displaySmall: TextStyle(color: Colors.grey.shade300),
        headlineLarge: TextStyle(color: Colors.blue.shade300),
        headlineMedium: TextStyle(color: Colors.blue.shade300),
        headlineSmall: TextStyle(color: Colors.blue.shade300),
        bodyLarge: TextStyle(color: Colors.grey.shade300),
        bodyMedium: TextStyle(color: Colors.grey.shade300),
        bodySmall: TextStyle(color: Colors.grey.shade300),
      ),
    );
  }
}