import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

CustomTheme currentTheme = CustomTheme();

class CustomTheme with ChangeNotifier{
  static bool _isDarkTheme = false;
  ThemeMode get currentTheme => _isDarkTheme ? ThemeMode.dark : ThemeMode.light;
  void toggleTheme(){
    _isDarkTheme = !_isDarkTheme;
    notifyListeners();
  }
  static ThemeData get lightTheme{
    return ThemeData(
      primaryColor: const Color(0xFF5BA66E),
      backgroundColor: Colors.white,
      scaffoldBackgroundColor: Colors.white,
      appBarTheme:  AppBarTheme(
        backgroundColor: const Color(0xFF69BF6F),
        titleTextStyle: GoogleFonts.kanit(),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFF3e688c),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF3e688c),
        foregroundColor: Colors.white70,
        hoverColor: Color(0xff548dc2),
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
              Radius.circular(20.0),
          ),
          borderSide: BorderSide(
            color: const Color(0xff274459),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          borderSide: BorderSide(
            color: const Color(0xff274459),
          ),
        ),
        labelStyle: GoogleFonts.kanit(
            color: const Color(0xff274459),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          primary: Color(0xFF3e688c),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0)
          )
        ),
      ),
      textButtonTheme: TextButtonThemeData(
        style: TextButton.styleFrom(
          primary: Color(0xFF3e688c),
        )
      )
    );
  }
  static ThemeData get darkTheme{
    return ThemeData(
      primaryColor: const Color(0xFF5BA66E),
      backgroundColor: Colors.black26,
      scaffoldBackgroundColor: Colors.black26,
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF69BF6F),
        titleTextStyle: GoogleFonts.kanit(),
      ),
      buttonTheme: const ButtonThemeData(
        buttonColor: Color(0xFF3e688c),
      ),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        backgroundColor: Color(0xFF3e688c),
        foregroundColor: Colors.white70,
        hoverColor: Color(0xff548dc2),
      ),
      textSelectionTheme: TextSelectionThemeData(
        cursorColor: const Color(0xff274459),
      ),
      inputDecorationTheme: InputDecorationTheme(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          borderSide: BorderSide(
            color: const Color(0xff274459),
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.all(
            Radius.circular(20.0),
          ),
          borderSide: BorderSide(
            color: const Color(0xff274459),
          ),
        ),
        labelStyle: GoogleFonts.kanit(
          color: const Color(0xff274459),
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            primary: Color(0xFF3e688c),
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.0)
            )
        ),
      ),
    );
  }
}