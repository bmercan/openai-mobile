import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class MyThemes {
  static final darkTheme = ThemeData(
    progressIndicatorTheme:
        const ProgressIndicatorThemeData(circularTrackColor: Colors.black),
    bottomSheetTheme: const BottomSheetThemeData(backgroundColor: Colors.black),
    checkboxTheme: const CheckboxThemeData(
      fillColor: MaterialStatePropertyAll(Colors.white),
      checkColor: MaterialStatePropertyAll(
        Colors.black,
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme(
      suffixIconColor: Colors.white,
      contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
      enabledBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white30, width: 2.0),
      ),
      focusedBorder: UnderlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 2.0),
      ),
      labelStyle: TextStyle(
        letterSpacing: 3,
        fontWeight: FontWeight.w400,
        color: Colors.white70,
      ),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
            shape: const ContinuousRectangleBorder(),
            textStyle: const TextStyle(fontSize: 18, letterSpacing: 2),
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            backgroundColor: Colors.white,
            side: const BorderSide(color: Colors.black, width: 2.5))),
    fontFamily: 'Oswald',
    appBarTheme: const AppBarTheme(
      systemOverlayStyle: SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark,
        statusBarBrightness: Brightness.dark,
      ),
      centerTitle: true,
      elevation: 0,
      color: Colors.transparent,
      foregroundColor: Colors.white,
    ),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
      selectedLabelStyle: TextStyle(color: Colors.white),
      selectedIconTheme: IconThemeData(color: Colors.white, shadows: [
        BoxShadow(
          color: Colors.white,
          blurRadius: 30,
          spreadRadius: 0.5,
        )
      ]),
      backgroundColor: Colors.black,
    ),
    scaffoldBackgroundColor: Colors.black,
    colorScheme:
        ColorScheme.dark(tertiary: Colors.black.withOpacity(.2)).copyWith(
      secondary: Colors.white,
      primary: Colors.white,
      secondaryContainer: const Color(0xff33313a),
      shadow: Colors.grey.shade900,
    ),
    textTheme: const TextTheme(
      titleMedium: TextStyle(
        fontWeight: FontWeight.bold,
        letterSpacing: 3,
        fontSize: 24,
        color: Colors.white,
      ),
    ),
  );
  static final lightTheme = ThemeData(
      fontFamily: 'Oswald',
      progressIndicatorTheme:
          const ProgressIndicatorThemeData(circularTrackColor: Colors.black),
      inputDecorationTheme: const InputDecorationTheme(
        suffixIconColor: Colors.black,
        contentPadding: EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(color: Colors.black, width: 2.0),
        ),
        labelStyle: TextStyle(
          letterSpacing: 3,
          fontWeight: FontWeight.w400,
          color: Colors.black,
        ),
      ),
      elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.white,
          shape: const ContinuousRectangleBorder(),
          textStyle: const TextStyle(fontSize: 18, letterSpacing: 2),
          padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
          backgroundColor: Colors.black,
          side: const BorderSide(color: Colors.black, width: 2.5),
        ),
      ),
      appBarTheme: const AppBarTheme(
          systemOverlayStyle: SystemUiOverlayStyle(
            statusBarIconBrightness: Brightness.light,
            statusBarBrightness: Brightness.light,
          ),
          centerTitle: true,
          elevation: 0,
          color: Colors.transparent,
          foregroundColor: Colors.black),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Colors.white,
          unselectedItemColor: Colors.black54,
          selectedLabelStyle: TextStyle(color: Colors.black),
          selectedIconTheme: IconThemeData(color: Colors.black)),
      scaffoldBackgroundColor: Colors.white,
      colorScheme:
          ColorScheme.light(tertiary: Colors.white.withOpacity(1)).copyWith(
        secondary: Colors.black,
        primary: Colors.black,
        shadow: Colors.grey.shade900,
      ),
      textTheme: const TextTheme(
        titleMedium: TextStyle(
          fontWeight: FontWeight.bold,
          letterSpacing: 3,
          fontSize: 24,
          color: Colors.black,
        ),
      ),
      listTileTheme: const ListTileThemeData(textColor: Colors.black));
}
