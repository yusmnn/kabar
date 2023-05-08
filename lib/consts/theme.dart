import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'color.dart';

class StyleTheme {
  static ThemeData themeData() {
    return ThemeData(
      useMaterial3: true,
      primarySwatch: Colors.blue,
      primaryColor: blue1,
      fontFamily: GoogleFonts.poppins().fontFamily,
      textTheme: GoogleFonts.poppinsTextTheme().copyWith(
        titleLarge: TextStyle(
          fontSize: 24,
          color: grey1,
          fontWeight: FontWeight.w700,
          letterSpacing: 1,
        ),
        titleMedium: TextStyle(
          fontSize: 18,
          color: grey1,
          fontWeight: FontWeight.w700,
          letterSpacing: 1,
        ),
        bodySmall: const TextStyle(
          fontSize: 11,
          fontWeight: FontWeight.w400,
          color: Colors.black54,
        ),
        bodyMedium: const TextStyle(
          fontSize: 14,
          fontWeight: FontWeight.w500,
          color: Colors.black,
        ),
        labelMedium: TextStyle(
          color: grey1,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
      ),
      appBarTheme: AppBarTheme(
        color: primaryColor,
        elevation: 0,
        titleTextStyle: TextStyle(
          color: grey1,
          fontSize: 24,
          fontWeight: FontWeight.w700,
        ),
      ),
      scaffoldBackgroundColor: primaryColor,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        elevation: 0,
        backgroundColor: primaryColor,
        selectedItemColor: blue1,
        unselectedItemColor: grey1,
        showUnselectedLabels: true,
      ),
    );
  }
}
