import 'package:flutter/material.dart';

class ThemeProvider extends ChangeNotifier {
  ThemeData _currentTheme;
  bool _isDarkMode;

  ThemeProvider({bool isDarkMode = false})
      : _isDarkMode = isDarkMode,
        _currentTheme = isDarkMode ? _darkTheme : _lightTheme;

  bool get isDarkMode => _isDarkMode;
  ThemeData get currentTheme => _currentTheme;

  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    _currentTheme = _isDarkMode ? _darkTheme : _lightTheme;
    notifyListeners();
  }

  // Definimos el tema de día
  static final ThemeData _lightTheme = ThemeData(
    brightness: Brightness.light,
    primaryColor: Colors.teal,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: const AppBarTheme(color: Colors.teal),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: const Color.fromARGB(255, 3, 148, 128),
      selectedItemColor: const Color.fromARGB(255, 12, 79, 71),
      unselectedItemColor: const Color.fromARGB(255, 255, 255, 255),
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.teal[50],
    ),
  );

  // Definimos el tema de noche
  static final ThemeData _darkTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColor: Colors.blueGrey[900],
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(color: Colors.blueGrey[900]),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: Colors.blueGrey[800],
      selectedItemColor: Colors.tealAccent,
      unselectedItemColor: Colors.blueGrey[300],
    ),
    drawerTheme: DrawerThemeData(
      backgroundColor: Colors.blueGrey[850],
    ),
  );
}
