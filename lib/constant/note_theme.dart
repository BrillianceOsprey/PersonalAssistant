import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoteTheme {
  // 1
  static TextTheme lightTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
        fontSize: 14.0, fontWeight: FontWeight.w700, color: Colors.black),
    headline1: GoogleFonts.openSans(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.black),
    headline2: GoogleFonts.openSans(
        fontSize: 21.0, fontWeight: FontWeight.w700, color: Colors.black),
    headline3: GoogleFonts.openSans(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.black),
    headline6: GoogleFonts.openSans(
        fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.black),
  );
  // 2
  static TextTheme darkTextTheme = TextTheme(
    bodyText1: GoogleFonts.openSans(
        fontSize: 14.0, fontWeight: FontWeight.w600, color: Colors.white),
    headline1: GoogleFonts.openSans(
        fontSize: 32.0, fontWeight: FontWeight.bold, color: Colors.white),
    headline2: GoogleFonts.openSans(
        fontSize: 21.0, fontWeight: FontWeight.w700, color: Colors.white),
    headline3: GoogleFonts.openSans(
        fontSize: 16.0, fontWeight: FontWeight.w600, color: Colors.white),
    headline6: GoogleFonts.openSans(
        fontSize: 20.0, fontWeight: FontWeight.w600, color: Colors.white),
  );
  // 3
  static ThemeData light() {
    return ThemeData(
      brightness: Brightness.light,
      primaryColor: const Color(0xFF6C63FA),
      textSelectionTheme:
          const TextSelectionThemeData(selectionColor: Colors.green),
      textTheme: lightTextTheme,
      colorScheme: ColorScheme.fromSwatch().copyWith(secondary: Colors.black),
    );
  }

  // 4
  static ThemeData dark() {
    return ThemeData(
      brightness: Brightness.dark,
      primaryColor: Colors.grey[900],
      textTheme: darkTextTheme,
      colorScheme:
          ColorScheme.fromSwatch().copyWith(secondary: Colors.green[600]),
    );
  }

  static var mainTextColor = Colors.white;
  static var mainBgColor = Colors.white;
  static var mainIconColor = Colors.white;
  static var purpleAccentColor = const Color(0xFF6C63FA);
  static var purpleAccentLightColor = const Color(0xFF7d75fA);
  static var purpleAccentMiddleColor = const Color(0xFF9d96fA);
  static var greenAccentColor = Colors.greenAccent;
  static var redAccentColor = Colors.redAccent;
  static var hovertextColor = Colors.black.withOpacity(0.3);
  static var blacktextColor = Colors.black.withOpacity(0.8);
  static var textBlackColor = Colors.black;
}
