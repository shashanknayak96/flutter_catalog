import "package:flutter/material.dart";
import 'package:google_fonts/google_fonts.dart';

class CustomTheme {
  static ThemeData lightTheme(BuildContext context) => ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: GoogleFonts.poppins().fontFamily,
        appBarTheme: AppBarTheme(
          color: Colors.white,
          elevation: 0.0,
          iconTheme: IconThemeData(
            color: Colors.black,
          ),
        ),
      );

  static ThemeData darkTheme(BuildContext context) =>
      ThemeData(brightness: Brightness.dark);
  static Color whitishGrey = Color(0xfff5f5f5);
  static Color bluishGrey = Color(0xff403b58);
}
