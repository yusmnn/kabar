import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Color backgroundColor = const Color(0xFFffffff);
Color primaryColor = const Color(0xFF1877F2);
Color blue1 = const Color(0xff1877F2);
Color grey1 = const Color(0xff4E4B66);

ThemeData theme() {
  return ThemeData(
    primarySwatch: Colors.blue,
    primaryColor: primaryColor,
    textTheme: GoogleFonts.poppinsTextTheme(),
    appBarTheme: AppBarTheme(
      backgroundColor: backgroundColor,
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: backgroundColor,
      selectedItemColor: blue1,
      unselectedItemColor: grey1,
      showUnselectedLabels: true,
    ),
  );
}
